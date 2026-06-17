import '../core/helpers/helpers.dart';
import 'enums/page_indicator.dart';
import 'enums/slider_layout_type.dart';

const _defaultLimitIndicator = 5;
const _maxLimitIndicator = 8;

class SliderListConfig {
  final SliderLayoutType type;
  final bool hideTag;
  final String? colorTag;
  final String? colorTextTag;
  final double? borderRadiusTag;
  final PageIndicatorType pageIndicatorType;
  final double? paddingContent;
  final double borderRadius;
  final bool autoPlay;
  final int? secondsAutoSliding;
  final int limitIndicator;

  const SliderListConfig({
    this.type = SliderLayoutType.contentEndCard,
    this.hideTag = false,
    this.colorTag,
    this.colorTextTag,
    this.pageIndicatorType = PageIndicatorType.line,
    this.paddingContent,
    this.borderRadiusTag,
    this.borderRadius = 3.0,
    this.autoPlay = false,
    this.secondsAutoSliding,
    this.limitIndicator = _defaultLimitIndicator,
  });

  factory SliderListConfig.fromJson(dynamic json) {
    var limitIndicator = num.tryParse(
      json['limitIndicator'].toString(),
    )?.toInt();

    if (limitIndicator == null) {
      limitIndicator = _defaultLimitIndicator;
    } else if (limitIndicator > _maxLimitIndicator) {
      limitIndicator = _maxLimitIndicator;
    }

    return SliderListConfig(
      type: SliderLayoutType.fromString(json['type']),
      hideTag: json['hideTag'] ?? false,
      colorTag: json['colorTag'],
      colorTextTag: json['colorTextTag'],
      pageIndicatorType: PageIndicatorType.fromString(
        json['pageIndicatorType'],
      ),
      paddingContent: FluxUiHelper.formatDouble(json['paddingContent']),
      borderRadiusTag:
          FluxUiHelper.formatDouble(json['borderRadiusTag']) ?? 5.0,
      borderRadius: FluxUiHelper.formatDouble(json['borderRadius']) ?? 3.0,
      autoPlay: json['autoPlay'] ?? false,
      secondsAutoSliding: num.tryParse(
        json['secondsAutoSliding'].toString(),
      )?.toInt(),
      limitIndicator: limitIndicator,
    );
  }

  Map toJson() {
    return {
      'type': type.name,
      'paddingContent': paddingContent,
      'borderRadius': borderRadius,
      'colorTag': colorTag,
      'colorTextTag': colorTextTag,
      'pageIndicatorType': pageIndicatorType.name,
      'hideTag': hideTag,
      'autoPlay': autoPlay,
      'secondsAutoSliding': secondsAutoSliding,
      'borderRadiusTag': borderRadiusTag,
      'limitIndicator': limitIndicator,
    };
  }
}
