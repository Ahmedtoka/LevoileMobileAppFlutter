// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_list_item_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MenuListItemStyle {

 FluxCardConfig get cardConfig; FluxImageStyleConfig? get imageStyleConfig; FluxTextStyleConfig? get titleStyleConfig;
/// Create a copy of MenuListItemStyle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuListItemStyleCopyWith<MenuListItemStyle> get copyWith => _$MenuListItemStyleCopyWithImpl<MenuListItemStyle>(this as MenuListItemStyle, _$identity);

  /// Serializes this MenuListItemStyle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuListItemStyle&&(identical(other.cardConfig, cardConfig) || other.cardConfig == cardConfig)&&(identical(other.imageStyleConfig, imageStyleConfig) || other.imageStyleConfig == imageStyleConfig)&&(identical(other.titleStyleConfig, titleStyleConfig) || other.titleStyleConfig == titleStyleConfig));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cardConfig,imageStyleConfig,titleStyleConfig);

@override
String toString() {
  return 'MenuListItemStyle(cardConfig: $cardConfig, imageStyleConfig: $imageStyleConfig, titleStyleConfig: $titleStyleConfig)';
}


}

/// @nodoc
abstract mixin class $MenuListItemStyleCopyWith<$Res>  {
  factory $MenuListItemStyleCopyWith(MenuListItemStyle value, $Res Function(MenuListItemStyle) _then) = _$MenuListItemStyleCopyWithImpl;
@useResult
$Res call({
 FluxCardConfig cardConfig, FluxImageStyleConfig? imageStyleConfig, FluxTextStyleConfig? titleStyleConfig
});


$FluxCardConfigCopyWith<$Res> get cardConfig;$FluxImageStyleConfigCopyWith<$Res>? get imageStyleConfig;$FluxTextStyleConfigCopyWith<$Res>? get titleStyleConfig;

}
/// @nodoc
class _$MenuListItemStyleCopyWithImpl<$Res>
    implements $MenuListItemStyleCopyWith<$Res> {
  _$MenuListItemStyleCopyWithImpl(this._self, this._then);

  final MenuListItemStyle _self;
  final $Res Function(MenuListItemStyle) _then;

/// Create a copy of MenuListItemStyle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cardConfig = null,Object? imageStyleConfig = freezed,Object? titleStyleConfig = freezed,}) {
  return _then(_self.copyWith(
cardConfig: null == cardConfig ? _self.cardConfig : cardConfig // ignore: cast_nullable_to_non_nullable
as FluxCardConfig,imageStyleConfig: freezed == imageStyleConfig ? _self.imageStyleConfig : imageStyleConfig // ignore: cast_nullable_to_non_nullable
as FluxImageStyleConfig?,titleStyleConfig: freezed == titleStyleConfig ? _self.titleStyleConfig : titleStyleConfig // ignore: cast_nullable_to_non_nullable
as FluxTextStyleConfig?,
  ));
}
/// Create a copy of MenuListItemStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxCardConfigCopyWith<$Res> get cardConfig {
  
  return $FluxCardConfigCopyWith<$Res>(_self.cardConfig, (value) {
    return _then(_self.copyWith(cardConfig: value));
  });
}/// Create a copy of MenuListItemStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxImageStyleConfigCopyWith<$Res>? get imageStyleConfig {
    if (_self.imageStyleConfig == null) {
    return null;
  }

  return $FluxImageStyleConfigCopyWith<$Res>(_self.imageStyleConfig!, (value) {
    return _then(_self.copyWith(imageStyleConfig: value));
  });
}/// Create a copy of MenuListItemStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxTextStyleConfigCopyWith<$Res>? get titleStyleConfig {
    if (_self.titleStyleConfig == null) {
    return null;
  }

  return $FluxTextStyleConfigCopyWith<$Res>(_self.titleStyleConfig!, (value) {
    return _then(_self.copyWith(titleStyleConfig: value));
  });
}
}


