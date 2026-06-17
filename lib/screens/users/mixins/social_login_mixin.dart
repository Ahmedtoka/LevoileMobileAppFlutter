import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/config.dart';
import '../../../common/constants.dart';
import '../../../common/extensions/extensions.dart';
import '../../../models/entities/user.dart';
import '../../../models/user_model.dart';
import '../../../modules/sms_login/sms_login.dart';
import '../../../services/service_config.dart';
import 'base_auth_mixin.dart';

typedef SocialLoginFunction =
    Future<void> Function({
      required Function(User user) success,
      required Function(String) fail,
      required BuildContext context,
    });

mixin SocialLoginMixin<T extends StatefulWidget> on BaseAuthMixin<T> {
  SocialLoginFunction get _loginFB => userModel.loginFB;

  SocialLoginFunction get _loginApple => userModel.loginApple;

  SocialLoginFunction get _loginGoogle => userModel.loginGoogle;

  VoidCallback? get loginSms => null;

  void loginWithFacebook(BuildContext context) async {
    // Check internet connection before attempting login
    if (!await context.checkInternet()) {
      return;
    }

    await beforeCallLogin();
    await _loginFB(
      success: (user) {
        afterCallLogin(true);
        loginDone(user);
      },
      fail: (message) {
        afterCallLogin(false);
        failMessage(message);
      },
      context: context,
    );
  }

  void loginWithApple(BuildContext context) async {
    // Check internet connection before attempting login
    if (!await context.checkInternet()) {
      return;
    }

    await beforeCallLogin();
    await _loginApple(
      success: (user) {
        afterCallLogin(true);
        loginDone(user);
      },
      fail: (message) {
        afterCallLogin(false);
        failMessage(message);
      },
      context: context,
    );
  }

  void loginWithGoogle(BuildContext context) async {
    // Check internet connection before attempting login
    if (!await context.checkInternet()) {
      return;
    }

    await beforeCallLogin();
    await _loginGoogle(
      success: (user) {
        afterCallLogin(true);
        loginDone(user);
      },
      fail: (message) {
        afterCallLogin(false);
        failMessage(message);
      },
      context: context,
    );
  }

  void loginWithSMS(BuildContext context) async {
    // Check internet connection before attempting login
    if (!await context.checkInternet()) {
      return;
    }

    if (loginSms != null) {
      loginSms!();
      return;
    }

    final supportedPlatforms = [
      'wcfm',
      'dokan',
      'delivery',
      'vendorAdmin',
      'woo',
      'wordpress',
    ].contains(ServerConfig().typeName);

    if (kAdvanceConfig.enableDigitsMobileLogin) {
      unawaited(Navigator.of(context).pushNamed(RouteList.digitsMobileLogin));
    } else if (supportedPlatforms && (kAdvanceConfig.enableNewSMSLogin)) {
      final model = Provider.of<UserModel>(context, listen: false);
      unawaited(
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => SMSLoginScreen(
              onSuccess: (user) async {
                await model.setUser(user);
                Navigator.of(context).pop();
                loginDone(user);
              },
            ),
          ),
        ),
      );
    } else {
      unawaited(Navigator.of(context).pushNamed(RouteList.loginSMS));
    }
  }
}
