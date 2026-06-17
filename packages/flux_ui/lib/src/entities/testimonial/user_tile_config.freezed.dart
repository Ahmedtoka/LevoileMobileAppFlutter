// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_tile_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserTileConfig implements DiagnosticableTreeMixin {

/// The name.
 String get name;/// The name style configuration.
 FluxTextStyleConfig? get nameStyleConfig;/// The subtitle.
 String? get subtitle;/// The subtitle style configuration.
 FluxTextStyleConfig? get subtitleStyleConfig;/// The avatar image URL.
 String? get avatarUrl;/// The avatar image style configuration.
 FluxImageStyleConfig? get avatarStyleConfig;/// The rating value.
 double? get rating;/// The rating style configuration.
 FluxRatingStyleConfig? get ratingStyleConfig;/// The content padding.
@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? get contentPadding;
/// Create a copy of UserTileConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserTileConfigCopyWith<UserTileConfig> get copyWith => _$UserTileConfigCopyWithImpl<UserTileConfig>(this as UserTileConfig, _$identity);

  /// Serializes this UserTileConfig to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserTileConfig'))
    ..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('nameStyleConfig', nameStyleConfig))..add(DiagnosticsProperty('subtitle', subtitle))..add(DiagnosticsProperty('subtitleStyleConfig', subtitleStyleConfig))..add(DiagnosticsProperty('avatarUrl', avatarUrl))..add(DiagnosticsProperty('avatarStyleConfig', avatarStyleConfig))..add(DiagnosticsProperty('rating', rating))..add(DiagnosticsProperty('ratingStyleConfig', ratingStyleConfig))..add(DiagnosticsProperty('contentPadding', contentPadding));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserTileConfig&&(identical(other.name, name) || other.name == name)&&(identical(other.nameStyleConfig, nameStyleConfig) || other.nameStyleConfig == nameStyleConfig)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.subtitleStyleConfig, subtitleStyleConfig) || other.subtitleStyleConfig == subtitleStyleConfig)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.avatarStyleConfig, avatarStyleConfig) || other.avatarStyleConfig == avatarStyleConfig)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.ratingStyleConfig, ratingStyleConfig) || other.ratingStyleConfig == ratingStyleConfig)&&(identical(other.contentPadding, contentPadding) || other.contentPadding == contentPadding));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,nameStyleConfig,subtitle,subtitleStyleConfig,avatarUrl,avatarStyleConfig,rating,ratingStyleConfig,contentPadding);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserTileConfig(name: $name, nameStyleConfig: $nameStyleConfig, subtitle: $subtitle, subtitleStyleConfig: $subtitleStyleConfig, avatarUrl: $avatarUrl, avatarStyleConfig: $avatarStyleConfig, rating: $rating, ratingStyleConfig: $ratingStyleConfig, contentPadding: $contentPadding)';
}


}

