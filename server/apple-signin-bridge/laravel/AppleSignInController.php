<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use Firebase\JWT\JWK;
use Firebase\JWT\JWT;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use RuntimeException;

/**
 * Sign in with Apple -> Shopify bridge.
 *
 * The mobile app performs Sign in with Apple natively and posts the resulting
 * identity token here. We verify it against Apple's public keys, map the Apple
 * account onto a Shopify customer, and return a Storefront API customer access
 * token — the same credential the app's classic Shopify login produces, so
 * nothing downstream needs to know Apple was involved.
 *
 * Why this exists: Shopify's hosted customer accounts page offers Google and
 * Facebook but has no Sign in with Apple, and the Customer Account API cannot
 * exchange a third-party identity token for a session. App Store guideline 4.8
 * requires an Apple option alongside those providers.
 */
class AppleSignInController extends Controller
{
    private const SHOPIFY_API_VERSION = '2025-07';
    private const APPLE_ISSUER = 'https://appleid.apple.com';
    private const APPLE_KEYS_URL = 'https://appleid.apple.com/auth/keys';

    public function __invoke(Request $request): JsonResponse
    {
        $data = $request->validate([
            'identityToken' => ['required', 'string'],
            'firstName' => ['nullable', 'string', 'max:100'],
            'lastName' => ['nullable', 'string', 'max:100'],
        ]);

        try {
            $claims = $this->verifyIdentityToken($data['identityToken']);
        } catch (\Throwable $e) {
            Log::warning('[apple-signin] token rejected: '.$e->getMessage());

            return response()->json(['message' => 'Invalid Apple identity token.'], 401);
        }

        $appleUserId = $claims['sub'] ?? null;
        $email = $claims['email'] ?? null;

        // A user who hides their email still yields a @privaterelay.appleid.com
        // address, so a missing email means the app requested the token without
        // the email scope — a misconfiguration, not a user choice.
        if (! $appleUserId || ! $email) {
            return response()->json(['message' => 'Apple did not return an email address.'], 400);
        }

        $password = $this->derivePassword($appleUserId);

        try {
            // Returning user whose password we already own.
            $token = $this->createAccessToken($email, $password);

            if (! $token) {
                $errors = $this->createCustomer(
                    $email,
                    $password,
                    $data['firstName'] ?? null,
                    $data['lastName'] ?? null
                );

                $taken = collect($errors)->contains(fn ($error) => ($error['code'] ?? null) === 'TAKEN');

                if ($taken) {
                    // Pre-existing account: Shopify's email OTP flow, web
                    // checkout, or an imported list. Take ownership of the
                    // password so Apple sign-in works from here on.
                    if (! $this->resetCustomerPassword($email, $password)) {
                        return response()->json(['message' => 'Could not link this Apple account.'], 409);
                    }
                } elseif (! empty($errors)) {
                    Log::warning('[apple-signin] customerCreate', $errors);

                    return response()->json(['message' => $errors[0]['message'] ?? 'Sign in with Apple failed.'], 400);
                }

                $token = $this->createAccessToken($email, $password);
            }

            if (! $token) {
                return response()->json(['message' => 'Could not start a Shopify session.'], 500);
            }

            return response()->json([
                'accessToken' => $token['accessToken'],
                'expiresAt' => $token['expiresAt'],
            ]);
        } catch (\Throwable $e) {
            Log::error('[apple-signin] failed: '.$e->getMessage());

            return response()->json(['message' => 'Sign in with Apple failed.'], 500);
        }
    }

    /**
     * Verify the JWT signature against Apple's published keys and confirm the
     * token was issued by Apple for this app.
     *
     * @return array<string, mixed>
     */
    private function verifyIdentityToken(string $identityToken): array
    {
        $keys = Cache::remember('apple_signin_jwks', now()->addHours(12), function () {
            $response = Http::timeout(10)->get(self::APPLE_KEYS_URL);

            if (! $response->successful()) {
                throw new RuntimeException('Could not fetch Apple public keys.');
            }

            return $response->json();
        });

        $claims = (array) JWT::decode($identityToken, JWK::parseKeySet($keys));

        // php-jwt validates the signature and expiry but not these two.
        if (($claims['iss'] ?? null) !== self::APPLE_ISSUER) {
            throw new RuntimeException('Unexpected issuer.');
        }

        $audience = $claims['aud'] ?? null;
        $expected = config('services.apple.bundle_id');

        if (! $expected || $audience !== $expected) {
            throw new RuntimeException('Unexpected audience.');
        }

        return $claims;
    }

