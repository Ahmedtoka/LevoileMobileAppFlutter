// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flux_text_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FluxTextConfig implements DiagnosticableTreeMixin {

 String get text; FluxTextStyleConfig? get styleConfig;
/// Create a copy of FluxTextConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FluxTextConfigCopyWith<FluxTextConfig> get copyWith => _$FluxTextConfigCopyWithImpl<FluxTextConfig>(this as FluxTextConfig, _$identity);

  /// Serializes this FluxTextConfig to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FluxTextConfig'))
    ..add(DiagnosticsProperty('text', text))..add(DiagnosticsProperty('styleConfig', styleConfig));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FluxTextConfig&&(identical(other.text, text) || other.text == text)&&(identical(other.styleConfig, styleConfig) || other.styleConfig == styleConfig));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,styleConfig);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FluxTextConfig(text: $text, styleConfig: $styleConfig)';
}


}

/// @nodoc
abstract mixin class $FluxTextConfigCopyWith<$Res>  {
  factory $FluxTextConfigCopyWith(FluxTextConfig value, $Res Function(FluxTextConfig) _then) = _$FluxTextConfigCopyWithImpl;
@useResult
$Res call({
 String text, FluxTextStyleConfig? styleConfig
});


$FluxTextStyleConfigCopyWith<$Res>? get styleConfig;

}
/// @nodoc
class _$FluxTextConfigCopyWithImpl<$Res>
    implements $FluxTextConfigCopyWith<$Res> {
  _$FluxTextConfigCopyWithImpl(this._self, this._then);

  final FluxTextConfig _self;
  final $Res Function(FluxTextConfig) _then;

/// Create a copy of FluxTextConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? styleConfig = freezed,}) {
  return _then(_self.copyWith(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,styleConfig: freezed == styleConfig ? _self.styleConfig : styleConfig // ignore: cast_nullable_to_non_nullable
as FluxTextStyleConfig?,
  ));
}
/// Create a copy of FluxTextConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxTextStyleConfigCopyWith<$Res>? get styleConfig {
    if (_self.styleConfig == null) {
    return null;
  }

  return $FluxTextStyleConfigCopyWith<$Res>(_self.styleConfig!, (value) {
    return _then(_self.copyWith(styleConfig: value));
  });
}
}


/// Adds pattern-matching-related methods to [FluxTextConfig].
extension FluxTextConfigPatterns on FluxTextConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FluxTextConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FluxTextConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FluxTextConfig value)  $default,){
final _that = this;
switch (_that) {
case _FluxTextConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FluxTextConfig value)?  $default,){
final _that = this;
switch (_that) {
case _FluxTextConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  FluxTextStyleConfig? styleConfig)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FluxTextConfig() when $default != null:
return $default(_that.text,_that.styleConfig);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  FluxTextStyleConfig? styleConfig)  $default,) {final _that = this;
switch (_that) {
case _FluxTextConfig():
return $default(_that.text,_that.styleConfig);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  FluxTextStyleConfig? styleConfig)?  $default,) {final _that = this;
switch (_that) {
case _FluxTextConfig() when $default != null:
return $default(_that.text,_that.styleConfig);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FluxTextConfig with DiagnosticableTreeMixin implements FluxTextConfig {
  const _FluxTextConfig({this.text = '', this.styleConfig});
  factory _FluxTextConfig.fromJson(Map<String, dynamic> json) => _$FluxTextConfigFromJson(json);

@override@JsonKey() final  String text;
@override final  FluxTextStyleConfig? styleConfig;

/// Create a copy of FluxTextConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FluxTextConfigCopyWith<_FluxTextConfig> get copyWith => __$FluxTextConfigCopyWithImpl<_FluxTextConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FluxTextConfigToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FluxTextConfig'))
    ..add(DiagnosticsProperty('text', text))..add(DiagnosticsProperty('styleConfig', styleConfig));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FluxTextConfig&&(identical(other.text, text) || other.text == text)&&(identical(other.styleConfig, styleConfig) || other.styleConfig == styleConfig));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,styleConfig);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FluxTextConfig(text: $text, styleConfig: $styleConfig)';
}


}

