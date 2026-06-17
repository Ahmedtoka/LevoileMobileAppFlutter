import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';

import '../../../../common/config/models/onboarding_config.dart';
import '../../../home/change_language_mixin.dart';
import '../../onboarding_mixin.dart';

class OnBoardingV1 extends StatefulWidget {
  final OnBoardingConfig config;
  const OnBoardingV1({super.key, required this.config});

  @override
  State<OnBoardingV1> createState() => _OnBoardingV1State();
}

class _OnBoardingV1State extends State<OnBoardingV1>
    with ChangeLanguage, OnBoardingMixin {
  @override
  OnBoardingConfig get config => widget.config;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.primaryColor;

    final items = widget.config.items;
    final logo =
        items.isNotEmpty ? items.first.image : 'assets/images/logo.png';
    final showAuth = config.showSignInSignUp && enableAuth;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeOutCubic,
                builder: (context, t, child) => Opacity(
                  opacity: t.clamp(0.0, 1.0),
                  child: Transform.translate(
                    offset: Offset(0, (1 - t) * 24),
                    child: child,
                  ),
                ),
                child: Column(
                  children: [
                    const Spacer(flex: 3),

                    // Brand logo (already contains the "Le Voile" wordmark).
                    Image.asset(
                      logo,
                      width: MediaQuery.of(context).size.width * 0.62,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 18),

                    // Slogan (same as the splash screen).
                    Text(
                      'M O D E S T   E L E G A N C E',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.5,
                        letterSpacing: 3.0,
                        fontWeight: FontWeight.w500,
                        color: theme.colorScheme.secondary.withOpacity(0.75),
                      ),
                    ),

                    const Spacer(flex: 4),

                    if (showAuth) ...[
                      // Primary: Sign In
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: onTapSignIn,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primary,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(
                            S.of(context).signIn,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),

                      if (isEnableRegister) ...[
                        const SizedBox(height: 14),
                        // Secondary: Create account
                        SizedBox(
                          width: double.infinity,
                          height: 54,
                          child: OutlinedButton(
                            onPressed: onTapSignUp,
                            style: OutlinedButton.styleFrom(
                              foregroundColor: primary,
                              side: BorderSide(color: primary, width: 1.4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Text(
                              S.of(context).signUp,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],

                      const SizedBox(height: 20),

                      // Tertiary: skip — same behaviour as the old Done button.
                      GestureDetector(
                        onTap: onTapDone,
                        behavior: HitTestBehavior.opaque,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Text(
                            'Continue as guest',
                            style: TextStyle(
                              fontSize: 14.5,
                              fontWeight: FontWeight.w500,
                              color: theme.colorScheme.secondary
                                  .withOpacity(0.85),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],

                    const SizedBox(height: 28),
                  ],
                ),
              ),
            ),
          ),
          if (widget.config.showLanguage) iconLanguage(),
        ],
      ),
    );
  }
}
