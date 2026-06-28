import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../models/notification_model.dart';
import '../../services/coupon_service.dart';

/// Orchestrates the welcome-coupon popup. Called once when the Home page first
/// appears, so the popup shows AFTER the home loads.
///
/// Flow:
///  - Logged-in customer (or device already has a coupon) → show the coupon.
///  - Not logged in → ask for the phone first, claim, then show the coupon.
class WelcomeCouponFlow {
  static bool _shownThisSession = false;

  static Future<void> maybeShow(GlobalKey<NavigatorState> navKey) async {
    debugPrint('🎟️[CouponFlow] maybeShow called (home appeared)');
    if (_shownThisSession) {
      debugPrint('🎟️[CouponFlow] already shown this session — skip');
      return;
    }
    final service = CouponService.instance;

    // Let the home settle, then wait for the claim to resolve.
    await Future<void>.delayed(const Duration(milliseconds: 1200));
    for (var i = 0; i < 14; i++) {
      if (service.coupon.value != null || service.needsPhone.value) break;
      // If the launch claim failed (e.g. server/bridge was briefly down),
      // retry every few seconds until it resolves.
      if (i % 3 == 0) {
        await service.retryClaim();
      }
      await Future<void>.delayed(const Duration(seconds: 1));
    }
    debugPrint('🎟️[CouponFlow] resolved: coupon=${service.coupon.value?.code} '
        'needsPhone=${service.needsPhone.value} '
        'popupEnabled=${service.popup.enabled} '
        'shouldShow=${service.shouldShowWelcome.value}');

    BuildContext? ctx() => navKey.currentContext;
    if (ctx() == null || !service.popup.enabled || _shownThisSession) {
      debugPrint('🎟️[CouponFlow] not showing (ctx=${ctx() != null} '
          'enabled=${service.popup.enabled})');
      return;
    }

    // Case A: we already have an unused, not-yet-dismissed coupon.
    final coupon = service.coupon.value;
    if (coupon != null) {
      if (service.shouldShowWelcome.value != true) {
        debugPrint('🎟️[CouponFlow] CASE A skipped (already dismissed/used)');
        return;
      }
      debugPrint('🎟️[CouponFlow] CASE A → showing coupon ${coupon.code}');
      _shownThisSession = true;
      service.markWelcomeShown();
      await showDialog<void>(
        context: ctx()!,
        useRootNavigator: true,
        barrierDismissible: false,
        builder: (_) => CouponWelcomeDialog(
          coupon: coupon,
          popup: service.popup,
          phone: service.accountPhone,
        ),
      );
      await _requestNotification(ctx());
      return;
    }

    // Case B: no coupon yet.
    if (service.needsPhone.value) {
      _shownThisSession = true;

      // If they logged in / registered during onboarding, use the account
      // phone automatically instead of asking again.
      final accountPhone = service.accountPhone;
      String? phone = accountPhone;
      debugPrint('🎟️[CouponFlow] CASE B → '
          '${accountPhone != null ? "auto phone from account" : "asking phone"}');

      if (phone == null) {
        phone = await showDialog<String>(
          context: ctx()!,
          useRootNavigator: true,
          barrierDismissible: false,
          builder: (_) => CouponPhoneDialog(popup: service.popup),
        );
      }
      if (phone == null || phone.trim().isEmpty || ctx() == null) return;
      final enteredPhone = phone.trim();

      final ok = await service.claimWithPhone(enteredPhone);
      final granted = service.coupon.value;
      final afterCtx = ctx();
      if (afterCtx == null) return;
      if (!ok || granted == null) {
        // Empty pool / network error — don't fail silently.
        ScaffoldMessenger.of(afterCtx).showSnackBar(
          const SnackBar(
            content: Text(
              'Sorry, no coupon is available right now. Please try again later.',
            ),
          ),
        );
        return;
      }

      service.markWelcomeShown();
      await showDialog<void>(
        context: ctx()!,
        useRootNavigator: true,
        barrierDismissible: false,
        builder: (_) => CouponWelcomeDialog(
          coupon: granted,
          popup: service.popup,
          phone: enteredPhone,
        ),
      );
      await _requestNotification(ctx());
    }
  }

  /// Asks for notification permission AFTER the welcome-coupon popup — this is
  /// the right moment in the flow (not during onboarding).
  static Future<void> _requestNotification(BuildContext? ctx) async {
    if (ctx == null) return;
    try {
      await Provider.of<NotificationModel>(ctx, listen: false)
          .enableNotification();
    } catch (_) {}
  }
}