/// @nodoc
abstract mixin class _$FluxTextConfigCopyWith<$Res> implements $FluxTextConfigCopyWith<$Res> {
  factory _$FluxTextConfigCopyWith(_FluxTextConfig value, $Res Function(_FluxTextConfig) _then) = __$FluxTextConfigCopyWithImpl;
@override @useResult
$Res call({
 String text, FluxTextStyleConfig? styleConfig
});


@override $FluxTextStyleConfigCopyWith<$Res>? get styleConfig;

}
/// @nodoc
class __$FluxTextConfigCopyWithImpl<$Res>
    implements _$FluxTextConfigCopyWith<$Res> {
  __$FluxTextConfigCopyWithImpl(this._self, this._then);

  final _FluxTextConfig _self;
  final $Res Function(_FluxTextConfig) _then;

/// Create a copy of FluxTextConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? styleConfig = freezed,}) {
  return _then(_FluxTextConfig(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,styleConfig: freezed == styleConfig ? _self.styleConfig : styleConfig // ignore: cast_nullable_to_non_nullable
as FluxTextStyleConfig?,
  ));
}

/// Create a copy of FluxTextConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxTextStyleConfigCopyWith<$Res>? get styleConfig {
    if (_self.styleConfig == null) {
    return null;
  }

  return $FluxTextStyleConfigCopyWith<$Res>(_self.styleConfig!, (value) {
    return _then(_self.copyWith(styleConfig: value));
  });
}
}


/// @nodoc
mixin _$FluxTextStyleConfig implements DiagnosticableTreeMixin {

 TextStyleSource? get styleSource; AppTextStyle? get customStyle; TextOverflow? get textOverflow; int? get maxLines; int? get minLines; TextAlign? get textAlign; FluxContainerConfig? get containerConfig;
/// Create a copy of FluxTextStyleConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FluxTextStyleConfigCopyWith<FluxTextStyleConfig> get copyWith => _$FluxTextStyleConfigCopyWithImpl<FluxTextStyleConfig>(this as FluxTextStyleConfig, _$identity);

  /// Serializes this FluxTextStyleConfig to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FluxTextStyleConfig'))
    ..add(DiagnosticsProperty('styleSource', styleSource))..add(DiagnosticsProperty('customStyle', customStyle))..add(DiagnosticsProperty('textOverflow', textOverflow))..add(DiagnosticsProperty('maxLines', maxLines))..add(DiagnosticsProperty('minLines', minLines))..add(DiagnosticsProperty('textAlign', textAlign))..add(DiagnosticsProperty('containerConfig', containerConfig));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FluxTextStyleConfig&&(identical(other.styleSource, styleSource) || other.styleSource == styleSource)&&(identical(other.customStyle, customStyle) || other.customStyle == customStyle)&&(identical(other.textOverflow, textOverflow) || other.textOverflow == textOverflow)&&(identical(other.maxLines, maxLines) || other.maxLines == maxLines)&&(identical(other.minLines, minLines) || other.minLines == minLines)&&(identical(other.textAlign, textAlign) || other.textAlign == textAlign)&&(identical(other.containerConfig, containerConfig) || other.containerConfig == containerConfig));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,styleSource,customStyle,textOverflow,maxLines,minLines,textAlign,containerConfig);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FluxTextStyleConfig(styleSource: $styleSource, customStyle: $customStyle, textOverflow: $textOverflow, maxLines: $maxLines, minLines: $minLines, textAlign: $textAlign, containerConfig: $containerConfig)';
}


}

