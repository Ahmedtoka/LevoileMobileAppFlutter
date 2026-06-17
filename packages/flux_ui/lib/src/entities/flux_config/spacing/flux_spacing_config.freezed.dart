// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flux_spacing_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FluxSpacingConfig implements DiagnosticableTreeMixin {

@JsonKey(name: 'margin') FluxEdgeInsetsConfig? get marginConfig;@JsonKey(name: 'padding') FluxEdgeInsetsConfig? get paddingConfig;
/// Create a copy of FluxSpacingConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FluxSpacingConfigCopyWith<FluxSpacingConfig> get copyWith => _$FluxSpacingConfigCopyWithImpl<FluxSpacingConfig>(this as FluxSpacingConfig, _$identity);

  /// Serializes this FluxSpacingConfig to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FluxSpacingConfig'))
    ..add(DiagnosticsProperty('marginConfig', marginConfig))..add(DiagnosticsProperty('paddingConfig', paddingConfig));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FluxSpacingConfig&&(identical(other.marginConfig, marginConfig) || other.marginConfig == marginConfig)&&(identical(other.paddingConfig, paddingConfig) || other.paddingConfig == paddingConfig));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,marginConfig,paddingConfig);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FluxSpacingConfig(marginConfig: $marginConfig, paddingConfig: $paddingConfig)';
}


}

/// @nodoc
abstract mixin class $FluxSpacingConfigCopyWith<$Res>  {
  factory $FluxSpacingConfigCopyWith(FluxSpacingConfig value, $Res Function(FluxSpacingConfig) _then) = _$FluxSpacingConfigCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'margin') FluxEdgeInsetsConfig? marginConfig,@JsonKey(name: 'padding') FluxEdgeInsetsConfig? paddingConfig
});


$FluxEdgeInsetsConfigCopyWith<$Res>? get marginConfig;$FluxEdgeInsetsConfigCopyWith<$Res>? get paddingConfig;

}
/// @nodoc
class _$FluxSpacingConfigCopyWithImpl<$Res>
    implements $FluxSpacingConfigCopyWith<$Res> {
  _$FluxSpacingConfigCopyWithImpl(this._self, this._then);

  final FluxSpacingConfig _self;
  final $Res Function(FluxSpacingConfig) _then;

/// Create a copy of FluxSpacingConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? marginConfig = freezed,Object? paddingConfig = freezed,}) {
  return _then(_self.copyWith(
marginConfig: freezed == marginConfig ? _self.marginConfig : marginConfig // ignore: cast_nullable_to_non_nullable
as FluxEdgeInsetsConfig?,paddingConfig: freezed == paddingConfig ? _self.paddingConfig : paddingConfig // ignore: cast_nullable_to_non_nullable
as FluxEdgeInsetsConfig?,
  ));
}
/// Create a copy of FluxSpacingConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxEdgeInsetsConfigCopyWith<$Res>? get marginConfig {
    if (_self.marginConfig == null) {
    return null;
  }

  return $FluxEdgeInsetsConfigCopyWith<$Res>(_self.marginConfig!, (value) {
    return _then(_self.copyWith(marginConfig: value));
  });
}/// Create a copy of FluxSpacingConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxEdgeInsetsConfigCopyWith<$Res>? get paddingConfig {
    if (_self.paddingConfig == null) {
    return null;
  }

  return $FluxEdgeInsetsConfigCopyWith<$Res>(_self.paddingConfig!, (value) {
    return _then(_self.copyWith(paddingConfig: value));
  });
}
}


