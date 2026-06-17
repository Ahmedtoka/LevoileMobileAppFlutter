// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spacing_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SpacingConfig implements DiagnosticableTreeMixin {

@JsonKey(name: 'margin') EdgeConfig? get marginConfig;@JsonKey(name: 'padding') EdgeConfig? get paddingConfig;
/// Create a copy of SpacingConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpacingConfigCopyWith<SpacingConfig> get copyWith => _$SpacingConfigCopyWithImpl<SpacingConfig>(this as SpacingConfig, _$identity);

  /// Serializes this SpacingConfig to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SpacingConfig'))
    ..add(DiagnosticsProperty('marginConfig', marginConfig))..add(DiagnosticsProperty('paddingConfig', paddingConfig));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpacingConfig&&(identical(other.marginConfig, marginConfig) || other.marginConfig == marginConfig)&&(identical(other.paddingConfig, paddingConfig) || other.paddingConfig == paddingConfig));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,marginConfig,paddingConfig);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SpacingConfig(marginConfig: $marginConfig, paddingConfig: $paddingConfig)';
}


}

/// @nodoc
abstract mixin class $SpacingConfigCopyWith<$Res>  {
  factory $SpacingConfigCopyWith(SpacingConfig value, $Res Function(SpacingConfig) _then) = _$SpacingConfigCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'margin') EdgeConfig? marginConfig,@JsonKey(name: 'padding') EdgeConfig? paddingConfig
});


$EdgeConfigCopyWith<$Res>? get marginConfig;$EdgeConfigCopyWith<$Res>? get paddingConfig;

}
/// @nodoc
class _$SpacingConfigCopyWithImpl<$Res>
    implements $SpacingConfigCopyWith<$Res> {
  _$SpacingConfigCopyWithImpl(this._self, this._then);

  final SpacingConfig _self;
  final $Res Function(SpacingConfig) _then;

/// Create a copy of SpacingConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? marginConfig = freezed,Object? paddingConfig = freezed,}) {
  return _then(_self.copyWith(
marginConfig: freezed == marginConfig ? _self.marginConfig : marginConfig // ignore: cast_nullable_to_non_nullable
as EdgeConfig?,paddingConfig: freezed == paddingConfig ? _self.paddingConfig : paddingConfig // ignore: cast_nullable_to_non_nullable
as EdgeConfig?,
  ));
}
/// Create a copy of SpacingConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EdgeConfigCopyWith<$Res>? get marginConfig {
    if (_self.marginConfig == null) {
    return null;
  }

  return $EdgeConfigCopyWith<$Res>(_self.marginConfig!, (value) {
    return _then(_self.copyWith(marginConfig: value));
  });
}/// Create a copy of SpacingConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EdgeConfigCopyWith<$Res>? get paddingConfig {
    if (_self.paddingConfig == null) {
    return null;
  }

  return $EdgeConfigCopyWith<$Res>(_self.paddingConfig!, (value) {
    return _then(_self.copyWith(paddingConfig: value));
  });
}
}


/// Adds pattern-matching-related methods to [SpacingConfig].
extension SpacingConfigPatterns on SpacingConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpacingConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpacingConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpacingConfig value)  $default,){
final _that = this;
switch (_that) {
case _SpacingConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpacingConfig value)?  $default,){
final _that = this;
switch (_that) {
case _SpacingConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'margin')  EdgeConfig? marginConfig, @JsonKey(name: 'padding')  EdgeConfig? paddingConfig)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpacingConfig() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'margin')  EdgeConfig? marginConfig, @JsonKey(name: 'padding')  EdgeConfig? paddingConfig)  $default,) {final _that = this;
switch (_that) {
case _SpacingConfig():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'margin')  EdgeConfig? marginConfig, @JsonKey(name: 'padding')  EdgeConfig? paddingConfig)?  $default,) {final _that = this;
switch (_that) {
case _SpacingConfig() when $default != null:
return $default(_that.marginConfig,_that.paddingConfig);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpacingConfig with DiagnosticableTreeMixin implements SpacingConfig {
  const _SpacingConfig({@JsonKey(name: 'margin') this.marginConfig, @JsonKey(name: 'padding') this.paddingConfig});
  factory _SpacingConfig.fromJson(Map<String, dynamic> json) => _$SpacingConfigFromJson(json);

@override@JsonKey(name: 'margin') final  EdgeConfig? marginConfig;
@override@JsonKey(name: 'padding') final  EdgeConfig? paddingConfig;

/// Create a copy of SpacingConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpacingConfigCopyWith<_SpacingConfig> get copyWith => __$SpacingConfigCopyWithImpl<_SpacingConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpacingConfigToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SpacingConfig'))
    ..add(DiagnosticsProperty('marginConfig', marginConfig))..add(DiagnosticsProperty('paddingConfig', paddingConfig));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpacingConfig&&(identical(other.marginConfig, marginConfig) || other.marginConfig == marginConfig)&&(identical(other.paddingConfig, paddingConfig) || other.paddingConfig == paddingConfig));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,marginConfig,paddingConfig);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SpacingConfig(marginConfig: $marginConfig, paddingConfig: $paddingConfig)';
}


}

/// @nodoc
abstract mixin class _$SpacingConfigCopyWith<$Res> implements $SpacingConfigCopyWith<$Res> {
  factory _$SpacingConfigCopyWith(_SpacingConfig value, $Res Function(_SpacingConfig) _then) = __$SpacingConfigCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'margin') EdgeConfig? marginConfig,@JsonKey(name: 'padding') EdgeConfig? paddingConfig
});


@override $EdgeConfigCopyWith<$Res>? get marginConfig;@override $EdgeConfigCopyWith<$Res>? get paddingConfig;

}
/// @nodoc
class __$SpacingConfigCopyWithImpl<$Res>
    implements _$SpacingConfigCopyWith<$Res> {
  __$SpacingConfigCopyWithImpl(this._self, this._then);

  final _SpacingConfig _self;
  final $Res Function(_SpacingConfig) _then;

/// Create a copy of SpacingConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? marginConfig = freezed,Object? paddingConfig = freezed,}) {
  return _then(_SpacingConfig(
marginConfig: freezed == marginConfig ? _self.marginConfig : marginConfig // ignore: cast_nullable_to_non_nullable
as EdgeConfig?,paddingConfig: freezed == paddingConfig ? _self.paddingConfig : paddingConfig // ignore: cast_nullable_to_non_nullable
as EdgeConfig?,
  ));
}

/// Create a copy of SpacingConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EdgeConfigCopyWith<$Res>? get marginConfig {
    if (_self.marginConfig == null) {
    return null;
  }

  return $EdgeConfigCopyWith<$Res>(_self.marginConfig!, (value) {
    return _then(_self.copyWith(marginConfig: value));
  });
}/// Create a copy of SpacingConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EdgeConfigCopyWith<$Res>? get paddingConfig {
    if (_self.paddingConfig == null) {
    return null;
  }

  return $EdgeConfigCopyWith<$Res>(_self.paddingConfig!, (value) {
    return _then(_self.copyWith(paddingConfig: value));
  });
}
}

// dart format on
