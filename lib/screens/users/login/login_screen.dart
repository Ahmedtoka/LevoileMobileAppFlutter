import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';
import 'package:flux_ui/flux_ui.dart';
import 'package:inspireui/inspireui.dart';
import 'package:provider/provider.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';

import '../../../app.dart';
import '../../../common/config.dart';
import '../../../common/constants.dart';
import '../../../common/tools.dart';
import '../../../common/tools/biometrics_tools.dart';
import '../../../data/boxes.dart';
import '../../../models/index.dart';
import '../../../modules/dynamic_layout/helper/helper.dart';
import '../../../services/index.dart';
import '../../../widgets/auth/sign_in_with_apple_button.dart';
import '../../../widgets/auth/social_login_button_row.dart';
import '../../../widgets/common/custom_text_field.dart';
import '../../../widgets/common/login_animation.dart';
import '../../base_screen.dart';
import '../mixins/base_auth_mixin.dart';
import '../mixins/social_login_mixin.dart';
import '../widgets/separated_or_widget.dart';
import 'login_screen_web.dart';
import 'mixins/login_mixin.dart';
import 'mixins/mixin_animation_button_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (Layout.isDisplayDesktop(context)) {
      return const LoginScreenWeb();
    }
    return const LoginScreenMobile();
  }
}

class LoginScreenMobile extends StatefulWidget {
  const LoginScreenMobile();

  @override
  BaseScreen<LoginScreenMobile> createState() => _LoginPageState();
}

