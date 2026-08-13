# Sign in with Apple → Shopify bridge

Code to copy into the **dashboard Laravel repo** (separate repo, deployed at
`https://mobileapp.levoilestores.com`). Nothing here deploys from this repo — it
lives alongside the app so the two halves stay in sync.

Target endpoint: `POST https://mobileapp.levoilestores.com/api/v1/auth/apple`
(matches `loginSetting.appleLoginSetting.bridgeEndpoint` in `lib/env.dart`).

## Why it exists

App Review rejected build 1.6.2 (8) under **guideline 4.8**: Shopify's hosted
customer accounts page offers Google and Facebook sign-in, and the app had no
equivalent privacy-preserving option. Shopify's native social sign-in supports
**only Google and Facebook** — Sign in with Apple cannot be switched on there —
and the Customer Account API has no way to exchange a third-party identity token
for a session.

So the app runs Sign in with Apple natively and posts the identity token here.
This endpoint verifies it and returns a **Storefront API customer access token**,
which `ShopifyService.loginApple` feeds into the same code path as classic
email/password login.

## Files

| File | Goes to |
| --- | --- |
| `laravel/AppleSignInController.php` | `app/Http/Controllers/Api/V1/` |
| `laravel/snippets.php` | route, `config/services.php` entries, `.env` keys — copy the relevant blocks, do not add the file itself |

`composer require firebase/php-jwt`

## Contract

```
POST /api/v1/auth/apple
Content-Type: application/json

{ "identityToken": "<Apple JWT>", "firstName": "Sara", "lastName": "K" }
```

`firstName` / `lastName` are optional — Apple returns a name only on the very
first authorization.

```
200 { "accessToken": "<storefront token>", "expiresAt": "2026-09-11T…Z" }
400 { "message": "…" }   malformed request / Shopify rejected the customer
401 { "message": "…" }   identity token failed verification
409 { "message": "…" }   email belongs to an account we could not link
500 { "message": "…" }   upstream failure
```

## Environment

| Variable | Value |
| --- | --- |
| `APPLE_BUNDLE_ID` | `com.arenahere.levoile` — must match the token's `aud` |
| `APPLE_BRIDGE_SECRET` | 64+ random chars |
| `SHOPIFY_STORE_DOMAIN` | `levoilestores.myshopify.com` |
| `SHOPIFY_STOREFRONT_TOKEN` | Storefront API public access token |
| `SHOPIFY_ADMIN_TOKEN` | Admin API token, scopes `read_customers` + `write_customers` |

> **`APPLE_BRIDGE_SECRET` must never be rotated.** Every Apple user's Shopify
> password is an HMAC of it. Changing it locks all of them out.

## How an account gets linked

1. Verify the JWT against `appleid.apple.com/auth/keys`, checking `iss` and `aud`.
2. Derive a deterministic password from the Apple `sub` claim.
3. `customerAccessTokenCreate` — succeeds for returning users.
4. Otherwise `customerCreate` with that password, then mint the token.
5. If Shopify says `TAKEN`, the shopper already has an account (Shopify's email
   OTP flow, web checkout, or an imported list). Set the derived password on that
   customer via Admin REST, then mint the token.

Step 5 deliberately takes over the password of a pre-existing account. That is
safe here only because Apple has already verified ownership of the email address.
Private-relay addresses (`@privaterelay.appleid.com`) flow through unchanged.

## ⚠️ Two things to verify against the live store before shipping

Neither could be checked from this machine — the PHP was not syntax-checked
either (no `php` on the build box).

1. **Storefront customer tokens with new customer accounts enabled.** The store
   runs Shopify's *new* customer accounts (`shopifyCustomerAccountConfig.enabled`
   is `true` in `lib/env.dart`). Confirm `customerAccessTokenCreate` still issues
   tokens for this shop. If Shopify has disabled classic Storefront customer auth
   on it, this bridge cannot work and the app has to move back to classic
   customer accounts — at which point Google/Facebook disappear from the login
   page too and guideline 4.8 stops applying on its own.

2. **Admin REST customer password update.** `PUT /admin/api/2025-07/customers/{id}.json`
   is the only Shopify API that sets a customer password, and it is part of the
   legacy REST Admin API. If it has been retired on this API version, step 5
   needs another route (typically: send the shopper through Shopify's account
   activation URL once).

Both are quick to check with a throwaway customer. Until they are confirmed,
treat the 4.8 fix as unverified.

## Also required

`ios/Runner/Runner.entitlements` already declares `com.apple.developer.applesignin`.
Enable the **Sign in with Apple** capability on the App ID in the Apple Developer
portal and regenerate the provisioning profile, or the entitlement will fail to
sign.