/// Adds pattern-matching-related methods to [FluxSpacingConfig].
extension FluxSpacingConfigPatterns on FluxSpacingConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FluxSpacingConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FluxSpacingConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FluxSpacingConfig value)  $default,){
final _that = this;
switch (_that) {
case _FluxSpacingConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FluxSpacingConfig value)?  $default,){
final _that = this;
switch (_that) {
case _FluxSpacingConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'margin')  FluxEdgeInsetsConfig? marginConfig, @JsonKey(name: 'padding')  FluxEdgeInsetsConfig? paddingConfig)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FluxSpacingConfig() when $default != null:
return $default(_that.marginConfig,_that.paddingConfig);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'margin')  FluxEdgeInsetsConfig? marginConfig, @JsonKey(name: 'padding')  FluxEdgeInsetsConfig? paddingConfig)  $default,) {final _that = this;
switch (_that) {
case _FluxSpacingConfig():
return $default(_that.marginConfig,_that.paddingConfig);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'margin')  FluxEdgeInsetsConfig? marginConfig, @JsonKey(name: 'padding')  FluxEdgeInsetsConfig? paddingConfig)?  $default,) {final _that = this;
switch (_that) {
case _FluxSpacingConfig() when $default != null:
return $default(_that.marginConfig,_that.paddingConfig);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FluxSpacingConfig with DiagnosticableTreeMixin implements FluxSpacingConfig {
  const _FluxSpacingConfig({@JsonKey(name: 'margin') this.marginConfig, @JsonKey(name: 'padding') this.paddingConfig});
  factory _FluxSpacingConfig.fromJson(Map<String, dynamic> json) => _$FluxSpacingConfigFromJson(json);

@override@JsonKey(name: 'margin') final  FluxEdgeInsetsConfig? marginConfig;
@override@JsonKey(name: 'padding') final  FluxEdgeInsetsConfig? paddingConfig;

/// Create a copy of FluxSpacingConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FluxSpacingConfigCopyWith<_FluxSpacingConfig> get copyWith => __$FluxSpacingConfigCopyWithImpl<_FluxSpacingConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FluxSpacingConfigToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FluxSpacingConfig'))
    ..add(DiagnosticsProperty('marginConfig', marginConfig))..add(DiagnosticsProperty('paddingConfig', paddingConfig));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FluxSpacingConfig&&(identical(other.marginConfig, marginConfig) || other.marginConfig == marginConfig)&&(identical(other.paddingConfig, paddingConfig) || other.paddingConfig == paddingConfig));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,marginConfig,paddingConfig);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FluxSpacingConfig(marginConfig: $marginConfig, paddingConfig: $paddingConfig)';
}


}

/// @nodoc
abstract mixin class _$FluxSpacingConfigCopyWith<$Res> implements $FluxSpacingConfigCopyWith<$Res> {
  factory _$FluxSpacingConfigCopyWith(_FluxSpacingConfig value, $Res Function(_FluxSpacingConfig) _then) = __$FluxSpacingConfigCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'margin') FluxEdgeInsetsConfig? marginConfig,@JsonKey(name: 'padding') FluxEdgeInsetsConfig? paddingConfig
});


@override $FluxEdgeInsetsConfigCopyWith<$Res>? get marginConfig;@override $FluxEdgeInsetsConfigCopyWith<$Res>? get paddingConfig;

}
/// @nodoc
class __$FluxSpacingConfigCopyWithImpl<$Res>
    implements _$FluxSpacingConfigCopyWith<$Res> {
  __$FluxSpacingConfigCopyWithImpl(this._self, this._then);

  final _FluxSpacingConfig _self;
  final $Res Function(_FluxSpacingConfig) _then;

/// Create a copy of FluxSpacingConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? marginConfig = freezed,Object? paddingConfig = freezed,}) {
  return _then(_FluxSpacingConfig(
marginConfig: freezed == marginConfig ? _self.marginConfig : marginConfig // ignore: cast_nullable_to_non_nullable
as FluxEdgeInsetsConfig?,paddingConfig: freezed == paddingConfig ? _self.paddingConfig : paddingConfig // ignore: cast_nullable_to_non_nullable
as FluxEdgeInsetsConfig?,
  ));
}

/// Create a copy of FluxSpacingConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxEdgeInsetsConfigCopyWith<$Res>? get marginConfig {
    if (_self.marginConfig == null) {
    return null;
  }

  return $FluxEdgeInsetsConfigCopyWith<$Res>(_self.marginConfig!, (value) {
    return _then(_self.copyWith(marginConfig: value));
  });
}/// Create a copy of FluxSpacingConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxEdgeInsetsConfigCopyWith<$Res>? get paddingConfig {
    if (_self.paddingConfig == null) {
    return null;
  }

  return $FluxEdgeInsetsConfigCopyWith<$Res>(_self.paddingConfig!, (value) {
    return _then(_self.copyWith(paddingConfig: value));
  });
}
}

// dart format on