/// Adds pattern-matching-related methods to [MenuListItemStyle].
extension MenuListItemStylePatterns on MenuListItemStyle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuListItemStyle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuListItemStyle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuListItemStyle value)  $default,){
final _that = this;
switch (_that) {
case _MenuListItemStyle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuListItemStyle value)?  $default,){
final _that = this;
switch (_that) {
case _MenuListItemStyle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FluxCardConfig cardConfig,  FluxImageStyleConfig? imageStyleConfig,  FluxTextStyleConfig? titleStyleConfig)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuListItemStyle() when $default != null:
return $default(_that.cardConfig,_that.imageStyleConfig,_that.titleStyleConfig);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FluxCardConfig cardConfig,  FluxImageStyleConfig? imageStyleConfig,  FluxTextStyleConfig? titleStyleConfig)  $default,) {final _that = this;
switch (_that) {
case _MenuListItemStyle():
return $default(_that.cardConfig,_that.imageStyleConfig,_that.titleStyleConfig);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FluxCardConfig cardConfig,  FluxImageStyleConfig? imageStyleConfig,  FluxTextStyleConfig? titleStyleConfig)?  $default,) {final _that = this;
switch (_that) {
case _MenuListItemStyle() when $default != null:
return $default(_that.cardConfig,_that.imageStyleConfig,_that.titleStyleConfig);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuListItemStyle implements MenuListItemStyle {
  const _MenuListItemStyle({this.cardConfig = const FluxCardConfig(), this.imageStyleConfig, this.titleStyleConfig});
  factory _MenuListItemStyle.fromJson(Map<String, dynamic> json) => _$MenuListItemStyleFromJson(json);

@override@JsonKey() final  FluxCardConfig cardConfig;
@override final  FluxImageStyleConfig? imageStyleConfig;
@override final  FluxTextStyleConfig? titleStyleConfig;

/// Create a copy of MenuListItemStyle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuListItemStyleCopyWith<_MenuListItemStyle> get copyWith => __$MenuListItemStyleCopyWithImpl<_MenuListItemStyle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuListItemStyleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuListItemStyle&&(identical(other.cardConfig, cardConfig) || other.cardConfig == cardConfig)&&(identical(other.imageStyleConfig, imageStyleConfig) || other.imageStyleConfig == imageStyleConfig)&&(identical(other.titleStyleConfig, titleStyleConfig) || other.titleStyleConfig == titleStyleConfig));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cardConfig,imageStyleConfig,titleStyleConfig);

@override
String toString() {
  return 'MenuListItemStyle(cardConfig: $cardConfig, imageStyleConfig: $imageStyleConfig, titleStyleConfig: $titleStyleConfig)';
}


}

/// @nodoc
abstract mixin class _$MenuListItemStyleCopyWith<$Res> implements $MenuListItemStyleCopyWith<$Res> {
  factory _$MenuListItemStyleCopyWith(_MenuListItemStyle value, $Res Function(_MenuListItemStyle) _then) = __$MenuListItemStyleCopyWithImpl;
@override @useResult
$Res call({
 FluxCardConfig cardConfig, FluxImageStyleConfig? imageStyleConfig, FluxTextStyleConfig? titleStyleConfig
});


@override $FluxCardConfigCopyWith<$Res> get cardConfig;@override $FluxImageStyleConfigCopyWith<$Res>? get imageStyleConfig;@override $FluxTextStyleConfigCopyWith<$Res>? get titleStyleConfig;

}
/// @nodoc
class __$MenuListItemStyleCopyWithImpl<$Res>
    implements _$MenuListItemStyleCopyWith<$Res> {
  __$MenuListItemStyleCopyWithImpl(this._self, this._then);

  final _MenuListItemStyle _self;
  final $Res Function(_MenuListItemStyle) _then;

/// Create a copy of MenuListItemStyle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cardConfig = null,Object? imageStyleConfig = freezed,Object? titleStyleConfig = freezed,}) {
  return _then(_MenuListItemStyle(
cardConfig: null == cardConfig ? _self.cardConfig : cardConfig // ignore: cast_nullable_to_non_nullable
as FluxCardConfig,imageStyleConfig: freezed == imageStyleConfig ? _self.imageStyleConfig : imageStyleConfig // ignore: cast_nullable_to_non_nullable
as FluxImageStyleConfig?,titleStyleConfig: freezed == titleStyleConfig ? _self.titleStyleConfig : titleStyleConfig // ignore: cast_nullable_to_non_nullable
as FluxTextStyleConfig?,
  ));
}

/// Create a copy of MenuListItemStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxCardConfigCopyWith<$Res> get cardConfig {
  
  return $FluxCardConfigCopyWith<$Res>(_self.cardConfig, (value) {
    return _then(_self.copyWith(cardConfig: value));
  });
}/// Create a copy of MenuListItemStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxImageStyleConfigCopyWith<$Res>? get imageStyleConfig {
    if (_self.imageStyleConfig == null) {
    return null;
  }

  return $FluxImageStyleConfigCopyWith<$Res>(_self.imageStyleConfig!, (value) {
    return _then(_self.copyWith(imageStyleConfig: value));
  });
}/// Create a copy of MenuListItemStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxTextStyleConfigCopyWith<$Res>? get titleStyleConfig {
    if (_self.titleStyleConfig == null) {
    return null;
  }

  return $FluxTextStyleConfigCopyWith<$Res>(_self.titleStyleConfig!, (value) {
    return _then(_self.copyWith(titleStyleConfig: value));
  });
}
}


/// @nodoc
mixin _$MenuListItemConfig {

 String get title; String? get imageUrl; MenuListItemStyle? get style; Map<String, dynamic>? get action;
/// Create a copy of MenuListItemConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuListItemConfigCopyWith<MenuListItemConfig> get copyWith => _$MenuListItemConfigCopyWithImpl<MenuListItemConfig>(this as MenuListItemConfig, _$identity);

  /// Serializes this MenuListItemConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuListItemConfig&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.style, style) || other.style == style)&&const DeepCollectionEquality().equals(other.action, action));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,imageUrl,style,const DeepCollectionEquality().hash(action));

@override
String toString() {
  return 'MenuListItemConfig(title: $title, imageUrl: $imageUrl, style: $style, action: $action)';
}


}

