import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';
import 'package:flux_ui/flux_ui.dart';
import 'package:inspireui/inspireui.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../screens/common/countdown_mixin.dart';
import '../../../widgets/common/common_safe_area.dart';
import '../sms_model.dart';

const _codeLength = 6;
const _countDownTime = 30;

class SMSVerifyV2 extends StatefulWidget {
  final Function onCallBack;
  final Function(VoidCallback) onResend;

  const SMSVerifyV2({
    super.key,
    required this.onCallBack,
    required this.onResend,
  });

  @override
  State<SMSVerifyV2> createState() => _SMSVerifyV2State();
}

class _SMSVerifyV2State extends State<SMSVerifyV2>
    with CountdownMixin, CodeAutoFill {
  final PinInputController _pinCodeController = PinInputController();

  SMSModel get model => Provider.of<SMSModel>(context, listen: false);

  @override
  void codeUpdated() {
    if (mounted &&
        code != null &&
        code!.isNotEmpty &&
        code != _pinCodeController.text) {
      _pinCodeController.setText(code ?? '');
      onSendCode();
    }
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    listenForCode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pinCodeController.requestFocus();
    });
  }

  @override
  void dispose() {
    _pinCodeController.dispose();
    cancel();
    super.dispose();
  }

  void resendTheOTP() {
    widget.onResend(startTimer);
    // startTimer();
  }

  void onSendCode() {
    Tools.hideKeyboard(context);
    model.updateSMSCode(_pinCodeController.text);
    widget.onCallBack();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).primaryTextTheme.displaySmall?.copyWith(
      color: Theme.of(context).primaryColor,
    );
    final fontSize = textStyle?.fontSize;
    final fieldHeight = fontSize != null ? fontSize * 1.4 : null;
    return AutoHideKeyboard(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).otpVerification,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 12.0),
                  Text.rich(
                    TextSpan(
                      text: S.of(context).weSentAnOTPTo,
                      children: [
                        TextSpan(
                          text:
                              ' (${model.countryDialCode}) ${model.phoneNumberWithoutZero}',
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ],
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 36.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: MaterialPinField(
                        pinController: _pinCodeController,
                        keyboardType: TextInputType.number,
                        theme: MaterialPinTheme(
                          shape: MaterialPinShape.underlined,
                          cellSize: Size(40, fieldHeight ?? 50),
                          borderWidth: 2,
                          filledBorderColor: Theme.of(
                            context,
                          ).primaryColor.withValueOpacity(0.5),
                          focusedBorderColor: Theme.of(context).primaryColor,
                          borderColor: Theme.of(
                            context,
                          ).primaryColor.withValueOpacity(0.5),
                          disabledBorderColor: Theme.of(context).disabledColor,
                          cursorHeight: 30,
                          cursorColor: Theme.of(context).primaryColor,
                          obscuringCharacter: '*',
                          textStyle: textStyle,
                          entryAnimation: MaterialPinAnimation.scale,
                          animationDuration: const Duration(milliseconds: 300),
                        ),
                        length: _codeLength,
                        hapticFeedbackType: HapticFeedbackType.light,
                        enableHapticFeedback: true,
                        onChanged: (value) {
                          if (value.length == 6) onSendCode();
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 28.0),
                ],
              ),
            ),
          ),
          CommonSafeArea(
            child: SizedBox(
              height: 48,
              width: double.infinity,
              child: ValueListenableBuilder<int>(
                valueListenable: timeCtr,
                builder: (context, value, child) {
                  return ElevatedButton(
                    onPressed: value == 0 ? resendTheOTP : null,
                    child: Text(
                      'Resend the OTP${value == 0 ? '' : " (00:${value.toString().padLeft(2, '0')})"}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  int get initCountdownTime => _countDownTime;
}
