// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewConfig {

 ReviewServiceType get service; bool get enableReview; bool get enableReviewImage; int get maxImage; JudgeServiceConfig get judgeConfig;
/// Create a copy of ReviewConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewConfigCopyWith<ReviewConfig> get copyWith => _$ReviewConfigCopyWithImpl<ReviewConfig>(this as ReviewConfig, _$identity);

  /// Serializes this ReviewConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewConfig&&(identical(other.service, service) || other.service == service)&&(identical(other.enableReview, enableReview) || other.enableReview == enableReview)&&(identical(other.enableReviewImage, enableReviewImage) || other.enableReviewImage == enableReviewImage)&&(identical(other.maxImage, maxImage) || other.maxImage == maxImage)&&(identical(other.judgeConfig, judgeConfig) || other.judgeConfig == judgeConfig));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,service,enableReview,enableReviewImage,maxImage,judgeConfig);

@override
String toString() {
  return 'ReviewConfig(service: $service, enableReview: $enableReview, enableReviewImage: $enableReviewImage, maxImage: $maxImage, judgeConfig: $judgeConfig)';
}


}

/// @nodoc
abstract mixin class $ReviewConfigCopyWith<$Res>  {
  factory $ReviewConfigCopyWith(ReviewConfig value, $Res Function(ReviewConfig) _then) = _$ReviewConfigCopyWithImpl;
@useResult
$Res call({
 ReviewServiceType service, bool enableReview, bool enableReviewImage, int maxImage, JudgeServiceConfig judgeConfig
});


$JudgeServiceConfigCopyWith<$Res> get judgeConfig;

}
/// @nodoc
class _$ReviewConfigCopyWithImpl<$Res>
    implements $ReviewConfigCopyWith<$Res> {
  _$ReviewConfigCopyWithImpl(this._self, this._then);

  final ReviewConfig _self;
  final $Res Function(ReviewConfig) _then;

/// Create a copy of ReviewConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? service = null,Object? enableReview = null,Object? enableReviewImage = null,Object? maxImage = null,Object? judgeConfig = null,}) {
  return _then(_self.copyWith(
service: null == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as ReviewServiceType,enableReview: null == enableReview ? _self.enableReview : enableReview // ignore: cast_nullable_to_non_nullable
as bool,enableReviewImage: null == enableReviewImage ? _self.enableReviewImage : enableReviewImage // ignore: cast_nullable_to_non_nullable
as bool,maxImage: null == maxImage ? _self.maxImage : maxImage // ignore: cast_nullable_to_non_nullable
as int,judgeConfig: null == judgeConfig ? _self.judgeConfig : judgeConfig // ignore: cast_nullable_to_non_nullable
as JudgeServiceConfig,
  ));
}
/// Create a copy of ReviewConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JudgeServiceConfigCopyWith<$Res> get judgeConfig {
  
  return $JudgeServiceConfigCopyWith<$Res>(_self.judgeConfig, (value) {
    return _then(_self.copyWith(judgeConfig: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReviewConfig].
extension ReviewConfigPatterns on ReviewConfig {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewConfig() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewConfig value)  $default,){
final _that = this;
switch (_that) {
case _ReviewConfig():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewConfig value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewConfig() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ReviewServiceType service,  bool enableReview,  bool enableReviewImage,  int maxImage,  JudgeServiceConfig judgeConfig)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewConfig() when $default != null:
return $default(_that.service,_that.enableReview,_that.enableReviewImage,_that.maxImage,_that.judgeConfig);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ReviewServiceType service,  bool enableReview,  bool enableReviewImage,  int maxImage,  JudgeServiceConfig judgeConfig)  $default,) {final _that = this;
switch (_that) {
case _ReviewConfig():
return $default(_that.service,_that.enableReview,_that.enableReviewImage,_that.maxImage,_that.judgeConfig);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ReviewServiceType service,  bool enableReview,  bool enableReviewImage,  int maxImage,  JudgeServiceConfig judgeConfig)?  $default,) {final _that = this;
switch (_that) {
case _ReviewConfig() when $default != null:
return $default(_that.service,_that.enableReview,_that.enableReviewImage,_that.maxImage,_that.judgeConfig);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReviewConfig implements ReviewConfig {
  const _ReviewConfig({this.service = ReviewServiceType.native, this.enableReview = false, this.enableReviewImage = false, this.maxImage = 2, this.judgeConfig = const JudgeServiceConfig()});
  factory _ReviewConfig.fromJson(Map<String, dynamic> json) => _$ReviewConfigFromJson(json);

@override@JsonKey() final  ReviewServiceType service;
@override@JsonKey() final  bool enableReview;
@override@JsonKey() final  bool enableReviewImage;
@override@JsonKey() final  int maxImage;
@override@JsonKey() final  JudgeServiceConfig judgeConfig;

/// Create a copy of ReviewConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewConfigCopyWith<_ReviewConfig> get copyWith => __$ReviewConfigCopyWithImpl<_ReviewConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewConfig&&(identical(other.service, service) || other.service == service)&&(identical(other.enableReview, enableReview) || other.enableReview == enableReview)&&(identical(other.enableReviewImage, enableReviewImage) || other.enableReviewImage == enableReviewImage)&&(identical(other.maxImage, maxImage) || other.maxImage == maxImage)&&(identical(other.judgeConfig, judgeConfig) || other.judgeConfig == judgeConfig));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,service,enableReview,enableReviewImage,maxImage,judgeConfig);

@override
String toString() {
  return 'ReviewConfig(service: $service, enableReview: $enableReview, enableReviewImage: $enableReviewImage, maxImage: $maxImage, judgeConfig: $judgeConfig)';
}


}

/// @nodoc
abstract mixin class _$ReviewConfigCopyWith<$Res> implements $ReviewConfigCopyWith<$Res> {
  factory _$ReviewConfigCopyWith(_ReviewConfig value, $Res Function(_ReviewConfig) _then) = __$ReviewConfigCopyWithImpl;
@override @useResult
$Res call({
 ReviewServiceType service, bool enableReview, bool enableReviewImage, int maxImage, JudgeServiceConfig judgeConfig
});


@override $JudgeServiceConfigCopyWith<$Res> get judgeConfig;

}
/// @nodoc
class __$ReviewConfigCopyWithImpl<$Res>
    implements _$ReviewConfigCopyWith<$Res> {
  __$ReviewConfigCopyWithImpl(this._self, this._then);

  final _ReviewConfig _self;
  final $Res Function(_ReviewConfig) _then;

/// Create a copy of ReviewConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? service = null,Object? enableReview = null,Object? enableReviewImage = null,Object? maxImage = null,Object? judgeConfig = null,}) {
  return _then(_ReviewConfig(
service: null == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as ReviewServiceType,enableReview: null == enableReview ? _self.enableReview : enableReview // ignore: cast_nullable_to_non_nullable
as bool,enableReviewImage: null == enableReviewImage ? _self.enableReviewImage : enableReviewImage // ignore: cast_nullable_to_non_nullable
as bool,maxImage: null == maxImage ? _self.maxImage : maxImage // ignore: cast_nullable_to_non_nullable
as int,judgeConfig: null == judgeConfig ? _self.judgeConfig : judgeConfig // ignore: cast_nullable_to_non_nullable
as JudgeServiceConfig,
  ));
}

/// Create a copy of ReviewConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JudgeServiceConfigCopyWith<$Res> get judgeConfig {
  
  return $JudgeServiceConfigCopyWith<$Res>(_self.judgeConfig, (value) {
    return _then(_self.copyWith(judgeConfig: value));
  });
}
}

// dart format on