/// @nodoc
abstract mixin class $FluxTextStyleConfigCopyWith<$Res>  {
  factory $FluxTextStyleConfigCopyWith(FluxTextStyleConfig value, $Res Function(FluxTextStyleConfig) _then) = _$FluxTextStyleConfigCopyWithImpl;
@useResult
$Res call({
 TextStyleSource? styleSource, AppTextStyle? customStyle, TextOverflow? textOverflow, int? maxLines, int? minLines, TextAlign? textAlign, FluxContainerConfig? containerConfig
});


$AppTextStyleCopyWith<$Res>? get customStyle;$FluxContainerConfigCopyWith<$Res>? get containerConfig;

}
/// @nodoc
class _$FluxTextStyleConfigCopyWithImpl<$Res>
    implements $FluxTextStyleConfigCopyWith<$Res> {
  _$FluxTextStyleConfigCopyWithImpl(this._self, this._then);

  final FluxTextStyleConfig _self;
  final $Res Function(FluxTextStyleConfig) _then;

/// Create a copy of FluxTextStyleConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? styleSource = freezed,Object? customStyle = freezed,Object? textOverflow = freezed,Object? maxLines = freezed,Object? minLines = freezed,Object? textAlign = freezed,Object? containerConfig = freezed,}) {
  return _then(_self.copyWith(
styleSource: freezed == styleSource ? _self.styleSource : styleSource // ignore: cast_nullable_to_non_nullable
as TextStyleSource?,customStyle: freezed == customStyle ? _self.customStyle : customStyle // ignore: cast_nullable_to_non_nullable
as AppTextStyle?,textOverflow: freezed == textOverflow ? _self.textOverflow : textOverflow // ignore: cast_nullable_to_non_nullable
as TextOverflow?,maxLines: freezed == maxLines ? _self.maxLines : maxLines // ignore: cast_nullable_to_non_nullable
as int?,minLines: freezed == minLines ? _self.minLines : minLines // ignore: cast_nullable_to_non_nullable
as int?,textAlign: freezed == textAlign ? _self.textAlign : textAlign // ignore: cast_nullable_to_non_nullable
as TextAlign?,containerConfig: freezed == containerConfig ? _self.containerConfig : containerConfig // ignore: cast_nullable_to_non_nullable
as FluxContainerConfig?,
  ));
}
/// Create a copy of FluxTextStyleConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppTextStyleCopyWith<$Res>? get customStyle {
    if (_self.customStyle == null) {
    return null;
  }

  return $AppTextStyleCopyWith<$Res>(_self.customStyle!, (value) {
    return _then(_self.copyWith(customStyle: value));
  });
}/// Create a copy of FluxTextStyleConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxContainerConfigCopyWith<$Res>? get containerConfig {
    if (_self.containerConfig == null) {
    return null;
  }

  return $FluxContainerConfigCopyWith<$Res>(_self.containerConfig!, (value) {
    return _then(_self.copyWith(containerConfig: value));
  });
}
}


/// Adds pattern-matching-related methods to [FluxTextStyleConfig].
extension FluxTextStyleConfigPatterns on FluxTextStyleConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FluxTextStyleConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FluxTextStyleConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FluxTextStyleConfig value)  $default,){
final _that = this;
switch (_that) {
case _FluxTextStyleConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FluxTextStyleConfig value)?  $default,){
final _that = this;
switch (_that) {
case _FluxTextStyleConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TextStyleSource? styleSource,  AppTextStyle? customStyle,  TextOverflow? textOverflow,  int? maxLines,  int? minLines,  TextAlign? textAlign,  FluxContainerConfig? containerConfig)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FluxTextStyleConfig() when $default != null:
return $default(_that.styleSource,_that.customStyle,_that.textOverflow,_that.maxLines,_that.minLines,_that.textAlign,_that.containerConfig);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TextStyleSource? styleSource,  AppTextStyle? customStyle,  TextOverflow? textOverflow,  int? maxLines,  int? minLines,  TextAlign? textAlign,  FluxContainerConfig? containerConfig)  $default,) {final _that = this;
switch (_that) {
case _FluxTextStyleConfig():
return $default(_that.styleSource,_that.customStyle,_that.textOverflow,_that.maxLines,_that.minLines,_that.textAlign,_that.containerConfig);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TextStyleSource? styleSource,  AppTextStyle? customStyle,  TextOverflow? textOverflow,  int? maxLines,  int? minLines,  TextAlign? textAlign,  FluxContainerConfig? containerConfig)?  $default,) {final _that = this;
switch (_that) {
case _FluxTextStyleConfig() when $default != null:
return $default(_that.styleSource,_that.customStyle,_that.textOverflow,_that.maxLines,_that.minLines,_that.textAlign,_that.containerConfig);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FluxTextStyleConfig with DiagnosticableTreeMixin implements FluxTextStyleConfig {
  const _FluxTextStyleConfig({this.styleSource, this.customStyle, this.textOverflow, this.maxLines, this.minLines, this.textAlign, this.containerConfig});
  factory _FluxTextStyleConfig.fromJson(Map<String, dynamic> json) => _$FluxTextStyleConfigFromJson(json);

@override final  TextStyleSource? styleSource;
@override final  AppTextStyle? customStyle;
@override final  TextOverflow? textOverflow;
@override final  int? maxLines;
@override final  int? minLines;
@override final  TextAlign? textAlign;
@override final  FluxContainerConfig? containerConfig;

/// Create a copy of FluxTextStyleConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FluxTextStyleConfigCopyWith<_FluxTextStyleConfig> get copyWith => __$FluxTextStyleConfigCopyWithImpl<_FluxTextStyleConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FluxTextStyleConfigToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FluxTextStyleConfig'))
    ..add(DiagnosticsProperty('styleSource', styleSource))..add(DiagnosticsProperty('customStyle', customStyle))..add(DiagnosticsProperty('textOverflow', textOverflow))..add(DiagnosticsProperty('maxLines', maxLines))..add(DiagnosticsProperty('minLines', minLines))..add(DiagnosticsProperty('textAlign', textAlign))..add(DiagnosticsProperty('containerConfig', containerConfig));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FluxTextStyleConfig&&(identical(other.styleSource, styleSource) || other.styleSource == styleSource)&&(identical(other.customStyle, customStyle) || other.customStyle == customStyle)&&(identical(other.textOverflow, textOverflow) || other.textOverflow == textOverflow)&&(identical(other.maxLines, maxLines) || other.maxLines == maxLines)&&(identical(other.minLines, minLines) || other.minLines == minLines)&&(identical(other.textAlign, textAlign) || other.textAlign == textAlign)&&(identical(other.containerConfig, containerConfig) || other.containerConfig == containerConfig));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,styleSource,customStyle,textOverflow,maxLines,minLines,textAlign,containerConfig);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FluxTextStyleConfig(styleSource: $styleSource, customStyle: $customStyle, textOverflow: $textOverflow, maxLines: $maxLines, minLines: $minLines, textAlign: $textAlign, containerConfig: $containerConfig)';
}


}

