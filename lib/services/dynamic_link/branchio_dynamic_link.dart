import 'dart:async';

import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';

import '../../common/config/models/dynamic_link/dynamic_link.dart';
import '../../common/constants.dart';
import '../../models/entities/user.dart';
import 'dynamic_link_service.dart';

class BranchIODynamicLinkService extends DynamicLinkService {
  BranchIODynamicLinkService({
    required super.linkService,
    required this.branchIOConfig,
  }) : super(DynamicLinkType.branchIO);

  final BranchIOServiceConfig branchIOConfig;

  @override
  Future<void> initialize() async {
    if (branchIOConfig.isValidate == false) {
      printLog('[BranchIODynamicLinkService] BranchIOConfig is not valid');
      return;
    }

    await FlutterBranchSdk.init(
      enableLogging: false,
      branchAttributionLevel: BranchAttributionLevel.NONE,
    );
    // FlutterBranchSdk.setConsumerProtectionAttributionLevel(
    //   BranchAttributionLevel.FULL,
    // );

    // FlutterBranchSdk.validateSDKIntegration();

    FlutterBranchSdk.listSession().listen(
      (final data) {
        final String? canonicalUrl = data['\$canonical_url'];
        if (canonicalUrl != null) {
          printLog('[BranchIODynamicLinkService] canonicalUrl: $canonicalUrl');
          linkService.handleWebLink(canonicalUrl.toUri()!);
        }
      },
      onError: (error) {
        printLog(
          '[BranchIODynamicLinkService] listSession error: ${error.toString()}',
        );
      },
    );
  }

  @override
  Future<String?> createDynamicLink(
    String url, {
    required User? user,
    String? title,
    String? image,
    String? description,
  }) async {
    if (branchIOConfig.isValidate == false) {
      printLog('[BranchIODynamicLinkService] BranchIOConfig is not valid');
      return null;
    }

    final result = await _createDynamicLink(
      url,
      title: title,
      image: image,
      description: description,
    );
    printLog('[BranchIODynamicLinkService] Created the link: $result');
    return result;
  }

  Future<String?> _createDynamicLink(
    String url, {
    String? title,
    String? image,
    String? description,
  }) async {
    final buo = BranchUniversalObject(
      canonicalUrl: url,
      canonicalIdentifier: url,
      title: title ?? '',
      contentDescription: description ?? '',
      imageUrl: image ?? '',
      publiclyIndex: true,
      locallyIndex: true,
      // contentMetadata: BranchContentMetaData()
      //   ..addCustomMetadata('key', 'value'), // Add custom metadata as needed
    );

    final lp =
        BranchLinkProperties(
            channel: 'flutter-app',
            feature: 'share',
            // stage: 'new user'
          )
          ..addControlParam('\$desktop_url', url)
          ..addControlParam('\$android_deepview', 'branch_default')
    // ..addControlParam('\$deeplink_path', url)
    // ..addControlParam('\$android_url', url)
    ;

    final response = await FlutterBranchSdk.getShortUrl(
      buo: buo,
      linkProperties: lp,
    );

    if (response.success) {
      final result = '${response.result}';
      return result;
      // Use this link to share or display in your app
    } else {
      printLog('Error: ${response.errorCode} - ${response.errorMessage}');
      return null;
    }
  }

  @override
  Future<void> handleLink(String url) async {
    try {
      if (branchIOConfig.isValidate) {
        FlutterBranchSdk.handleDeepLink(url);
      }
    } catch (err, trace) {
      printError(err, trace);
    }
  }

  @override
  bool isSupportedLink(String url) {
    if (branchIOConfig.isValidate) {
      return branchIOConfig.isSupportedLink(url);
    }
    return false;
  }
}
