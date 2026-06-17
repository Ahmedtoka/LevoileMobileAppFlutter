class BlogDetailConfig {
  final bool showComment;
  final bool showHeart;
  final bool showSharing;
  final bool showTextAdjustment;
  final bool enableAudioSupport;
  final bool showRelatedBlog;
  final bool showAuthorInfo;

  const BlogDetailConfig({
    this.showComment = true,
    this.showHeart = true,
    this.showSharing = true,
    this.showTextAdjustment = true,
    this.enableAudioSupport = false,
    this.showRelatedBlog = true,
    this.showAuthorInfo = true,
  });

  Map toJson() {
    var map = <String, dynamic>{
      'showComment': showComment,
      'showHeart': showHeart,
      'showSharing': showSharing,
      'showTextAdjustment': showTextAdjustment,
      'enableAudioSupport': enableAudioSupport,
      'showRelatedBlog': showRelatedBlog,
      'showAuthorInfo': showAuthorInfo,
    };
    return map;
  }

  factory BlogDetailConfig.fromJson(Map json) {
    return BlogDetailConfig(
      showComment: json['showComment'] ?? true,
      showHeart: json['showHeart'] ?? true,
      showSharing: json['showSharing'] ?? true,
      showTextAdjustment: json['showTextAdjustment'] ?? true,
      enableAudioSupport: json['enableAudioSupport'] ?? false,
      showRelatedBlog: json['showRelatedBlog'] ?? true,
      showAuthorInfo: json['showAuthorInfo'] ?? true,
    );
  }

  BlogDetailConfig copyWith({
    bool? showComment,
    bool? showHeart,
    bool? showSharing,
    bool? showTextAdjustment,
    bool? enableAudioSupport,
    bool? showRelatedBlog,
    bool? showAuthorInfo,
  }) {
    return BlogDetailConfig(
      showComment: showComment ?? this.showComment,
      showHeart: showHeart ?? this.showHeart,
      showSharing: showSharing ?? this.showSharing,
      showTextAdjustment: showTextAdjustment ?? this.showTextAdjustment,
      enableAudioSupport: enableAudioSupport ?? this.enableAudioSupport,
      showRelatedBlog: showRelatedBlog ?? this.showRelatedBlog,
      showAuthorInfo: showAuthorInfo ?? this.showAuthorInfo,
    );
  }
}