    /**
     * Deterministic Shopify password for an Apple account.
     *
     * Apple never gives us a password and the app must sign the same person in
     * on every launch, so the password is an HMAC of the stable Apple user id.
     * The suffix guarantees Shopify's complexity rules are met.
     *
     * The signing secret must never be rotated — every Apple user's Shopify
     * password derives from it, so a new value locks all of them out.
     */
    private function derivePassword(string $appleUserId): string
    {
        $secret = config('services.apple.bridge_secret');

        if (! $secret) {
            throw new RuntimeException('APPLE_BRIDGE_SECRET is not configured.');
        }

        $digest = rtrim(strtr(base64_encode(hash_hmac('sha256', $appleUserId, $secret, true)), '+/', '-_'), '=');

        return substr($digest, 0, 30).'Aa1!';
    }

    /**
     * @return array{accessToken: string, expiresAt: string}|null
     */
    private function createAccessToken(string $email, string $password): ?array
    {
        $query = <<<'GRAPHQL'
        mutation customerAccessTokenCreate($input: CustomerAccessTokenCreateInput!) {
          customerAccessTokenCreate(input: $input) {
            customerAccessToken { accessToken expiresAt }
            customerUserErrors { code field message }
          }
        }
        GRAPHQL;

        $data = $this->storefrontGraphql($query, [
            'input' => ['email' => $email, 'password' => $password],
        ]);

        return $data['customerAccessTokenCreate']['customerAccessToken'] ?? null;
    }

    /**
     * @return array<int, array<string, mixed>> customerUserErrors, empty on success
     */
    private function createCustomer(string $email, string $password, ?string $firstName, ?string $lastName): array
    {
        $query = <<<'GRAPHQL'
        mutation customerCreate($input: CustomerCreateInput!) {
          customerCreate(input: $input) {
            customer { id }
            customerUserErrors { code field message }
          }
        }
        GRAPHQL;

        $input = [
            'email' => $email,
            'password' => $password,
            'acceptsMarketing' => false,
        ];

        // Apple only returns the name on the very first authorization.
        if ($firstName) {
            $input['firstName'] = $firstName;
        }
        if ($lastName) {
            $input['lastName'] = $lastName;
        }

        $data = $this->storefrontGraphql($query, ['input' => $input]);

        return $data['customerCreate']['customerUserErrors'] ?? [];
    }

    /**
     * Set the derived password on a customer that already exists.
     *
     * Admin REST is used because the password field is not exposed on the Admin
     * GraphQL customerUpdate mutation. Taking over the password is safe here
     * only because Apple has already verified ownership of the email address.
     */
    private function resetCustomerPassword(string $email, string $password): bool
    {
        $query = <<<'GRAPHQL'
        query findCustomer($query: String!) {
          customers(first: 1, query: $query) {
            edges { node { id } }
          }
        }
        GRAPHQL;

        $data = $this->adminGraphql($query, [
            'query' => "email:'".str_replace("'", "\\'", $email)."'",
        ]);

        $gid = $data['customers']['edges'][0]['node']['id'] ?? null;

        if (! $gid) {
            return false;
        }

        $customerId = (int) basename($gid);
        $domain = config('services.shopify.domain');

        $response = Http::withHeaders([
            'X-Shopify-Access-Token' => config('services.shopify.admin_token'),
        ])->timeout(20)->put(
            "https://{$domain}/admin/api/".self::SHOPIFY_API_VERSION."/customers/{$customerId}.json",
            [
                'customer' => [
                    'id' => $customerId,
                    'password' => $password,
                    'password_confirmation' => $password,
                ],
            ]
        );

        if (! $response->successful()) {
            throw new RuntimeException('Admin customer update failed: '.$response->body());
        }

        return true;
    }

    /**
     * @param  array<string, mixed>  $variables
     * @return array<string, mixed>
     */
    private function storefrontGraphql(string $query, array $variables): array
    {
        $domain = config('services.shopify.domain');

        $response = Http::withHeaders([
            'X-Shopify-Storefront-Access-Token' => config('services.shopify.storefront_token'),
        ])->timeout(20)->post(
            "https://{$domain}/api/".self::SHOPIFY_API_VERSION.'/graphql.json',
            ['query' => $query, 'variables' => $variables]
        );

        return $this->unwrapGraphql($response->json(), 'Storefront');
    }

    /**
     * @param  array<string, mixed>  $variables
     * @return array<string, mixed>
     */
    private function adminGraphql(string $query, array $variables): array
    {
        $domain = config('services.shopify.domain');

        $response = Http::withHeaders([
            'X-Shopify-Access-Token' => config('services.shopify.admin_token'),
        ])->timeout(20)->post(
            "https://{$domain}/admin/api/".self::SHOPIFY_API_VERSION.'/graphql.json',
            ['query' => $query, 'variables' => $variables]
        );

        return $this->unwrapGraphql($response->json(), 'Admin');
    }

    /**
     * @param  array<string, mixed>|null  $body
     * @return array<string, mixed>
     */
    private function unwrapGraphql(?array $body, string $label): array
    {
        if (! empty($body['errors'])) {
            throw new RuntimeException("{$label} API error: ".json_encode($body['errors']));
        }

        return $body['data'] ?? [];
    }
}
