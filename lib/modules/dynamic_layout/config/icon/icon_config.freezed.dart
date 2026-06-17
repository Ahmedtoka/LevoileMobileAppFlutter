// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'icon_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IconConfig implements DiagnosticableTreeMixin {

 String get icon; String get fontFamily;@JsonKey(name: 'color') String? get colorString; double? get size;
/// Create a copy of IconConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IconConfigCopyWith<IconConfig> get copyWith => _$IconConfigCopyWithImpl<IconConfig>(this as IconConfig, _$identity);

  /// Serializes this IconConfig to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'IconConfig'))
    ..add(DiagnosticsProperty('icon', icon))..add(DiagnosticsProperty('fontFamily', fontFamily))..add(DiagnosticsProperty('colorString', colorString))..add(DiagnosticsProperty('size', size));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IconConfig&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&(identical(other.colorString, colorString) || other.colorString == colorString)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,icon,fontFamily,colorString,size);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'IconConfig(icon: $icon, fontFamily: $fontFamily, colorString: $colorString, size: $size)';
}


}

/// @nodoc
abstract mixin class $IconConfigCopyWith<$Res>  {
  factory $IconConfigCopyWith(IconConfig value, $Res Function(IconConfig) _then) = _$IconConfigCopyWithImpl;
@useResult
$Res call({
 String icon, String fontFamily,@JsonKey(name: 'color') String? colorString, double? size
});




}
/// @nodoc
class _$IconConfigCopyWithImpl<$Res>
    implements $IconConfigCopyWith<$Res> {
  _$IconConfigCopyWithImpl(this._self, this._then);

  final IconConfig _self;
  final $Res Function(IconConfig) _then;

/// Create a copy of IconConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? icon = null,Object? fontFamily = null,Object? colorString = freezed,Object? size = freezed,}) {
  return _then(_self.copyWith(
icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,fontFamily: null == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String,colorString: freezed == colorString ? _self.colorString : colorString // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [IconConfig].
extension IconConfigPatterns on IconConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IconConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IconConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IconConfig value)  $default,){
final _that = this;
switch (_that) {
case _IconConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IconConfig value)?  $default,){
final _that = this;
switch (_that) {
case _IconConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String icon,  String fontFamily, @JsonKey(name: 'color')  String? colorString,  double? size)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IconConfig() when $default != null:
return $default(_that.icon,_that.fontFamily,_that.colorString,_that.size);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String icon,  String fontFamily, @JsonKey(name: 'color')  String? colorString,  double? size)  $default,) {final _that = this;
switch (_that) {
case _IconConfig():
return $default(_that.icon,_that.fontFamily,_that.colorString,_that.size);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String icon,  String fontFamily, @JsonKey(name: 'color')  String? colorString,  double? size)?  $default,) {final _that = this;
switch (_that) {
case _IconConfig() when $default != null:
return $default(_that.icon,_that.fontFamily,_that.colorString,_that.size);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IconConfig extends IconConfig with DiagnosticableTreeMixin {
  const _IconConfig({required this.icon, required this.fontFamily, @JsonKey(name: 'color') this.colorString, this.size}): super._();
  factory _IconConfig.fromJson(Map<String, dynamic> json) => _$IconConfigFromJson(json);

@override final  String icon;
@override final  String fontFamily;
@override@JsonKey(name: 'color') final  String? colorString;
@override final  double? size;

/// Create a copy of IconConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IconConfigCopyWith<_IconConfig> get copyWith => __$IconConfigCopyWithImpl<_IconConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IconConfigToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'IconConfig'))
    ..add(DiagnosticsProperty('icon', icon))..add(DiagnosticsProperty('fontFamily', fontFamily))..add(DiagnosticsProperty('colorString', colorString))..add(DiagnosticsProperty('size', size));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IconConfig&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&(identical(other.colorString, colorString) || other.colorString == colorString)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,icon,fontFamily,colorString,size);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'IconConfig(icon: $icon, fontFamily: $fontFamily, colorString: $colorString, size: $size)';
}


}

/// @nodoc
abstract mixin class _$IconConfigCopyWith<$Res> implements $IconConfigCopyWith<$Res> {
  factory _$IconConfigCopyWith(_IconConfig value, $Res Function(_IconConfig) _then) = __$IconConfigCopyWithImpl;
@override @useResult
$Res call({
 String icon, String fontFamily,@JsonKey(name: 'color') String? colorString, double? size
});




}
/// @nodoc
class __$IconConfigCopyWithImpl<$Res>
    implements _$IconConfigCopyWith<$Res> {
  __$IconConfigCopyWithImpl(this._self, this._then);

  final _IconConfig _self;
  final $Res Function(_IconConfig) _then;

/// Create a copy of IconConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? icon = null,Object? fontFamily = null,Object? colorString = freezed,Object? size = freezed,}) {
  return _then(_IconConfig(
icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,fontFamily: null == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String,colorString: freezed == colorString ? _self.colorString : colorString // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
