// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'featured_vendor_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeaturedVendorConfig implements DiagnosticableTreeMixin {

/// Label header name
 String? get name; int get columnCount; bool get showRating; bool get enableAutoSliding; int? get durationAutoSliding; bool get enableBackground; bool get isSnapping; int? get limit; String get imageBoxfit; String get alignment;
/// Create a copy of FeaturedVendorConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeaturedVendorConfigCopyWith<FeaturedVendorConfig> get copyWith => _$FeaturedVendorConfigCopyWithImpl<FeaturedVendorConfig>(this as FeaturedVendorConfig, _$identity);

  /// Serializes this FeaturedVendorConfig to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FeaturedVendorConfig'))
    ..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('columnCount', columnCount))..add(DiagnosticsProperty('showRating', showRating))..add(DiagnosticsProperty('enableAutoSliding', enableAutoSliding))..add(DiagnosticsProperty('durationAutoSliding', durationAutoSliding))..add(DiagnosticsProperty('enableBackground', enableBackground))..add(DiagnosticsProperty('isSnapping', isSnapping))..add(DiagnosticsProperty('limit', limit))..add(DiagnosticsProperty('imageBoxfit', imageBoxfit))..add(DiagnosticsProperty('alignment', alignment));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeaturedVendorConfig&&(identical(other.name, name) || other.name == name)&&(identical(other.columnCount, columnCount) || other.columnCount == columnCount)&&(identical(other.showRating, showRating) || other.showRating == showRating)&&(identical(other.enableAutoSliding, enableAutoSliding) || other.enableAutoSliding == enableAutoSliding)&&(identical(other.durationAutoSliding, durationAutoSliding) || other.durationAutoSliding == durationAutoSliding)&&(identical(other.enableBackground, enableBackground) || other.enableBackground == enableBackground)&&(identical(other.isSnapping, isSnapping) || other.isSnapping == isSnapping)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.imageBoxfit, imageBoxfit) || other.imageBoxfit == imageBoxfit)&&(identical(other.alignment, alignment) || other.alignment == alignment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,columnCount,showRating,enableAutoSliding,durationAutoSliding,enableBackground,isSnapping,limit,imageBoxfit,alignment);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FeaturedVendorConfig(name: $name, columnCount: $columnCount, showRating: $showRating, enableAutoSliding: $enableAutoSliding, durationAutoSliding: $durationAutoSliding, enableBackground: $enableBackground, isSnapping: $isSnapping, limit: $limit, imageBoxfit: $imageBoxfit, alignment: $alignment)';
}


}

