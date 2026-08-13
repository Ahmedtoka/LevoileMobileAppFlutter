<?php

// ---------------------------------------------------------------------------
// routes/api.php — the app posts to https://mobileapp.levoilestores.com/api/v1/auth/apple
// ---------------------------------------------------------------------------

use App\Http\Controllers\Api\V1\AppleSignInController;
use Illuminate\Support\Facades\Route;

Route::prefix('v1')->group(function () {
    // Throttled because the endpoint mints Shopify sessions; the limit is per IP.
    Route::post('auth/apple', AppleSignInController::class)
        ->middleware('throttle:20,1');
});

// ---------------------------------------------------------------------------
// config/services.php — add these entries
// ---------------------------------------------------------------------------

return [

    // …existing services…

    'apple' => [
        // Must equal the `aud` claim of the identity token, i.e. the iOS bundle id.
        'bundle_id' => env('APPLE_BUNDLE_ID'),

        // Never rotate: every Apple user's Shopify password derives from this.
        'bridge_secret' => env('APPLE_BRIDGE_SECRET'),
    ],

    'shopify' => [
        'domain' => env('SHOPIFY_STORE_DOMAIN'),
        'storefront_token' => env('SHOPIFY_STOREFRONT_TOKEN'),
        'admin_token' => env('SHOPIFY_ADMIN_TOKEN'),
    ],

];

// ---------------------------------------------------------------------------
// .env
// ---------------------------------------------------------------------------
//
// APPLE_BUNDLE_ID=com.arenahere.levoile
// APPLE_BRIDGE_SECRET=<64+ random chars, generate once, never change>
// SHOPIFY_STORE_DOMAIN=levoilestores.myshopify.com
// SHOPIFY_STOREFRONT_TOKEN=<Storefront API public access token>
// SHOPIFY_ADMIN_TOKEN=<Admin API token: read_customers + write_customers>
//
// ---------------------------------------------------------------------------
// composer
// ---------------------------------------------------------------------------
//
// composer require firebase/php-jwt