/// @nodoc
abstract mixin class _$FluxTextStyleConfigCopyWith<$Res> implements $FluxTextStyleConfigCopyWith<$Res> {
  factory _$FluxTextStyleConfigCopyWith(_FluxTextStyleConfig value, $Res Function(_FluxTextStyleConfig) _then) = __$FluxTextStyleConfigCopyWithImpl;
@override @useResult
$Res call({
 TextStyleSource? styleSource, AppTextStyle? customStyle, TextOverflow? textOverflow, int? maxLines, int? minLines, TextAlign? textAlign, FluxContainerConfig? containerConfig
});


@override $AppTextStyleCopyWith<$Res>? get customStyle;@override $FluxContainerConfigCopyWith<$Res>? get containerConfig;

}
/// @nodoc
class __$FluxTextStyleConfigCopyWithImpl<$Res>
    implements _$FluxTextStyleConfigCopyWith<$Res> {
  __$FluxTextStyleConfigCopyWithImpl(this._self, this._then);

  final _FluxTextStyleConfig _self;
  final $Res Function(_FluxTextStyleConfig) _then;

/// Create a copy of FluxTextStyleConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? styleSource = freezed,Object? customStyle = freezed,Object? textOverflow = freezed,Object? maxLines = freezed,Object? minLines = freezed,Object? textAlign = freezed,Object? containerConfig = freezed,}) {
  return _then(_FluxTextStyleConfig(
styleSource: freezed == styleSource ? _self.styleSource : styleSource // ignore: cast_nullable_to_non_nullable
as TextStyleSource?,customStyle: freezed == customStyle ? _self.customStyle : customStyle // ignore: cast_nullable_to_non_nullable
as AppTextStyle?,textOverflow: freezed == textOverflow ? _self.textOverflow : textOverflow // ignore: cast_nullable_to_non_nullable
as TextOverflow?,maxLines: freezed == maxLines ? _self.maxLines : maxLines // ignore: cast_nullable_to_non_nullable
as int?,minLines: freezed == minLines ? _self.minLines : minLines // ignore: cast_nullable_to_non_nullable
as int?,textAlign: freezed == textAlign ? _self.textAlign : textAlign // ignore: cast_nullable_to_non_nullable
as TextAlign?,containerConfig: freezed == containerConfig ? _self.containerConfig : containerConfig // ignore: cast_nullable_to_non_nullable
as FluxContainerConfig?,
  ));
}

/// Create a copy of FluxTextStyleConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppTextStyleCopyWith<$Res>? get customStyle {
    if (_self.customStyle == null) {
    return null;
  }

  return $AppTextStyleCopyWith<$Res>(_self.customStyle!, (value) {
    return _then(_self.copyWith(customStyle: value));
  });
}/// Create a copy of FluxTextStyleConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxContainerConfigCopyWith<$Res>? get containerConfig {
    if (_self.containerConfig == null) {
    return null;
  }

  return $FluxContainerConfigCopyWith<$Res>(_self.containerConfig!, (value) {
    return _then(_self.copyWith(containerConfig: value));
  });
}
}

// dart format on
