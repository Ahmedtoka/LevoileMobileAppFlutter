import 'package:flutter_test/flutter_test.dart';
import 'package:flux_ui/src/entities/logo_config.dart';
import 'package:inspireui/utils/colors.dart';

void main() {
  group('LogoConfig', () {
    test('toJson should return a valid JSON map', () {
      final logoConfig = LogoConfig(
        layout: 'logo',
        showMenu: true,
        showLogo: true,
        showSearch: true,
        color: HexColor('#FFFFFF'),
        menuIcon: MenuIcon(name: 'menu', fontFamily: 'MaterialIcons'),
      );

      final json = logoConfig.toJson();

      expect(json['layout'], equals('logo'));
      expect(json['showMenu'], equals(true));
      expect(json['showLogo'], equals(true));
      expect(json['showSearch'], equals(true));
      expect(json['color'], equals('ffffffff'));
      expect(json['menuIcon'], isNotNull);
      expect(json['menuIcon']['name'], equals('menu'));
      expect(json['menuIcon']['fontFamily'], equals('MaterialIcons'));
    });

    test('fromJson should populate the object correctly', () {
      final json = {
        'layout': 'logo',
        'showMenu': true,
        'showLogo': true,
        'showSearch': true,
        'color': '#FFFFFF',
        'menuIcon': {'name': 'menu', 'fontFamily': 'MaterialIcons'},
      };

      final logoConfig = LogoConfig.fromJson(json);

      expect(logoConfig.layout, equals('logo'));
      expect(logoConfig.showMenu, equals(true));
      expect(logoConfig.showLogo, equals(true));
      expect(logoConfig.showSearch, equals(true));
      expect(logoConfig.color, equals(HexColor('#FFFFFF')));
      expect(logoConfig.menuIcon, isNotNull);
      expect(logoConfig.menuIcon!.name, equals('menu'));
      expect(logoConfig.menuIcon!.fontFamily, equals('MaterialIcons'));
    });

    test('copyWith should create a new object with updated values', () {
      final originalConfig = LogoConfig(
        layout: 'logo',
        showMenu: true,
        showLogo: true,
        showSearch: true,
        color: HexColor('#FFFFFF'),
        menuIcon: MenuIcon(name: 'menu', fontFamily: 'MaterialIcons'),
      );

      final updatedConfig = originalConfig.copyWith(
        showMenu: false,
        showSearch: false,
      );

      expect(updatedConfig.layout, equals('logo'));
      expect(updatedConfig.showMenu, equals(false));
      expect(updatedConfig.showLogo, equals(true));
      expect(updatedConfig.showSearch, equals(false));
      expect(updatedConfig.color, equals(HexColor('#FFFFFF')));
      expect(updatedConfig.menuIcon, isNotNull);
      expect(updatedConfig.menuIcon!.name, equals('menu'));
      expect(updatedConfig.menuIcon!.fontFamily, equals('MaterialIcons'));
    });
  });

  test('MenuIcon toJson should return a valid JSON map', () {
    final menuIcon = MenuIcon(name: 'menu', fontFamily: 'MaterialIcons');

    final json = menuIcon.toJson();

    expect(json['name'], equals('menu'));
    expect(json['fontFamily'], equals('MaterialIcons'));
  });

  test('MenuIcon fromJson should populate the object correctly', () {
    final json = {'name': 'menu', 'fontFamily': 'MaterialIcons'};

    final menuIcon = MenuIcon.fromJson(json);

    expect(menuIcon.name, equals('menu'));
    expect(menuIcon.fontFamily, equals('MaterialIcons'));
  });
}
