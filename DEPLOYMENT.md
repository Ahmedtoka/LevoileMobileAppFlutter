# Le Voile — Store Release Guide (Android + iOS)

> Handoff guide for the developer who will publish the app to **Google Play** and the **Apple App Store**.
> Built on FluxStore Shopify v6.1.0 · Flutter (FVM **3.41.0**) · package manager: **FVM** (always use `fvm flutter …`, never bare `flutter`).

---

## 🟢 نظرة سريعة (Arabic TL;DR)

- المشروع **Flutter واحد** بيطلع أندرويد و iOS من نفس الكود.
- **أندرويد لازم يحافظ على نفس التطبيق المنشور** `com.arenahere.levoile` (عليه تثبيتات قديمة). معدّلين الباكدج خلاص في `configs/env.props`.
- **أهم 3 نقاط لأندرويد:** (1) استخدم **مفتاح التوقيع الأصلي القديم** مش الـ test key، (2) سجّل الباكدج في **Firebase** ونزّل `google-services.json` حقيقي، (3) خلّي **versionCode أعلى** من النسخة المنشورة حالياً.
- **iOS لازم Mac + Xcode + حساب Apple Developer.** كل الإعدادات جاهزة في الكود؛ باقي التوقيع والرفع من الماك.
- **Meta (Facebook/Instagram) App Events** متظبطة بالكامل (App ID + Client Token في `env.props`).
- **الباك-إند (لوحة التحكم)** شغّالة لايف على `https://mobileapp.levoilestores.com` (ريبو منفصل). التطبيق بيقرأ منها الإعدادات.

---

## ⚡ Quick start — numbered steps

> Always use `fvm flutter …` (never bare `flutter`).

### A) Run the app locally (first time)
1. `fvm install 3.41.0`   *(skip if already installed)*
2. `fvm flutter pub get`
3. `fvm flutter run`   *(with a device/emulator connected)*

### B) Publish to Google Play (Android)
1. Put the **original production keystore** at `configs/key.jks` and set its `storePassword` / `keyPassword` / `keyAlias` in `configs/env.props`. *(package is already `com.arenahere.levoile`.)*
2. Replace `configs/google-services.json` with the **real** file from Firebase — register `com.arenahere.levoile` in project `levoilestores-93358`. *(the file in the repo is a temporary bridge so it compiles.)*
3. Bump the **versionCode** in `pubspec.yaml` (`version: 1.0.x+N`) so `N` is **higher** than the current live release in Play Console.
4. Build: `fvm flutter build appbundle --release --no-tree-shake-icons` → `build/app/outputs/bundle/release/app-release.aab`
5. Play Console → new release → upload the `.aab` → review → roll out. *(Start with Internal testing, then Production.)*

### C) Publish to the App Store (iOS — Mac only)
1. `fvm flutter pub get`  →  `cd ios && pod install && cd ..`
2. Register the bundle ids + capabilities in Apple Developer; `open ios/Runner.xcworkspace` and set your **Team** (signing) on **all** targets.
3. Set Version/Build, then **Product → Archive → Distribute App → App Store Connect** (uploads to TestFlight).
4. App Store Connect → fill metadata + screenshots + **App Privacy** → submit for review.

*(Full detail for each step is in §5 Android and §6 iOS below.)*

---

## 1. Project overview

- **Framework:** Flutter (Dart 3), FluxStore Shopify v6.1.0.
- **Flutter SDK:** pinned to **3.41.0** via FVM (`.fvmrc` / `.fvm/fvm_config.json`). Use `fvm flutter …` for every command.
- **Backend / store:** Shopify Storefront API (`levoilestores.myshopify.com`) + a custom Laravel dashboard at `https://mobileapp.levoilestores.com` that serves remote app config, coupons, popups, version-gate, etc.
- **Checkout:** the app builds the cart via Storefront API then opens the Shopify **web checkout** (no in-app payment SDK).

---

## 2. Prerequisites

**Both platforms**
- Git, FVM, Flutter 3.41.0 (`fvm install 3.41.0` if missing), then `fvm flutter pub get`.

**Android**
- Android SDK (API 34+), JDK 17, the **original production keystore** (see §4).

**iOS** (Mac only — cannot be built on Windows)
- macOS + Xcode (latest stable), CocoaPods (`sudo gem install cocoapods`), an **Apple Developer Program** account (paid).

---

## 3. How configuration works

