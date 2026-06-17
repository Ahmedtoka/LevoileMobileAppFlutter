// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'web_embed_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WebEmbedConfig implements DiagnosticableTreeMixin {

/// Url or iFrame or HTML code
 WebEmbedType get type;/// Data to load in the webview
 String get data;/// If the height value is less than 1, it will be automatically calculated
/// according to the formula [height]*[MediaQuery.sizeOf(context).height],
/// which is a percentage * the height of the screen. Otherwise, it will be
/// set to a fixed height.
 double get height;/// Only padding, margin is supported in this layout
 SpacingConfig get spacing;/// If does not set, it can use the default script
/// [kAdvanceConfig.webViewScript] from [advanceConfig] in env.dart file instead
 String? get script;/// Navigate options
 Map<String, dynamic>? get navigator;
/// Create a copy of WebEmbedConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WebEmbedConfigCopyWith<WebEmbedConfig> get copyWith => _$WebEmbedConfigCopyWithImpl<WebEmbedConfig>(this as WebEmbedConfig, _$identity);

  /// Serializes this WebEmbedConfig to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebEmbedConfig'))
    ..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('data', data))..add(DiagnosticsProperty('height', height))..add(DiagnosticsProperty('spacing', spacing))..add(DiagnosticsProperty('script', script))..add(DiagnosticsProperty('navigator', navigator));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WebEmbedConfig&&(identical(other.type, type) || other.type == type)&&(identical(other.data, data) || other.data == data)&&(identical(other.height, height) || other.height == height)&&(identical(other.spacing, spacing) || other.spacing == spacing)&&(identical(other.script, script) || other.script == script)&&const DeepCollectionEquality().equals(other.navigator, navigator));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,data,height,spacing,script,const DeepCollectionEquality().hash(navigator));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebEmbedConfig(type: $type, data: $data, height: $height, spacing: $spacing, script: $script, navigator: $navigator)';
}


}

/// @nodoc
abstract mixin class $WebEmbedConfigCopyWith<$Res>  {
  factory $WebEmbedConfigCopyWith(WebEmbedConfig value, $Res Function(WebEmbedConfig) _then) = _$WebEmbedConfigCopyWithImpl;
@useResult
$Res call({
 WebEmbedType type, String data, double height, SpacingConfig spacing, String? script, Map<String, dynamic>? navigator
});


$SpacingConfigCopyWith<$Res> get spacing;

}
/// @nodoc
class _$WebEmbedConfigCopyWithImpl<$Res>
    implements $WebEmbedConfigCopyWith<$Res> {
  _$WebEmbedConfigCopyWithImpl(this._self, this._then);

  final WebEmbedConfig _self;
  final $Res Function(WebEmbedConfig) _then;

/// Create a copy of WebEmbedConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? data = null,Object? height = null,Object? spacing = null,Object? script = freezed,Object? navigator = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as WebEmbedType,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as String,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,spacing: null == spacing ? _self.spacing : spacing // ignore: cast_nullable_to_non_nullable
as SpacingConfig,script: freezed == script ? _self.script : script // ignore: cast_nullable_to_non_nullable
as String?,navigator: freezed == navigator ? _self.navigator : navigator // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}
/// Create a copy of WebEmbedConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpacingConfigCopyWith<$Res> get spacing {
  
  return $SpacingConfigCopyWith<$Res>(_self.spacing, (value) {
    return _then(_self.copyWith(spacing: value));
  });
}
}