/// @nodoc
abstract mixin class $UserTileConfigCopyWith<$Res>  {
  factory $UserTileConfigCopyWith(UserTileConfig value, $Res Function(UserTileConfig) _then) = _$UserTileConfigCopyWithImpl;
@useResult
$Res call({
 String name, FluxTextStyleConfig? nameStyleConfig, String? subtitle, FluxTextStyleConfig? subtitleStyleConfig, String? avatarUrl, FluxImageStyleConfig? avatarStyleConfig, double? rating, FluxRatingStyleConfig? ratingStyleConfig,@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? contentPadding
});


$FluxTextStyleConfigCopyWith<$Res>? get nameStyleConfig;$FluxTextStyleConfigCopyWith<$Res>? get subtitleStyleConfig;$FluxImageStyleConfigCopyWith<$Res>? get avatarStyleConfig;$FluxRatingStyleConfigCopyWith<$Res>? get ratingStyleConfig;

}
/// @nodoc
class _$UserTileConfigCopyWithImpl<$Res>
    implements $UserTileConfigCopyWith<$Res> {
  _$UserTileConfigCopyWithImpl(this._self, this._then);

  final UserTileConfig _self;
  final $Res Function(UserTileConfig) _then;

/// Create a copy of UserTileConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? nameStyleConfig = freezed,Object? subtitle = freezed,Object? subtitleStyleConfig = freezed,Object? avatarUrl = freezed,Object? avatarStyleConfig = freezed,Object? rating = freezed,Object? ratingStyleConfig = freezed,Object? contentPadding = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameStyleConfig: freezed == nameStyleConfig ? _self.nameStyleConfig : nameStyleConfig // ignore: cast_nullable_to_non_nullable
as FluxTextStyleConfig?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,subtitleStyleConfig: freezed == subtitleStyleConfig ? _self.subtitleStyleConfig : subtitleStyleConfig // ignore: cast_nullable_to_non_nullable
as FluxTextStyleConfig?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,avatarStyleConfig: freezed == avatarStyleConfig ? _self.avatarStyleConfig : avatarStyleConfig // ignore: cast_nullable_to_non_nullable
as FluxImageStyleConfig?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,ratingStyleConfig: freezed == ratingStyleConfig ? _self.ratingStyleConfig : ratingStyleConfig // ignore: cast_nullable_to_non_nullable
as FluxRatingStyleConfig?,contentPadding: freezed == contentPadding ? _self.contentPadding : contentPadding // ignore: cast_nullable_to_non_nullable
as EdgeInsetsDirectional?,
  ));
}
/// Create a copy of UserTileConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxTextStyleConfigCopyWith<$Res>? get nameStyleConfig {
    if (_self.nameStyleConfig == null) {
    return null;
  }

  return $FluxTextStyleConfigCopyWith<$Res>(_self.nameStyleConfig!, (value) {
    return _then(_self.copyWith(nameStyleConfig: value));
  });
}/// Create a copy of UserTileConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxTextStyleConfigCopyWith<$Res>? get subtitleStyleConfig {
    if (_self.subtitleStyleConfig == null) {
    return null;
  }

  return $FluxTextStyleConfigCopyWith<$Res>(_self.subtitleStyleConfig!, (value) {
    return _then(_self.copyWith(subtitleStyleConfig: value));
  });
}/// Create a copy of UserTileConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxImageStyleConfigCopyWith<$Res>? get avatarStyleConfig {
    if (_self.avatarStyleConfig == null) {
    return null;
  }

  return $FluxImageStyleConfigCopyWith<$Res>(_self.avatarStyleConfig!, (value) {
    return _then(_self.copyWith(avatarStyleConfig: value));
  });
}/// Create a copy of UserTileConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxRatingStyleConfigCopyWith<$Res>? get ratingStyleConfig {
    if (_self.ratingStyleConfig == null) {
    return null;
  }

  return $FluxRatingStyleConfigCopyWith<$Res>(_self.ratingStyleConfig!, (value) {
    return _then(_self.copyWith(ratingStyleConfig: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserTileConfig].
extension UserTileConfigPatterns on UserTileConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserTileConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserTileConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserTileConfig value)  $default,){
final _that = this;
switch (_that) {
case _UserTileConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserTileConfig value)?  $default,){
final _that = this;
switch (_that) {
case _UserTileConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  FluxTextStyleConfig? nameStyleConfig,  String? subtitle,  FluxTextStyleConfig? subtitleStyleConfig,  String? avatarUrl,  FluxImageStyleConfig? avatarStyleConfig,  double? rating,  FluxRatingStyleConfig? ratingStyleConfig, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? contentPadding)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserTileConfig() when $default != null:
return $default(_that.name,_that.nameStyleConfig,_that.subtitle,_that.subtitleStyleConfig,_that.avatarUrl,_that.avatarStyleConfig,_that.rating,_that.ratingStyleConfig,_that.contentPadding);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  FluxTextStyleConfig? nameStyleConfig,  String? subtitle,  FluxTextStyleConfig? subtitleStyleConfig,  String? avatarUrl,  FluxImageStyleConfig? avatarStyleConfig,  double? rating,  FluxRatingStyleConfig? ratingStyleConfig, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? contentPadding)  $default,) {final _that = this;
switch (_that) {
case _UserTileConfig():
return $default(_that.name,_that.nameStyleConfig,_that.subtitle,_that.subtitleStyleConfig,_that.avatarUrl,_that.avatarStyleConfig,_that.rating,_that.ratingStyleConfig,_that.contentPadding);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  FluxTextStyleConfig? nameStyleConfig,  String? subtitle,  FluxTextStyleConfig? subtitleStyleConfig,  String? avatarUrl,  FluxImageStyleConfig? avatarStyleConfig,  double? rating,  FluxRatingStyleConfig? ratingStyleConfig, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? contentPadding)?  $default,) {final _that = this;
switch (_that) {
case _UserTileConfig() when $default != null:
return $default(_that.name,_that.nameStyleConfig,_that.subtitle,_that.subtitleStyleConfig,_that.avatarUrl,_that.avatarStyleConfig,_that.rating,_that.ratingStyleConfig,_that.contentPadding);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserTileConfig extends UserTileConfig with DiagnosticableTreeMixin {
  const _UserTileConfig({this.name = '', this.nameStyleConfig, this.subtitle, this.subtitleStyleConfig, this.avatarUrl, this.avatarStyleConfig, this.rating, this.ratingStyleConfig, @EdgeInsetsDirectionalConverter() this.contentPadding}): super._();
  factory _UserTileConfig.fromJson(Map<String, dynamic> json) => _$UserTileConfigFromJson(json);

/// The name.
@override@JsonKey() final  String name;
/// The name style configuration.
@override final  FluxTextStyleConfig? nameStyleConfig;
/// The subtitle.
@override final  String? subtitle;
/// The subtitle style configuration.
@override final  FluxTextStyleConfig? subtitleStyleConfig;
/// The avatar image URL.
@override final  String? avatarUrl;
/// The avatar image style configuration.
@override final  FluxImageStyleConfig? avatarStyleConfig;
/// The rating value.
@override final  double? rating;
/// The rating style configuration.
@override final  FluxRatingStyleConfig? ratingStyleConfig;
/// The content padding.
@override@EdgeInsetsDirectionalConverter() final  EdgeInsetsDirectional? contentPadding;

/// Create a copy of UserTileConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserTileConfigCopyWith<_UserTileConfig> get copyWith => __$UserTileConfigCopyWithImpl<_UserTileConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserTileConfigToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserTileConfig'))
    ..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('nameStyleConfig', nameStyleConfig))..add(DiagnosticsProperty('subtitle', subtitle))..add(DiagnosticsProperty('subtitleStyleConfig', subtitleStyleConfig))..add(DiagnosticsProperty('avatarUrl', avatarUrl))..add(DiagnosticsProperty('avatarStyleConfig', avatarStyleConfig))..add(DiagnosticsProperty('rating', rating))..add(DiagnosticsProperty('ratingStyleConfig', ratingStyleConfig))..add(DiagnosticsProperty('contentPadding', contentPadding));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserTileConfig&&(identical(other.name, name) || other.name == name)&&(identical(other.nameStyleConfig, nameStyleConfig) || other.nameStyleConfig == nameStyleConfig)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.subtitleStyleConfig, subtitleStyleConfig) || other.subtitleStyleConfig == subtitleStyleConfig)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.avatarStyleConfig, avatarStyleConfig) || other.avatarStyleConfig == avatarStyleConfig)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.ratingStyleConfig, ratingStyleConfig) || other.ratingStyleConfig == ratingStyleConfig)&&(identical(other.contentPadding, contentPadding) || other.contentPadding == contentPadding));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,nameStyleConfig,subtitle,subtitleStyleConfig,avatarUrl,avatarStyleConfig,rating,ratingStyleConfig,contentPadding);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserTileConfig(name: $name, nameStyleConfig: $nameStyleConfig, subtitle: $subtitle, subtitleStyleConfig: $subtitleStyleConfig, avatarUrl: $avatarUrl, avatarStyleConfig: $avatarStyleConfig, rating: $rating, ratingStyleConfig: $ratingStyleConfig, contentPadding: $contentPadding)';
}


}

