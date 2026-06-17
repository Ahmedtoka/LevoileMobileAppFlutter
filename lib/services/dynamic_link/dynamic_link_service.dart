import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:inspireui/utils/logs.dart';

import '../../common/config/models/dynamic_link/dynamic_link_type.dart';
import '../../models/entities/user.dart';
import '../link_service.dart';

abstract class DynamicLinkService {
  DynamicLinkService(this._type, {required this.linkService});

  final LinkService linkService;

  final DynamicLinkType _type;

  Future<void> initialize();

  Future<String?> createDynamicLink(
    String url, {
    required User? user,
    String? title,
    String? image,
    String? description,
  });

  Future<void> handleLink(String url);

  bool isSupportedLink(String url);
}

class UnifiedDynamicLinkService extends DynamicLinkService {
  final List<DynamicLinkService> _dynamicLinkServices;
  late final DynamicLinkService? _mainService;
  final bool _allowShareLink;

  final AppLinks _appLinks = AppLinks();
  bool _isInitialLinkHandled = false;
  Uri? _initialUri;

  UnifiedDynamicLinkService({
    required List<DynamicLinkService> dynamicLinkServices,
    required bool allowShareLink,
    required super.linkService,
    required DynamicLinkType type,
  }) : _dynamicLinkServices = dynamicLinkServices,
       _allowShareLink = allowShareLink,
       super(type) {
    _mainService = _dynamicLinkServices.firstWhereOrNull(
      (element) => element._type == type,
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
    if (_allowShareLink == false || _mainService == null) return null;

    return _mainService.createDynamicLink(
      url,
      user: user,
      title: title,
      image: image,
      description: description,
    );
  }

  @override
  Future<void> handleLink(String url) async {
    for (var service in _dynamicLinkServices) {
      if (service.isSupportedLink(url)) {
        return service.handleLink(url);
      }
    }

    final uri = Uri.tryParse(url);
    if (uri != null) {
      return linkService.handleWebLink(uri);
    }
  }

  @override
  Future<void> initialize() async {
    try {
      // Handle initial link when app is launched from a link
      final initialUri = await _appLinks.getInitialLink();
      if (initialUri != null && !_isInitialLinkHandled) {
        printLog('[AppLinks] Initial link: $initialUri');
        _initialUri = initialUri;
        await handleLink(initialUri.toString());
        _isInitialLinkHandled = true;
      }

      // Listen for incoming links when app is already running
      _appLinks.uriLinkStream.listen(
        (uri) async {
          // Skip the first stream event that matches the cold-start URI
          if (_isInitialLinkHandled && uri == _initialUri) {
            _initialUri = null;
            return;
          }
          printLog('[AppLinks] Incoming link: $uri');
          try {
            await handleLink(uri.toString());
          } catch (error) {
            printLog('[AppLinks] Failed to handle incoming link: $error');
          }
        },
        onError: (error) {
          printLog('[AppLinks] Link stream error: $error');
        },
      );
    } catch (error) {
      printLog('[AppLinks] Initialization error: $error');
    }

    for (var service in _dynamicLinkServices) {
      unawaited(service.initialize());
    }
  }

  @override
  @protected
  bool isSupportedLink(String url) {
    throw UnimplementedError();
  }
}