class CouponWelcomeDialog extends StatelessWidget {
  const CouponWelcomeDialog({
    super.key,
    required this.coupon,
    this.popup = LvPopup.fallback,
    this.phone,
  });
  final LvCoupon coupon;
  final LvPopup popup;
  final String? phone;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.primaryColor;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 28),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(24),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header gradient
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 26, 20, 22),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [primary, primary.withOpacity(0.78)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  const Text('🎉', style: TextStyle(fontSize: 40)),
                  const SizedBox(height: 8),
                  Text(
                    popup.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    popup.subtitleFor(coupon.discount),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 22),
              child: Column(
                children: [
                  Text(
                    popup.redeem,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Coupon code chip
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: coupon.code));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Coupon code copied'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    child: DottedCouponBox(code: coupon.code, primary: primary),
                  ),
                  if ((phone ?? '').isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: primary.withOpacity(0.06),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.phone_iphone_rounded,
                              size: 15, color: primary),
                          const SizedBox(width: 6),
                          Text(
                            'Linked to $phone',
                            style: TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.w600,
                              color: theme.colorScheme.secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  const SizedBox(height: 8),
                  Text(
                    'Tap the code to copy',
                    style: TextStyle(
                      fontSize: 11.5,
                      color: theme.colorScheme.secondary.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        'Got it',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    popup.note,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.4,
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DottedCouponBox extends StatelessWidget {
  const DottedCouponBox({super.key, required this.code, required this.primary});
  final String code;
  final Color primary;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: primary.withOpacity(0.07),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: primary.withOpacity(0.5),
          width: 1.5,
          style: BorderStyle.solid,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              code,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                letterSpacing: 2,
                color: primary,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Icon(Icons.copy_rounded, size: 18, color: primary.withOpacity(0.7)),
        ],
      ),
    );
  }
}

/// Asks the customer for their phone before granting the welcome coupon
/// (so the coupon is bound to a phone and can't be farmed by reinstalling).
class CouponPhoneDialog extends StatefulWidget {
  const CouponPhoneDialog({super.key, this.popup = LvPopup.fallback});
  final LvPopup popup;

  @override
  State<CouponPhoneDialog> createState() => _CouponPhoneDialogState();
}

class _CouponPhoneDialogState extends State<CouponPhoneDialog> {
  final _controller = TextEditingController();
  // Explicit FocusNode so we can call requestFocus() ourselves.
  // autofocus:true alone is unreliable inside dialogs on iPad (iPadOS) because
  // the software keyboard is suppressed until the route is fully settled.
  final _focusNode = FocusNode();
  String? _error;

  @override
  void initState() {
    super.initState();
    // Request focus after the first frame so the dialog route is settled and
    // the keyboard can appear on both iPhone and iPad.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _submit() {
    final digits = _controller.text.replaceAll(RegExp(r'\D'), '');
    // Egyptian mobile numbers are exactly 11 digits and start with "01".
    if (digits.length != 11 || !digits.startsWith('01')) {
      setState(
        () => _error = 'Mobile number must be 11 digits (e.g. 01XXXXXXXXX)',
      );
      return;
    }
    final norm = CouponService.normalizePhone(digits);
    if (norm == null) {
      setState(() => _error = 'Please enter a valid mobile number');
      return;
    }
    Navigator.of(context).pop(norm);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.primaryColor;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 28),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(24),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [primary, primary.withOpacity(0.78)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  const Text('🎁', style: TextStyle(fontSize: 38)),
                  const SizedBox(height: 8),
                  Text(
                    widget.popup.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Enter your phone number to claim your discount coupon',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
              child: Column(
                children: [
                  TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    keyboardType: TextInputType.phone,
                    // autofocus is intentionally omitted here; focus is
                    // requested explicitly in initState via addPostFrameCallback
                    // so the software keyboard appears reliably on iPad as well.
                    // Digits only, capped at 11 — can't type 10 or 12.
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(11),
                    ],
                    onChanged: (_) {
                      if (_error != null) setState(() => _error = null);
                    },
                    onSubmitted: (_) => _submit(),
                    decoration: InputDecoration(
                      hintText: 'e.g. 01XXXXXXXXX',
                      prefixIcon: const Icon(Icons.phone_rounded),
                      errorText: _error,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: primary, width: 1.6),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        'Get my coupon',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