/// @nodoc
abstract mixin class _$UserTileConfigCopyWith<$Res> implements $UserTileConfigCopyWith<$Res> {
  factory _$UserTileConfigCopyWith(_UserTileConfig value, $Res Function(_UserTileConfig) _then) = __$UserTileConfigCopyWithImpl;
@override @useResult
$Res call({
 String name, FluxTextStyleConfig? nameStyleConfig, String? subtitle, FluxTextStyleConfig? subtitleStyleConfig, String? avatarUrl, FluxImageStyleConfig? avatarStyleConfig, double? rating, FluxRatingStyleConfig? ratingStyleConfig,@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? contentPadding
});


@override $FluxTextStyleConfigCopyWith<$Res>? get nameStyleConfig;@override $FluxTextStyleConfigCopyWith<$Res>? get subtitleStyleConfig;@override $FluxImageStyleConfigCopyWith<$Res>? get avatarStyleConfig;@override $FluxRatingStyleConfigCopyWith<$Res>? get ratingStyleConfig;

}
/// @nodoc
class __$UserTileConfigCopyWithImpl<$Res>
    implements _$UserTileConfigCopyWith<$Res> {
  __$UserTileConfigCopyWithImpl(this._self, this._then);

  final _UserTileConfig _self;
  final $Res Function(_UserTileConfig) _then;

/// Create a copy of UserTileConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? nameStyleConfig = freezed,Object? subtitle = freezed,Object? subtitleStyleConfig = freezed,Object? avatarUrl = freezed,Object? avatarStyleConfig = freezed,Object? rating = freezed,Object? ratingStyleConfig = freezed,Object? contentPadding = freezed,}) {
  return _then(_UserTileConfig(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameStyleConfig: freezed == nameStyleConfig ? _self.nameStyleConfig : nameStyleConfig // ignore: cast_nullable_to_non_nullable
as FluxTextStyleConfig?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,subtitleStyleConfig: freezed == subtitleStyleConfig ? _self.subtitleStyleConfig : subtitleStyleConfig // ignore: cast_nullable_to_non_nullable
as FluxTextStyleConfig?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,avatarStyleConfig: freezed == avatarStyleConfig ? _self.avatarStyleConfig : avatarStyleConfig // ignore: cast_nullable_to_non_nullable
as FluxImageStyleConfig?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,ratingStyleConfig: freezed == ratingStyleConfig ? _self.ratingStyleConfig : ratingStyleConfig // ignore: cast_nullable_to_non_nullable
as FluxRatingStyleConfig?,contentPadding: freezed == contentPadding ? _self.contentPadding : contentPadding // ignore: cast_nullable_to_non_nullable
as EdgeInsetsDirectional?,
  ));
}

