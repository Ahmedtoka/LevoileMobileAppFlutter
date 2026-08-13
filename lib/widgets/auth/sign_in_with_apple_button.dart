import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Full-width "Sign in with Apple" button, styled to Apple's Human Interface
/// Guidelines: black on light backgrounds, white on dark ones, with the Apple
/// mark leading a localized label.
///
/// This is the guideline 4.8 counterpart to the "Sign in with email" button on
/// the login screen, so the two are deliberately the same size and sit next to
/// each other with equal prominence.
class SignInWithAppleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool enabled;

  /// Matches [StaggerAnimation], the "Sign in with email" button it sits under,
  /// so neither login option reads as the secondary one.
  final double height;
  final double width;

  const SignInWithAppleButton({
    super.key,
    required this.onPressed,
    this.enabled = true,
    this.height = 50,
    this.width = 320,
  });

  /// Apple requires the label in the user's language. Falls back to English for
  /// locales we do not carry a translation for.
  static const _labels = <String, String>{
    'ar': 'تسجيل الدخول باستخدام Apple',
    'da': 'Log ind med Apple',
    'de': 'Mit Apple anmelden',
    'el': 'Σύνδεση με Apple',
    'es': 'Iniciar sesión con Apple',
    'fi': 'Kirjaudu sisään Apple-tunnuksella',
    'fr': 'Se connecter avec Apple',
    'he': 'התחברות באמצעות Apple',
    'hi': 'Apple के साथ साइन इन करें',
    'id': 'Masuk dengan Apple',
    'it': 'Accedi con Apple',
    'ja': 'Appleでサインイン',
    'ko': 'Apple로 로그인',
    'ms': 'Log masuk dengan Apple',
    'nl': 'Inloggen met Apple',
    'no': 'Logg på med Apple',
    'pl': 'Zaloguj się przez Apple',
    'pt': 'Iniciar sessão com a Apple',
    'ro': 'Conectare cu Apple',
    'ru': 'Вход с Apple',
    'sv': 'Logga in med Apple',
    'th': 'ลงชื่อเข้าใช้ด้วย Apple',
    'tr': 'Apple ile oturum aç',
    'uk': 'Вхід з Apple',
    'vi': 'Đăng nhập bằng Apple',
    'zh': '通过 Apple 登录',
  };

  static String labelFor(Locale locale) =>
      _labels[locale.languageCode] ?? 'Sign in with Apple';

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final foreground = isDark ? Colors.black : Colors.white;
    final background = isDark ? Colors.white : Colors.black;
    final maxWidth = MediaQuery.sizeOf(context).width - 32;

    return Opacity(
      opacity: enabled ? 1 : 0.5,
      child: SizedBox(
        height: height,
        width: width > maxWidth ? maxWidth : width,
        child: ElevatedButton(
          onPressed: enabled ? onPressed : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: background,
            disabledBackgroundColor: background,
            foregroundColor: foreground,
            elevation: 0,
            padding: EdgeInsets.symmetric(horizontal: height / 3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(height / 2),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/icons/logins/apple_logo_mark.svg',
                height: height * 0.42,
                colorFilter: ColorFilter.mode(foreground, BlendMode.srcIn),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  labelFor(Localizations.localeOf(context)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: foreground,
                    fontSize: height * 0.34,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
