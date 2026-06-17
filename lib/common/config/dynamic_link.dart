part of '../config.dart';

DynamicLinkConfig get dynamicLinkConfig => Configurations.dynamicLinkConfig;

Map<CustomPath, List<String>> get customPathsToHandleDeepLink {
  final config =
      dynamicLinkConfig.serviceConfigs[DynamicLinkType.selfhosted]
          as SelfHostedDynamicLinkServiceConfig?;
  return config?.customPaths ?? {};
}
