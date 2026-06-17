import 'package:flutter_test/flutter_test.dart';
import 'package:flux_ui/flux_ui.dart';
import 'package:inspireui/inspireui.dart';

void main() {
  group('HeaderConfig', () {
    test('fromJson should correctly initialize HeaderConfig object', () {
      final json = {
        'isSafeArea': true,
        'showSearch': false,
        'borderInput': true,
        'usePrimaryColor': false,
        'enableBackground': true,
        'title': 'Test Title',
        'type': 'rotate',
        'backgroundColor': '#FFFFFF',
        'textColor': '#000000',
        'alignment': 'center',
        'fontWeight': 500,
        'radius': 10,
        'fontSize': 18.0,
        'textOpacity': 0.8,
        'marginRight': 5.0,
        'marginLeft': 5.0,
        'marginTop': 10.0,
        'marginBottom': 10.0,
        'paddingLeft': 8.0,
        'paddingRight': 12.0,
        'paddingTop': 2.0,
        'paddingBottom': 2.0,
        'height': 50.0,
        'boxShadow': {
          'blurRadius': 5.0,
          'colorOpacity': 0.2,
          'spreadRadius': 5.0,
          'x': 0,
          'y': 0,
        },
        'rotate': ['90', '180', '270'],
        'minWidth': 100.0,
        'backgroundGradientColor': ['#FF0000', '#00FF00', '#0000FF'],
        'font': 'Arial',
      };

      final headerConfig = HeaderConfig.fromJson(json);

      expect(headerConfig.isSafeArea, true);
      expect(headerConfig.showSearch, false);
      expect(headerConfig.borderInput, true);
      expect(headerConfig.usePrimaryColor, false);
      expect(headerConfig.enableBackground, true);
      expect(headerConfig.title, 'Test Title');
      expect(headerConfig.type, 'rotate');
      expect(headerConfig.backgroundColor, '#FFFFFF');
      expect(headerConfig.textColor, '#000000');
      expect(headerConfig.alignment, 'center');
      expect(headerConfig.fontWeight, 500);
      expect(headerConfig.radius, 10);
      expect(headerConfig.fontSize, 18.0);
      expect(headerConfig.textOpacity, 0.8);
      expect(headerConfig.marginRight, 5.0);
      expect(headerConfig.marginLeft, 5.0);
      expect(headerConfig.marginTop, 10.0);
      expect(headerConfig.marginBottom, 10.0);
      expect(headerConfig.paddingLeft, 8.0);
      expect(headerConfig.paddingRight, 12.0);
      expect(headerConfig.paddingTop, 2.0);
      expect(headerConfig.paddingBottom, 2.0);
      expect(headerConfig.height, 50.0);
      expect(headerConfig.boxShadow, isNotNull);
      expect(headerConfig.boxShadow!.blurRadius, 5.0);
      expect(headerConfig.boxShadow!.colorOpacity, 0.2);
      expect(headerConfig.boxShadow!.spreadRadius, 5.0);
      expect(headerConfig.boxShadow!.x, 0);
      expect(headerConfig.boxShadow!.y, 0);
      expect(headerConfig.rotate, ['90', '180', '270']);
      expect(headerConfig.minWidth, 100.0);
      expect(headerConfig.backgroundGradientColor, isNotNull);
      expect(headerConfig.backgroundGradientColor!.length, 3);
      expect(headerConfig.backgroundGradientColor![0].valueNum, 0xFFFF0000);
      expect(headerConfig.backgroundGradientColor![1].valueNum, 0xFF00FF00);
      expect(headerConfig.backgroundGradientColor![2].valueNum, 0xFF0000FF);
      expect(headerConfig.font, 'Arial');
    });

    test('toJson should correctly serialize HeaderConfig object', () {
      final headerConfig = HeaderConfig(
        isSafeArea: true,
        showSearch: false,
        borderInput: true,
        usePrimaryColor: false,
        enableBackground: true,
        title: 'Test Title',
        type: 'rotate',
        backgroundColor: '#FFFFFF',
        textColor: '#000000',
        alignment: 'center',
        fontWeight: 500,
        radius: 10,
        fontSize: 18.0,
        textOpacity: 0.8,
        marginRight: 5.0,
        marginLeft: 5.0,
        marginTop: 10.0,
        marginBottom: 10.0,
        paddingLeft: 8.0,
        paddingRight: 12.0,
        paddingTop: 2.0,
        paddingBottom: 2.0,
        height: 50.0,
        boxShadow: BoxShadowConfig(
          blurRadius: 5.0,
          colorOpacity: 0.2,
          spreadRadius: 5.0,
          x: 0,
          y: 0,
        ),
        rotate: ['90', '180', '270'],
        minWidth: 100.0,
        backgroundGradientColor: [
          HexColor('#FF0000'),
          HexColor('#00FF00'),
          HexColor('#0000FF'),
        ],
        font: 'Arial',
      );

      final json = headerConfig.toJson();

      expect(json['isSafeArea'], true);
      expect(json['showSearch'], false);
      expect(json['borderInput'], true);
      expect(json['usePrimaryColor'], false);
      expect(json['enableBackground'], true);
      expect(json['title'], 'Test Title');
      expect(json['type'], 'rotate');
      expect(json['backgroundColor'], '#FFFFFF');
      expect(json['textColor'], '#000000');
      expect(json['alignment'], 'center');
      expect(json['fontWeight'], 500);
      expect(json['radius'], 10);
      expect(json['fontSize'], 18.0);
      expect(json['textOpacity'], 0.8);
      expect(json['marginRight'], 5.0);
      expect(json['marginLeft'], 5.0);
      expect(json['marginTop'], 10.0);
      expect(json['marginBottom'], 10.0);
      expect(json['paddingLeft'], 8.0);
      expect(json['paddingRight'], 12.0);
      expect(json['paddingTop'], 2.0);
      expect(json['paddingBottom'], 2.0);
      expect(json['height'], 50.0);
      expect(json['boxShadow'], isNotNull);
      expect(json['boxShadow']['blurRadius'], 5.0);
      expect(json['boxShadow']['colorOpacity'], 0.2);
      expect(json['boxShadow']['spreadRadius'], 5.0);
      expect(json['boxShadow']['x'], 0);
      expect(json['boxShadow']['y'], 0);
      expect(json['rotate'], ['90', '180', '270']);
      expect(json['minWidth'], 100.0);
      expect(json['backgroundGradientColor'], isNotNull);
      expect(json['backgroundGradientColor'].length, 3);
      expect(json['backgroundGradientColor'][0], 'ffff0000');
      expect(json['backgroundGradientColor'][1], 'ff00ff00');
      expect(json['backgroundGradientColor'][2], 'ff0000ff');
      expect(json['font'], 'Arial');
    });
  });
}
