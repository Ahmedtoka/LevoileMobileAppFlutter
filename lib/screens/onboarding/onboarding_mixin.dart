import 'package:flutter/material.dart';

import '../../common/config.dart';
import '../../common/config/models/onboarding_config.dart';
import '../../common/constants.dart';
import '../../common/tools/image_tools.dart';
import '../../common/tools/navigate_tools.dart';
import '../../data/boxes.dart';
import '../home/change_language_mixin.dart';

mixin OnBoardingMixin<T extends StatefulWidget> on ChangeLanguage<T> {
  OnBoardingConfig get config;

  final isRequiredLogin = kLoginSetting.isRequiredLogin;
  final isEnableRegister = kLoginSetting.enableRegister;
  final isEnableLogin = kLoginSetting.enable;

  int page = 0;

  bool get enableAuth =>
      Configurations.multiSiteConfigs?.isEmpty ?? true && isEnableLogin;

  bool get hasFinishedOnboarding => SettingsBox().hasFinishedOnboarding;

  void setHasSeen() {
    SettingsBox().hasFinishedOnboarding = true;
  }

  /// Le Voile flow: tapping an action goes STRAIGHT to its destination.
  /// The notification permission is requested later — after the home loads
  /// and the welcome-coupon popup is shown.

  void onTapSignUp() {
    setHasSeen();
    // Shopify's Customer Account page is "Sign in OR create an account" — it
    // creates new customers via the email→code flow (no password, no
    // activation email). So Create Account uses the same flow as Sign In.
    NavigateTools.navigateToLogin(context, replacement: true);
  }

  void onTapSignIn() {
    setHasSeen();
    NavigateTools.navigateToLogin(context, replacement: true);
  }

  void onTapDone() async {
    setHasSeen();
    final isLoggedIn = UserBox().isLoggedIn;

    if (isRequiredLogin && !isLoggedIn && isEnableLogin) {
      await NavigateTools.navigateToLogin(context, replacement: true);
      return;
    }

    await Navigator.of(context).pushReplacementNamed(RouteList.dashboard);
  }

  @override
  void initState() {
    super.initState();
    ImageTools.preLoadingListImagesInitState(
      config.items.map((e) => e.image).toList(),
      context,
    );
    if (config.showLanguagePopup && !hasFinishedOnboarding) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Future.delayed(const Duration(milliseconds: 500)).then((value) {
          showLanguageSelector(context);
        });
      });
    }
  }
}