/// Adds pattern-matching-related methods to [WebEmbedConfig].
extension WebEmbedConfigPatterns on WebEmbedConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WebEmbedConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WebEmbedConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WebEmbedConfig value)  $default,){
final _that = this;
switch (_that) {
case _WebEmbedConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WebEmbedConfig value)?  $default,){
final _that = this;
switch (_that) {
case _WebEmbedConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WebEmbedType type,  String data,  double height,  SpacingConfig spacing,  String? script,  Map<String, dynamic>? navigator)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WebEmbedConfig() when $default != null:
return $default(_that.type,_that.data,_that.height,_that.spacing,_that.script,_that.navigator);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WebEmbedType type,  String data,  double height,  SpacingConfig spacing,  String? script,  Map<String, dynamic>? navigator)  $default,) {final _that = this;
switch (_that) {
case _WebEmbedConfig():
return $default(_that.type,_that.data,_that.height,_that.spacing,_that.script,_that.navigator);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WebEmbedType type,  String data,  double height,  SpacingConfig spacing,  String? script,  Map<String, dynamic>? navigator)?  $default,) {final _that = this;
switch (_that) {
case _WebEmbedConfig() when $default != null:
return $default(_that.type,_that.data,_that.height,_that.spacing,_that.script,_that.navigator);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WebEmbedConfig with DiagnosticableTreeMixin implements WebEmbedConfig {
  const _WebEmbedConfig({this.type = WebEmbedType.url, this.data = '', this.height = _defaultHeight, this.spacing = const SpacingConfig(), this.script, final  Map<String, dynamic>? navigator}): assert(height > 0),_navigator = navigator;
  factory _WebEmbedConfig.fromJson(Map<String, dynamic> json) => _$WebEmbedConfigFromJson(json);

/// Url or iFrame or HTML code
@override@JsonKey() final  WebEmbedType type;
/// Data to load in the webview
@override@JsonKey() final  String data;
/// If the height value is less than 1, it will be automatically calculated
/// according to the formula [height]*[MediaQuery.sizeOf(context).height],
/// which is a percentage * the height of the screen. Otherwise, it will be
/// set to a fixed height.
@override@JsonKey() final  double height;
/// Only padding, margin is supported in this layout
@override@JsonKey() final  SpacingConfig spacing;
/// If does not set, it can use the default script
/// [kAdvanceConfig.webViewScript] from [advanceConfig] in env.dart file instead
@override final  String? script;
/// Navigate options
 final  Map<String, dynamic>? _navigator;
/// Navigate options
@override Map<String, dynamic>? get navigator {
  final value = _navigator;
  if (value == null) return null;
  if (_navigator is EqualUnmodifiableMapView) return _navigator;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of WebEmbedConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WebEmbedConfigCopyWith<_WebEmbedConfig> get copyWith => __$WebEmbedConfigCopyWithImpl<_WebEmbedConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WebEmbedConfigToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebEmbedConfig'))
    ..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('data', data))..add(DiagnosticsProperty('height', height))..add(DiagnosticsProperty('spacing', spacing))..add(DiagnosticsProperty('script', script))..add(DiagnosticsProperty('navigator', navigator));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WebEmbedConfig&&(identical(other.type, type) || other.type == type)&&(identical(other.data, data) || other.data == data)&&(identical(other.height, height) || other.height == height)&&(identical(other.spacing, spacing) || other.spacing == spacing)&&(identical(other.script, script) || other.script == script)&&const DeepCollectionEquality().equals(other._navigator, _navigator));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,data,height,spacing,script,const DeepCollectionEquality().hash(_navigator));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebEmbedConfig(type: $type, data: $data, height: $height, spacing: $spacing, script: $script, navigator: $navigator)';
}


}

/// @nodoc
abstract mixin class _$WebEmbedConfigCopyWith<$Res> implements $WebEmbedConfigCopyWith<$Res> {
  factory _$WebEmbedConfigCopyWith(_WebEmbedConfig value, $Res Function(_WebEmbedConfig) _then) = __$WebEmbedConfigCopyWithImpl;
@override @useResult
$Res call({
 WebEmbedType type, String data, double height, SpacingConfig spacing, String? script, Map<String, dynamic>? navigator
});


@override $SpacingConfigCopyWith<$Res> get spacing;

}
/// @nodoc
class __$WebEmbedConfigCopyWithImpl<$Res>
    implements _$WebEmbedConfigCopyWith<$Res> {
  __$WebEmbedConfigCopyWithImpl(this._self, this._then);

  final _WebEmbedConfig _self;
  final $Res Function(_WebEmbedConfig) _then;

/// Create a copy of WebEmbedConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? data = null,Object? height = null,Object? spacing = null,Object? script = freezed,Object? navigator = freezed,}) {
  return _then(_WebEmbedConfig(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as WebEmbedType,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as String,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,spacing: null == spacing ? _self.spacing : spacing // ignore: cast_nullable_to_non_nullable
as SpacingConfig,script: freezed == script ? _self.script : script // ignore: cast_nullable_to_non_nullable
as String?,navigator: freezed == navigator ? _self._navigator : navigator // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

/// Create a copy of WebEmbedConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpacingConfigCopyWith<$Res> get spacing {
  
  return $SpacingConfigCopyWith<$Res>(_self.spacing, (value) {
    return _then(_self.copyWith(spacing: value));
  });
}
}

// dart format on