class _LoginPageState extends BaseScreen<LoginScreenMobile>
    with
        TickerProviderStateMixin,
        AnimationButtonLoginMixin,
        BaseAuthMixin,
        LoginMixin,
        SocialLoginMixin {
  late BuildContext _parentContext;

  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  Future _biometricsLogin(BuildContext context) async {
    var didAuth = await BiometricsTools.instance.localAuth(context);
    if (didAuth) {
      usernameCtrl.text = BiometricsBox().username ?? '';
      passwordCtrl.text = BiometricsBox().password ?? '';
      _onTapLogin();
    }
  }

  void _onTapLogin() {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }

    runLogin(context);
  }

  void _onClosed() {
    Navigator.of(
      App.fluxStoreNavigatorKey.currentContext!,
    ).pushReplacementNamed(RouteList.dashboard);
  }

  @override
  TextEditingController passwordCtrl = TextEditingController();

  @override
  TextEditingController usernameCtrl = TextEditingController();

  @override
  Future<void> beforeCallLogin([
    AnimationButtonLoginType type = AnimationButtonLoginType.usernamePassword,
  ]) => playAnimation(type);

  @override
  Future<void> afterCallLogin(
    bool isLoginSuccess, [
    AnimationButtonLoginType type = AnimationButtonLoginType.usernamePassword,
  ]) => stopAnimation(type);

  @override
  void dispose() {
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  /// Shopify's hosted login page offers Google and Facebook but has no native
  /// Sign in with Apple, so App Store guideline 4.8 requires us to present our
  /// own. Optimistically true on iOS, then confirmed against the device.
  bool _isAppleSignInAvailable = isIos;

  bool get _showAppleSignIn =>
      _isAppleSignInAvailable &&
      kLoginSetting.showAppleLogin &&
      (kLoginSetting.appleLoginSetting?.bridgeEndpoint?.isNotEmpty ?? false);

  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    await super.afterFirstLayout(context);
    if (!_isAppleSignInAvailable) {
      return;
    }
    try {
      final available = await TheAppleSignIn.isAvailable();
      if (!mounted || available == _isAppleSignInAvailable) {
        return;
      }
      setState(() => _isAppleSignInAvailable = available);
    } catch (err, trace) {
      printError(err, trace, '[LoginScreen] Apple sign-in availability');
    }
  }

  @override
  Widget build(BuildContext context) {
    _parentContext = context;
    final appModel = Provider.of<AppModel>(context);
    final screenSize = MediaQuery.sizeOf(context);

    final themeConfig = appModel.themeConfig;
    final forgetPasswordUrl =
        appModel.appConfig?.forgetPassword ?? ServerConfig().forgetPassword;

    /// Built once and placed in both login modes below. Shopify disables the
    /// in-app social row entirely (ServerConfig.isSocialLoginSupported is false
    /// for Shopify), so this button is the app's only guideline 4.8 login
    /// option — it must not be tied to whichever sign-in mode is configured.
    final appleSignInButton = _showAppleSignIn
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SignInWithAppleButton(
              enabled: !isLoading,
              onPressed: () => loginWithApple(context),
            ),
          )
        : null;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0.0,
        actions:
            !Services().widget.isRequiredLogin &&
                !ModalRoute.of(context)!.canPop
            ? [
                IconButton(
                  onPressed: _onClosed,
                  icon: const Icon(Icons.close, size: 25),
                ),
              ]
            : null,
      ),
      body: Stack(
        children: [
          SafeArea(
        child: AutoHideKeyboard(
          child: IgnorePointer(
            ignoring: isLoading,
            child: Center(
              child: Consumer<UserModel>(
                builder: (context, model, child) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    alignment: Alignment.center,
                    width:
                        screenSize.width /
                        (2 / (screenSize.height / screenSize.width)),
                    constraints: const BoxConstraints(maxWidth: 700),
                    child: AutofillGroup(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: FractionallySizedBox(
                              widthFactor: 0.8,
                              child: FluxImage(
                                imageUrl: themeConfig.logo,
                                fit: BoxFit.contain,
                                useExtendedImage: false,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: SingleChildScrollView(
                              physics: const NeverScrollableScrollPhysics(),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (!shopifyCustomerAccountConfig.enabled) ...[
                                  const SizedBox(height: 20.0),
                                  CustomTextField(
                                    key: const Key('loginEmailField'),
                                    controller: usernameCtrl,
                                    autofillHints: const [AutofillHints.email],
                                    showCancelIcon: true,
                                    autocorrect: false,
                                    enableSuggestions: false,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.emailAddress,
                                    nextNode: _usernameFocusNode,
                                    decoration: InputDecoration(
                                      labelText: S.of(_parentContext).username,
                                      hintText: S
                                          .of(_parentContext)
                                          .enterYourEmailOrUsername,
                                    ),
                                  ),
                                  CustomTextField(
                                    key: const Key('loginPasswordField'),
                                    autofillHints: const [
                                      AutofillHints.password,
                                    ],
                                    obscureText: true,
                                    showEyeIcon: true,
                                    textInputAction: TextInputAction.done,
                                    controller: passwordCtrl,
                                    focusNode: _passwordFocusNode,
                                    decoration: InputDecoration(
                                      labelText: S.of(_parentContext).password,
                                      hintText: S
                                          .of(_parentContext)
                                          .enterYourPassword,
                                    ),
                                  ),
                                  if (kLoginSetting.isResetPasswordSupported)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12.0,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          launchForgetPasswordURL(
                                            forgetPasswordUrl,
                                          );
                                        },
                                        behavior: HitTestBehavior.opaque,
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Text(
                                            S.of(context).resetPassword,
                                            style: TextStyle(
                                              color: Theme.of(
                                                context,
                                              ).primaryColor,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (!kLoginSetting.isResetPasswordSupported)
                                    const SizedBox(height: 50.0),
                                  StaggerAnimation(
                                    key: const Key('loginSubmitButton'),
                                    titleButton: S.of(context).signIn,
                                    buttonController:
                                        loginButtonController.view
                                            as AnimationController,
                                    onTap: () =>
                                        isLoading ? null : _onTapLogin(),
                                  ),
                                  ?appleSignInButton,
                                  ],
                                  if (BiometricsTools.instance.isLoginSupported)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: IconButton(
                                        iconSize: 50,
                                        onPressed: () =>
                                            _biometricsLogin(context),
                                        icon: const Icon(
                                          Icons.fingerprint_outlined,
                                        ),
                                      ),
                                    ),
                                  if (shopifyCustomerAccountConfig.enabled) ...[
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8.0,
                                      ),
                                      child: StaggerAnimation(
                                        titleButton: S
                                            .of(context)
                                            .signInWithEmail,
                                        buttonController:
                                            loginEmailButtonController.view
                                                as AnimationController,
                                        onTap: () => isLoading
                                            ? null
                                            : loginWithCustomerAccountShopify(
                                                context,
                                              ),
                                      ),
                                    ),
                                    ?appleSignInButton,
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: TextButton(
                                        onPressed: () => Navigator.of(context)
                                            .pushNamedAndRemoveUntil(
                                              RouteList.dashboard,
                                              (route) => false,
                                            ),
                                        child: Text(
                                          S.of(context).skip,
                                          style: TextStyle(
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.secondary,
                                            decoration: TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                  if (kLoginSetting.isAnySocialLoginEnabled &&
                                      ServerConfig()
                                          .isSocialLoginSupported) ...[
                                    const SeparatedOrWidget(),
                                    SocialLoginButtonRow(
                                      onApplePressed: () =>
                                          loginWithApple(context),
                                      onFacebookPressed: () =>
                                          loginWithFacebook(context),
                                      onGooglePressed: () =>
                                          loginWithGoogle(context),
                                      onSmsPressed: () => loginWithSMS(context),
                                    ),
                                  ],
                                  const SizedBox(height: 30.0),
                                  if (kLoginSetting.enableRegister &&
                                      !shopifyCustomerAccountConfig.enabled)
                                    Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          spacing: 4,
                                          children: <Widget>[
                                            Text(S.of(context).dontHaveAccount),
                                            GestureDetector(
                                              onTap: () {
                                                NavigateTools.navigateRegister(
                                                  context,
                                                );
                                              },
                                              child: Text(
                                                S.of(context).signup,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(
                                                    context,
                                                  ).primaryColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  const SizedBox(height: 30.0),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
          // Chic branded loading while the sign-in resolves.
          if (isLoading)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.35),
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 26,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.12),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/app_icon_transparent.png',
                        height: 46,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 18),
                      SizedBox(
                        width: 34,
                        height: 34,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Signing you in…',
                        style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
