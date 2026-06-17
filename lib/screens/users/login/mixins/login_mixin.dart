import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';

import '../../../../common/tools.dart';
import '../../../../common/tools/flash.dart';
import '../../../../models/index.dart';
import '../../../../services/index.dart';
import '../../../../widgets/common/webview.dart';
import '../../forgot_password_screen.dart';
import '../../mixins/base_auth_mixin.dart';
import '../../mixins/social_login_mixin.dart';
import 'mixin_animation_button_login.dart';

typedef LoginFunction =
    Future<void> Function({
      required String username,
      required String password,
      required Function(User user) success,
      required Function(String) fail,
    });

mixin LoginMixin<T extends StatefulWidget> on BaseAuthMixin<T> {
  bool _isActiveAudio = false;

  TextEditingController get usernameCtrl;

  TextEditingController get passwordCtrl;

  bool get isActiveAudio => _isActiveAudio;

  LoginFunction get _login => userModel.login;

  SocialLoginFunction get _loginWithCustomerAccountShopify =>
      userModel.loginWithCustomerAccountShopify;

  AudioManager get _audioPlayerService => injector<AudioManager>();
  void loginWithCustomerAccountShopify(BuildContext context) async {
    // Check internet connection before attempting login
    if (!await context.checkInternet()) {
      return;
    }

    await beforeCallLogin(AnimationButtonLoginType.email);
    await _loginWithCustomerAccountShopify(
      success: (user) {
        afterCallLogin(true);
        loginDone(user);
      },
      fail: (message) {
        afterCallLogin(false, AnimationButtonLoginType.email);
        failMessage(message);
      },
      context: context,
    );
  }

  Future<void> runLogin(BuildContext context) async {
    if (usernameCtrl.text.isEmpty || passwordCtrl.text.isEmpty) {
      unawaited(
        FlashHelper.errorMessage(
          context,
          message: S.of(context).pleaseInputFillAllFields,
        ),
      );
    } else {
      // Check internet connection before attempting login
      if (!await context.checkInternet()) {
        return;
      }

      await beforeCallLogin();
      await _login(
        username: usernameCtrl.text.trim(),
        password: passwordCtrl.text.trim(),
        success: (user) {
          afterCallLogin(true);
          loginDone(user);
        },
        fail: (message) {
          afterCallLogin(false);
          failMessage(message);
        },
      );
    }
  }

  void launchForgetPasswordURL(String? url) async {
    if (url != null && url != '') {
      /// show as webview
      await Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) =>
              WebView(url, title: S.of(context).resetPassword),
          fullscreenDialog: true,
        ),
      );
    } else {
      /// show as native
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
      );
    }
  }

  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    if (_audioPlayerService.isStickyAudioWidgetActive) {
      _isActiveAudio = true;
      _audioPlayerService
        ..pause()
        ..hideStickyAudioWidget();
    }
  }

  @override
  void dispose() async {
    usernameCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }
}