/// @nodoc
abstract mixin class $MenuListItemConfigCopyWith<$Res>  {
  factory $MenuListItemConfigCopyWith(MenuListItemConfig value, $Res Function(MenuListItemConfig) _then) = _$MenuListItemConfigCopyWithImpl;
@useResult
$Res call({
 String title, String? imageUrl, MenuListItemStyle? style, Map<String, dynamic>? action
});


$MenuListItemStyleCopyWith<$Res>? get style;

}
/// @nodoc
class _$MenuListItemConfigCopyWithImpl<$Res>
    implements $MenuListItemConfigCopyWith<$Res> {
  _$MenuListItemConfigCopyWithImpl(this._self, this._then);

  final MenuListItemConfig _self;
  final $Res Function(MenuListItemConfig) _then;

/// Create a copy of MenuListItemConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? imageUrl = freezed,Object? style = freezed,Object? action = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as MenuListItemStyle?,action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}
/// Create a copy of MenuListItemConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MenuListItemStyleCopyWith<$Res>? get style {
    if (_self.style == null) {
    return null;
  }

  return $MenuListItemStyleCopyWith<$Res>(_self.style!, (value) {
    return _then(_self.copyWith(style: value));
  });
}
}


/// Adds pattern-matching-related methods to [MenuListItemConfig].
extension MenuListItemConfigPatterns on MenuListItemConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuListItemConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuListItemConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuListItemConfig value)  $default,){
final _that = this;
switch (_that) {
case _MenuListItemConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuListItemConfig value)?  $default,){
final _that = this;
switch (_that) {
case _MenuListItemConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String? imageUrl,  MenuListItemStyle? style,  Map<String, dynamic>? action)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuListItemConfig() when $default != null:
return $default(_that.title,_that.imageUrl,_that.style,_that.action);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String? imageUrl,  MenuListItemStyle? style,  Map<String, dynamic>? action)  $default,) {final _that = this;
switch (_that) {
case _MenuListItemConfig():
return $default(_that.title,_that.imageUrl,_that.style,_that.action);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String? imageUrl,  MenuListItemStyle? style,  Map<String, dynamic>? action)?  $default,) {final _that = this;
switch (_that) {
case _MenuListItemConfig() when $default != null:
return $default(_that.title,_that.imageUrl,_that.style,_that.action);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuListItemConfig extends MenuListItemConfig {
  const _MenuListItemConfig({this.title = '', this.imageUrl, this.style, final  Map<String, dynamic>? action}): _action = action,super._();
  factory _MenuListItemConfig.fromJson(Map<String, dynamic> json) => _$MenuListItemConfigFromJson(json);

@override@JsonKey() final  String title;
@override final  String? imageUrl;
@override final  MenuListItemStyle? style;
 final  Map<String, dynamic>? _action;
@override Map<String, dynamic>? get action {
  final value = _action;
  if (value == null) return null;
  if (_action is EqualUnmodifiableMapView) return _action;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of MenuListItemConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuListItemConfigCopyWith<_MenuListItemConfig> get copyWith => __$MenuListItemConfigCopyWithImpl<_MenuListItemConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuListItemConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuListItemConfig&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.style, style) || other.style == style)&&const DeepCollectionEquality().equals(other._action, _action));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,imageUrl,style,const DeepCollectionEquality().hash(_action));

@override
String toString() {
  return 'MenuListItemConfig(title: $title, imageUrl: $imageUrl, style: $style, action: $action)';
}


}

/// @nodoc
abstract mixin class _$MenuListItemConfigCopyWith<$Res> implements $MenuListItemConfigCopyWith<$Res> {
  factory _$MenuListItemConfigCopyWith(_MenuListItemConfig value, $Res Function(_MenuListItemConfig) _then) = __$MenuListItemConfigCopyWithImpl;
@override @useResult
$Res call({
 String title, String? imageUrl, MenuListItemStyle? style, Map<String, dynamic>? action
});


@override $MenuListItemStyleCopyWith<$Res>? get style;

}
/// @nodoc
class __$MenuListItemConfigCopyWithImpl<$Res>
    implements _$MenuListItemConfigCopyWith<$Res> {
  __$MenuListItemConfigCopyWithImpl(this._self, this._then);

  final _MenuListItemConfig _self;
  final $Res Function(_MenuListItemConfig) _then;

/// Create a copy of MenuListItemConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? imageUrl = freezed,Object? style = freezed,Object? action = freezed,}) {
  return _then(_MenuListItemConfig(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as MenuListItemStyle?,action: freezed == action ? _self._action : action // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

/// Create a copy of MenuListItemConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MenuListItemStyleCopyWith<$Res>? get style {
    if (_self.style == null) {
    return null;
  }

  return $MenuListItemStyleCopyWith<$Res>(_self.style!, (value) {
    return _then(_self.copyWith(style: value));
  });
}
}

// dart format on