/// Create a copy of UserTileConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxTextStyleConfigCopyWith<$Res>? get nameStyleConfig {
    if (_self.nameStyleConfig == null) {
    return null;
  }

  return $FluxTextStyleConfigCopyWith<$Res>(_self.nameStyleConfig!, (value) {
    return _then(_self.copyWith(nameStyleConfig: value));
  });
}/// Create a copy of UserTileConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxTextStyleConfigCopyWith<$Res>? get subtitleStyleConfig {
    if (_self.subtitleStyleConfig == null) {
    return null;
  }

  return $FluxTextStyleConfigCopyWith<$Res>(_self.subtitleStyleConfig!, (value) {
    return _then(_self.copyWith(subtitleStyleConfig: value));
  });
}/// Create a copy of UserTileConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxImageStyleConfigCopyWith<$Res>? get avatarStyleConfig {
    if (_self.avatarStyleConfig == null) {
    return null;
  }

  return $FluxImageStyleConfigCopyWith<$Res>(_self.avatarStyleConfig!, (value) {
    return _then(_self.copyWith(avatarStyleConfig: value));
  });
}/// Create a copy of UserTileConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxRatingStyleConfigCopyWith<$Res>? get ratingStyleConfig {
    if (_self.ratingStyleConfig == null) {
    return null;
  }

  return $FluxRatingStyleConfigCopyWith<$Res>(_self.ratingStyleConfig!, (value) {
    return _then(_self.copyWith(ratingStyleConfig: value));
  });
}
}

// dart format on
