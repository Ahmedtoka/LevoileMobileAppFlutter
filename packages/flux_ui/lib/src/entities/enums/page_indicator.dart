enum PageIndicatorType {
  line,
  circle;

  bool get isCircle => this == PageIndicatorType.circle;
  bool get isLine => this == PageIndicatorType.line;

  factory PageIndicatorType.fromString(String? pageIndicatorType) {
    if (pageIndicatorType == circle.name) {
      return PageIndicatorType.circle;
    }

    return PageIndicatorType.line;
  }
}