All app identity & secrets are injected at build time from **`configs/env.props`**:
- Android: `android/app/build.gradle` reads it → `applicationId`, `resValue`/`manifestPlaceholders` (Facebook, etc.).
- iOS: the same keys feed `ios/Runner/Info.plist` and `project.pbxproj` via `${…}` placeholders (e.g. `${iosBundleId}`, `${facebookAppId}`).
- On every build the toolchain copies `configs/google-services.json` → `android/app/` and `configs/GoogleService-Info.plist` → `ios/Runner/`.

So **you edit `configs/env.props`**, not the platform files directly.

Current relevant values:

| Key | Value |
|---|---|
| `appName` | `Le Voile` |
| `androidPackageName` | **`com.arenahere.levoile`** ← matches the live Play app |
| `iosBundleId` | `com.levoile.stores` (fresh iOS app — can keep or change, see §6) |
| `facebookAppId` | `1538560604336689` |
| `facebookClientToken` | (set — Meta App Events) |
| Android code `namespace` | `com.inspireui.fluxstore` (R class / Kotlin pkg — **leave as is**, it is independent of `applicationId`) |
| Launcher activity | `com.inspireui.fluxstore.MainActivity` |

> Note: `applicationId` (`com.arenahere.levoile`) intentionally differs from the code `namespace` (`com.inspireui.fluxstore`). This is valid and correct — do **not** try to "fix" it.

---

## 4. Credentials to obtain (secure handover — NOT in git)

| Item | Where it goes | Who has it |
|---|---|---|
| **Original Android upload keystore** (`key.jks` + storePassword + keyPassword + keyAlias) | `configs/key.jks` + values in `configs/env.props` | The previous developer / Play account owner |
| **Google Play Console** access | — | App account owner |
| **Apple Developer** account | Xcode signing | App account owner |
| **Firebase Console** access (project `levoilestores-93358`) | to generate real `google-services.json` | App account owner |

`*.jks` and `key.properties` are **git-ignored** on purpose (see `.gitignore`). The `configs/key.jks` currently on the original machine is a **TEST** key — do not ship it.

---

## 5. 🤖 Android release (Google Play)

> Goal: publish an **update to the existing app** `com.arenahere.levoile` so the current installs are preserved.

### 5.1 Identity — already done
`androidPackageName=com.arenahere.levoile` is set in `configs/env.props`. ✅

### 5.2 Signing — **critical**
Google Play rejects an update signed with a different key than the existing app. Two cases:

- **If the existing app uses Play App Signing:** you may upload a new **upload key** — in Play Console go to *Release → Setup → App integrity → Upload key certificate → Request key reset*, then sign with your new keystore.
- **If it uses legacy signing:** you **must** sign with the **exact original keystore**.

Either way, get the keystore from the previous developer, place it at `configs/key.jks`, and set in `configs/env.props`:
```
storeFile=key.jks
storePassword=<real>
keyPassword=<real>
keyAlias=<real>
```

### 5.3 Firebase — replace the bridge file
`configs/google-services.json` currently contains a **temporary bridge entry** for `com.arenahere.levoile` (so the project compiles), reusing the old app's IDs. **Before production:**
1. Firebase Console → project **`levoilestores-93358`** → Add app → Android → package `com.arenahere.levoile`.
2. Add the release **SHA-1/SHA-256** of your signing key (for Phone Auth / Dynamic Links if used).
3. Download the new `google-services.json` and **replace** `configs/google-services.json`.

Without this, push notifications / analytics for the new package won't route correctly.

### 5.4 Version code — **must increase**
`pubspec.yaml` → `version: 1.0.0+3000`. The number after `+` is the **versionCode**. It **must be greater** than the latest versionCode currently live in Play Console.
- Check Play Console → *Production → latest release → versionCode*.
- Bump `pubspec.yaml` accordingly, e.g. `version: 1.0.1+<higher-number>`.

### 5.5 Build the App Bundle (Play needs `.aab`, not `.apk`)
```bash
fvm flutter clean
fvm flutter pub get
fvm flutter build appbundle --release --no-tree-shake-icons
```
Output: `build/app/outputs/bundle/release/app-release.aab`

### 5.6 Upload
Play Console → create a release (start with **Internal testing**, then promote to **Production**) → upload the `.aab` → fill release notes → review → roll out.

---

## 6. 🍎 iOS release (App Store) — Mac required

