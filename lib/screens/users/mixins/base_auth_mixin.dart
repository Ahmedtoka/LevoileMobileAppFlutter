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

    // Le Voile: the customer used to be shown
    //   "Warning: Exception: Please check your username or password…"
    //
    // Two layers of developer vocabulary in front of the one sentence that
    // means anything. `S.of(context).warning()` prepends "Warning: ", and the
    // framework throws `Exception(...)`, whose toString() is
    // "Exception: <message>". The toast already carries an amber icon, so the
    // word adds nothing but alarm — the whole reason the red banner was
    // replaced in the first place.
    FlashHelper.errorMessage(context, message: _clean(message));
  }

  /// Strips Dart's own error vocabulary from anything shown to a customer.
  ///
  /// Applied at the LAST step on purpose: the raw text is what reaches the
  /// logs and the error reporter, and only the display is tidied.
  static String _clean(String message) {
    var text = message.trim();

    for (final prefix in const [
      'Exception:',
      'Warning:',
      '_Exception:',
      'FormatException:',
      'HttpException:',
      'Error:',
    ]) {
      while (text.toLowerCase().startsWith(prefix.toLowerCase())) {
        text = text.substring(prefix.length).trim();
      }
    }

    return text;
  }
}