/// @nodoc
abstract mixin class $FeaturedVendorConfigCopyWith<$Res>  {
  factory $FeaturedVendorConfigCopyWith(FeaturedVendorConfig value, $Res Function(FeaturedVendorConfig) _then) = _$FeaturedVendorConfigCopyWithImpl;
@useResult
$Res call({
 String? name, int columnCount, bool showRating, bool enableAutoSliding, int? durationAutoSliding, bool enableBackground, bool isSnapping, int? limit, String imageBoxfit, String alignment
});




}
/// @nodoc
class _$FeaturedVendorConfigCopyWithImpl<$Res>
    implements $FeaturedVendorConfigCopyWith<$Res> {
  _$FeaturedVendorConfigCopyWithImpl(this._self, this._then);

  final FeaturedVendorConfig _self;
  final $Res Function(FeaturedVendorConfig) _then;

/// Create a copy of FeaturedVendorConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? columnCount = null,Object? showRating = null,Object? enableAutoSliding = null,Object? durationAutoSliding = freezed,Object? enableBackground = null,Object? isSnapping = null,Object? limit = freezed,Object? imageBoxfit = null,Object? alignment = null,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,columnCount: null == columnCount ? _self.columnCount : columnCount // ignore: cast_nullable_to_non_nullable
as int,showRating: null == showRating ? _self.showRating : showRating // ignore: cast_nullable_to_non_nullable
as bool,enableAutoSliding: null == enableAutoSliding ? _self.enableAutoSliding : enableAutoSliding // ignore: cast_nullable_to_non_nullable
as bool,durationAutoSliding: freezed == durationAutoSliding ? _self.durationAutoSliding : durationAutoSliding // ignore: cast_nullable_to_non_nullable
as int?,enableBackground: null == enableBackground ? _self.enableBackground : enableBackground // ignore: cast_nullable_to_non_nullable
as bool,isSnapping: null == isSnapping ? _self.isSnapping : isSnapping // ignore: cast_nullable_to_non_nullable
as bool,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,imageBoxfit: null == imageBoxfit ? _self.imageBoxfit : imageBoxfit // ignore: cast_nullable_to_non_nullable
as String,alignment: null == alignment ? _self.alignment : alignment // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FeaturedVendorConfig].
extension FeaturedVendorConfigPatterns on FeaturedVendorConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeaturedVendorConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeaturedVendorConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeaturedVendorConfig value)  $default,){
final _that = this;
switch (_that) {
case _FeaturedVendorConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeaturedVendorConfig value)?  $default,){
final _that = this;
switch (_that) {
case _FeaturedVendorConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  int columnCount,  bool showRating,  bool enableAutoSliding,  int? durationAutoSliding,  bool enableBackground,  bool isSnapping,  int? limit,  String imageBoxfit,  String alignment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeaturedVendorConfig() when $default != null:
return $default(_that.name,_that.columnCount,_that.showRating,_that.enableAutoSliding,_that.durationAutoSliding,_that.enableBackground,_that.isSnapping,_that.limit,_that.imageBoxfit,_that.alignment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  int columnCount,  bool showRating,  bool enableAutoSliding,  int? durationAutoSliding,  bool enableBackground,  bool isSnapping,  int? limit,  String imageBoxfit,  String alignment)  $default,) {final _that = this;
switch (_that) {
case _FeaturedVendorConfig():
return $default(_that.name,_that.columnCount,_that.showRating,_that.enableAutoSliding,_that.durationAutoSliding,_that.enableBackground,_that.isSnapping,_that.limit,_that.imageBoxfit,_that.alignment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  int columnCount,  bool showRating,  bool enableAutoSliding,  int? durationAutoSliding,  bool enableBackground,  bool isSnapping,  int? limit,  String imageBoxfit,  String alignment)?  $default,) {final _that = this;
switch (_that) {
case _FeaturedVendorConfig() when $default != null:
return $default(_that.name,_that.columnCount,_that.showRating,_that.enableAutoSliding,_that.durationAutoSliding,_that.enableBackground,_that.isSnapping,_that.limit,_that.imageBoxfit,_that.alignment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FeaturedVendorConfig with DiagnosticableTreeMixin implements FeaturedVendorConfig {
  const _FeaturedVendorConfig({this.name, this.columnCount = 3, this.showRating = true, this.enableAutoSliding = false, this.durationAutoSliding, this.enableBackground = false, this.isSnapping = false, this.limit, this.imageBoxfit = 'cover', this.alignment = 'centerStart'});
  factory _FeaturedVendorConfig.fromJson(Map<String, dynamic> json) => _$FeaturedVendorConfigFromJson(json);

/// Label header name
@override final  String? name;
@override@JsonKey() final  int columnCount;
@override@JsonKey() final  bool showRating;
@override@JsonKey() final  bool enableAutoSliding;
@override final  int? durationAutoSliding;
@override@JsonKey() final  bool enableBackground;
@override@JsonKey() final  bool isSnapping;
@override final  int? limit;
@override@JsonKey() final  String imageBoxfit;
@override@JsonKey() final  String alignment;

/// Create a copy of FeaturedVendorConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeaturedVendorConfigCopyWith<_FeaturedVendorConfig> get copyWith => __$FeaturedVendorConfigCopyWithImpl<_FeaturedVendorConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeaturedVendorConfigToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FeaturedVendorConfig'))
    ..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('columnCount', columnCount))..add(DiagnosticsProperty('showRating', showRating))..add(DiagnosticsProperty('enableAutoSliding', enableAutoSliding))..add(DiagnosticsProperty('durationAutoSliding', durationAutoSliding))..add(DiagnosticsProperty('enableBackground', enableBackground))..add(DiagnosticsProperty('isSnapping', isSnapping))..add(DiagnosticsProperty('limit', limit))..add(DiagnosticsProperty('imageBoxfit', imageBoxfit))..add(DiagnosticsProperty('alignment', alignment));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeaturedVendorConfig&&(identical(other.name, name) || other.name == name)&&(identical(other.columnCount, columnCount) || other.columnCount == columnCount)&&(identical(other.showRating, showRating) || other.showRating == showRating)&&(identical(other.enableAutoSliding, enableAutoSliding) || other.enableAutoSliding == enableAutoSliding)&&(identical(other.durationAutoSliding, durationAutoSliding) || other.durationAutoSliding == durationAutoSliding)&&(identical(other.enableBackground, enableBackground) || other.enableBackground == enableBackground)&&(identical(other.isSnapping, isSnapping) || other.isSnapping == isSnapping)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.imageBoxfit, imageBoxfit) || other.imageBoxfit == imageBoxfit)&&(identical(other.alignment, alignment) || other.alignment == alignment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,columnCount,showRating,enableAutoSliding,durationAutoSliding,enableBackground,isSnapping,limit,imageBoxfit,alignment);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FeaturedVendorConfig(name: $name, columnCount: $columnCount, showRating: $showRating, enableAutoSliding: $enableAutoSliding, durationAutoSliding: $durationAutoSliding, enableBackground: $enableBackground, isSnapping: $isSnapping, limit: $limit, imageBoxfit: $imageBoxfit, alignment: $alignment)';
}


}

/// @nodoc
abstract mixin class _$FeaturedVendorConfigCopyWith<$Res> implements $FeaturedVendorConfigCopyWith<$Res> {
  factory _$FeaturedVendorConfigCopyWith(_FeaturedVendorConfig value, $Res Function(_FeaturedVendorConfig) _then) = __$FeaturedVendorConfigCopyWithImpl;
@override @useResult
$Res call({
 String? name, int columnCount, bool showRating, bool enableAutoSliding, int? durationAutoSliding, bool enableBackground, bool isSnapping, int? limit, String imageBoxfit, String alignment
});




}
/// @nodoc
class __$FeaturedVendorConfigCopyWithImpl<$Res>
    implements _$FeaturedVendorConfigCopyWith<$Res> {
  __$FeaturedVendorConfigCopyWithImpl(this._self, this._then);

  final _FeaturedVendorConfig _self;
  final $Res Function(_FeaturedVendorConfig) _then;

/// Create a copy of FeaturedVendorConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? columnCount = null,Object? showRating = null,Object? enableAutoSliding = null,Object? durationAutoSliding = freezed,Object? enableBackground = null,Object? isSnapping = null,Object? limit = freezed,Object? imageBoxfit = null,Object? alignment = null,}) {
  return _then(_FeaturedVendorConfig(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,columnCount: null == columnCount ? _self.columnCount : columnCount // ignore: cast_nullable_to_non_nullable
as int,showRating: null == showRating ? _self.showRating : showRating // ignore: cast_nullable_to_non_nullable
as bool,enableAutoSliding: null == enableAutoSliding ? _self.enableAutoSliding : enableAutoSliding // ignore: cast_nullable_to_non_nullable
as bool,durationAutoSliding: freezed == durationAutoSliding ? _self.durationAutoSliding : durationAutoSliding // ignore: cast_nullable_to_non_nullable
as int?,enableBackground: null == enableBackground ? _self.enableBackground : enableBackground // ignore: cast_nullable_to_non_nullable
as bool,isSnapping: null == isSnapping ? _self.isSnapping : isSnapping // ignore: cast_nullable_to_non_nullable
as bool,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,imageBoxfit: null == imageBoxfit ? _self.imageBoxfit : imageBoxfit // ignore: cast_nullable_to_non_nullable
as String,alignment: null == alignment ? _self.alignment : alignment // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