### 6.1 Bundle identifiers
From `configs/env.props`:
```
iosBundleId=com.levoile.stores
iosBundleIdFirebase=com.levoile.stores.FirebaseNotificationServiceExtension
iosBundleIdOneSignal=com.levoile.stores.onesignal
iosAppGroups=group.com.levoile.stores.onesignal
iosMerchantId=merchant.com.levoile.stores
```
This is a **fresh** iOS app, so you can keep these or change the family to your own. In Apple Developer → **Certificates, IDs & Profiles → Identifiers**, register:
- the main App ID `com.levoile.stores`,
- the two extension IDs,
- the **App Group** `group.com.levoile.stores.onesignal`,
- (only if you use Apple Pay) the Merchant ID.

### 6.2 Capabilities to enable (App ID + Xcode → Signing & Capabilities)
- **Push Notifications**
- **App Groups** (`group.com.levoile.stores.onesignal`) — for OneSignal
- **Associated Domains** — only if Branch/deep links are used
- **Sign in with Apple** — only if Apple login is offered
- **Apple Pay / Merchant** — only if Apple Pay is used (otherwise you can remove `iosMerchantId`)

### 6.3 Firebase iOS
`configs/GoogleService-Info.plist` is present for `com.levoile.stores`. Verify it matches an iOS app in Firebase project `levoilestores-93358`; if you change the bundle id, re-register the iOS app and replace this file.

### 6.4 Build & archive
```bash
fvm flutter pub get
cd ios && pod install && cd ..
open ios/Runner.xcworkspace
```
In Xcode:
1. Select each target (Runner + the OneSignal/Firebase extensions) → **Signing & Capabilities** → set your **Team**, enable automatic signing.
2. Set **Version** and **Build**.
3. **Product → Archive** → **Distribute App → App Store Connect → Upload** (goes to TestFlight).

### 6.5 App Store Connect
Create the app (matching bundle id), add metadata, screenshots (6.7" + 6.5" + 5.5"), and **App Privacy** declarations (the app collects identifiers/usage data via **Firebase Analytics** and the **Meta SDK**). If you enable IDFA-based Meta attribution, add **App Tracking Transparency** (`NSUserTrackingUsageDescription` + the ATT prompt). Submit for review.

---

## 7. Meta (Facebook / Instagram) App Events — already wired ✅

- `enableFacebookAppEvents: true` in `lib/env.dart`.
- `facebookAppId` + `facebookClientToken` in `configs/env.props` (Meta App `1538560604336689`).
- Android manifest reads them via `@string/facebookAppId` + `${facebookClientToken}`; iOS Info.plist via `${facebookAppId}` + `FacebookClientToken`.
- The Meta App's **Google Play** platform is registered with package `com.arenahere.levoile` and class `com.inspireui.fluxstore.MainActivity` — now matches this build.
- **For iOS:** in the Meta App, add an **iOS** platform with bundle id `com.levoile.stores`.
- Verify in **Events Manager → Test Events** after install.

---

## 8. Backend (dashboard) — informational

The admin dashboard is a **separate Laravel repo** deployed live at `https://mobileapp.levoilestores.com`. The app reads remote config from `…/api/v1/config/en` and the version-gate from `…/api/v1/app-version`. You do **not** need to touch it to ship the apps. After the apps are live, set the **Store URLs** in the dashboard's *App Update* page — they power the in-app "Rate the App" button and the force-update redirect.

---

## 9. Command reference

```bash
# install deps
fvm flutter pub get

# run on a device/emulator (dev)
fvm flutter run

# release APK (for direct/side-load testing only)
fvm flutter build apk --release --no-tree-shake-icons
# → build/app/outputs/flutter-apk/app-release.apk

# release App Bundle (for Google Play)
fvm flutter build appbundle --release --no-tree-shake-icons
# → build/app/outputs/bundle/release/app-release.aab

# iOS archive is done from Xcode (see §6)
```

---

## 10. Known non-blocking warnings

- Gradle **KGP / "built-in Kotlin"** deprecation warnings and a Gradle 8.13→8.14 notice — informational, build succeeds.
- `withOpacity` deprecation lints — cosmetic, no runtime effect.
- `flutter analyze` reports only info/warning level items (0 errors).

---

## 11. First-time GitHub push (private repo)

This folder is not yet a git repo. To hand it off:
```bash
cd C:\xampp\htdocs\levoile-app
git init
git add .
git commit -m "Le Voile app — store release handoff"
git branch -M main
git remote add origin <your-PRIVATE-repo-url>
git push -u origin main
```
> Use a **private** repository. The signing keystore is git-ignored; hand it (and the real `env.props` secret values) to the developer **separately/securely**.
