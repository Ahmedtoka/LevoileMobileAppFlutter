import 'dart:async';

import 'package:flutter/material.dart';

import '../../widgets/common/lv_toast.dart';

/// Le Voile: EVERY message the app shows the customer now renders as the small
/// bottom toast in [LvToast].
///
/// The stock helper put a full-width alarm-red bar across the top of the screen
/// with an 18px message and a Close button, for everything from "added to cart"
/// to "the maximum quantity has been exceeded". A shopper who picks a fourth
/// shirt when three are in stock is not looking at a fault, and dressing it as
/// one makes them think they broke something.
///
/// The four public entry points are kept exactly as they were so no caller
/// changed; they differ only in what they pass to the toast.
class FlashHelper {
  static Completer<BuildContext> _buildCompleter = Completer<BuildContext>();

  static void init(BuildContext context) {
    if (_buildCompleter.isCompleted == false) {
      _buildCompleter.complete(context);
    }
  }

  static void dispose() {
    if (_buildCompleter.isCompleted == false) {
      _buildCompleter.completeError(FlutterError('disposed'));
    }
    _buildCompleter = Completer<BuildContext>();
  }

  static Future<T?> informationBar<T>(
    BuildContext context, {
    String? title,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) async {
    await LvToast.show(
      context,
      message: message,
      title: title,
      icon: Icons.info_outline_rounded,
      duration: duration,
    );

    return null;
  }

  static Future<T?>? errorBar<T>(
    BuildContext context, {
    String? title,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) async {
    await LvToast.show(
      context,
      message: message,
      title: title,
      isError: true,
      duration: duration,
    );

    return null;
  }

  /// The one every screen calls. `isError` picks the amber accent; everything
  /// else is the brand colour.
  static Future<T?>? message<T>(
    BuildContext context, {
    IconData? icon,
    String? title,
    // Kept so no caller had to change. The toast owns its own type scale — a
    // caller-supplied style is what produced the 18px shouty error text.
    TextStyle? messageStyle,
    required String message,
    Duration duration = const Duration(seconds: 3),
    bool isError = false,
    GestureTapCallback? onTap,
    bool? isHtml,
  }) async {
    await LvToast.show(
      context,
      // A toast is one short line, so markup has nowhere to render. Strip the
      // tags rather than drop the message: `isHtml` is set by callers relaying
      // a server string, and those are exactly the ones worth reading.
      message: isHtml == true ? _stripTags(message) : message,
      title: title,
      icon: icon,
      isError: isError,
      duration: duration,
      onTap: onTap,
    );

    return null;
  }

  /// The error flavour of [message].
  ///
  /// 🔴 45 call sites depend on this exact signature — the whole add-to-cart,
  /// checkout and address surface. Deleting it takes the app with it.
  static Future<T?>? errorMessage<T>(
    BuildContext context, {
    IconData? icon,
    required String message,
    Duration duration = const Duration(seconds: 3),
    bool? isHtml,
  }) {
    return FlashHelper.message(
      context,
      message: message,
      icon: icon,
      duration: duration,
      isError: true,
      isHtml: isHtml,
    );
  }

  /// `<b>Sold out</b>` → `Sold out`.
  static String _stripTags(String html) {
    final text = html
        .replaceAll(RegExp(r'<br\s*/?>', caseSensitive: false), ' ')
        .replaceAll(RegExp(r'<[^>]*>'), ' ')
        .replaceAll('&nbsp;', ' ')
        .replaceAll('&amp;', '&')
        .replaceAll('&quot;', '"')
        .replaceAll('&#39;', "'")
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>');

    return text.replaceAll(RegExp(r'\s+'), ' ').trim();
  }
}

