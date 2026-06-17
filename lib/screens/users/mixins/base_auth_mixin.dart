import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';
import 'package:provider/provider.dart';

import '../../../common/tools/flash.dart';
import '../../../common/tools/navigate_tools.dart';
import '../../../models/entities/user.dart';
import '../../../models/user_model.dart';
import '../../base_screen.dart';
import '../login/mixins/mixin_animation_button_login.dart';

mixin BaseAuthMixin<T extends StatefulWidget> on BaseScreen<T> {
  UserModel get userModel => Provider.of<UserModel>(context, listen: false);

  Future<void> beforeCallLogin([
    AnimationButtonLoginType type = AnimationButtonLoginType.usernamePassword,
  ]);

  Future<void> afterCallLogin(
    bool isLoginSuccess, [
    AnimationButtonLoginType type = AnimationButtonLoginType.usernamePassword,
  ]);

  void loginDone(User user) {
    NavigateTools.navigateAfterLogin(user, context);
  }

  void failMessage(String message) {
    if (message.isEmpty) return;

    var messageText = message;
    // if (kReleaseMode) {
    //   messageText = S.of(context).userNameInCorrect;
    // }

    FlashHelper.errorMessage(
      context,
      message: S.of(context).warning(messageText),
    );
  }
}
