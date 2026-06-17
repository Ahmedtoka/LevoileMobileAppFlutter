// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_list_card_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ItemListCardConfig {

@StringConverter() String get title; String? get subtitle;@StringConverter() String get imageUrl; ActionItemCardConfig? get action; List<String>? get tags;
/// Create a copy of ItemListCardConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemListCardConfigCopyWith<ItemListCardConfig> get copyWith => _$ItemListCardConfigCopyWithImpl<ItemListCardConfig>(this as ItemListCardConfig, _$identity);

  /// Serializes this ItemListCardConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemListCardConfig&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.action, action) || other.action == action)&&const DeepCollectionEquality().equals(other.tags, tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,subtitle,imageUrl,action,const DeepCollectionEquality().hash(tags));

@override
String toString() {
  return 'ItemListCardConfig(title: $title, subtitle: $subtitle, imageUrl: $imageUrl, action: $action, tags: $tags)';
}


}

/// @nodoc
abstract mixin class $ItemListCardConfigCopyWith<$Res>  {
  factory $ItemListCardConfigCopyWith(ItemListCardConfig value, $Res Function(ItemListCardConfig) _then) = _$ItemListCardConfigCopyWithImpl;
@useResult
$Res call({
@StringConverter() String title, String? subtitle,@StringConverter() String imageUrl, ActionItemCardConfig? action, List<String>? tags
});


$ActionItemCardConfigCopyWith<$Res>? get action;

}
/// @nodoc
class _$ItemListCardConfigCopyWithImpl<$Res>
    implements $ItemListCardConfigCopyWith<$Res> {
  _$ItemListCardConfigCopyWithImpl(this._self, this._then);

  final ItemListCardConfig _self;
  final $Res Function(ItemListCardConfig) _then;

/// Create a copy of ItemListCardConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? subtitle = freezed,Object? imageUrl = null,Object? action = freezed,Object? tags = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as ActionItemCardConfig?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}
/// Create a copy of ItemListCardConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActionItemCardConfigCopyWith<$Res>? get action {
    if (_self.action == null) {
    return null;
  }

  return $ActionItemCardConfigCopyWith<$Res>(_self.action!, (value) {
    return _then(_self.copyWith(action: value));
  });
}
}


/// Adds pattern-matching-related methods to [ItemListCardConfig].
extension ItemListCardConfigPatterns on ItemListCardConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ItemListCardConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ItemListCardConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ItemListCardConfig value)  $default,){
final _that = this;
switch (_that) {
case _ItemListCardConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ItemListCardConfig value)?  $default,){
final _that = this;
switch (_that) {
case _ItemListCardConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@StringConverter()  String title,  String? subtitle, @StringConverter()  String imageUrl,  ActionItemCardConfig? action,  List<String>? tags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ItemListCardConfig() when $default != null:
return $default(_that.title,_that.subtitle,_that.imageUrl,_that.action,_that.tags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@StringConverter()  String title,  String? subtitle, @StringConverter()  String imageUrl,  ActionItemCardConfig? action,  List<String>? tags)  $default,) {final _that = this;
switch (_that) {
case _ItemListCardConfig():
return $default(_that.title,_that.subtitle,_that.imageUrl,_that.action,_that.tags);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@StringConverter()  String title,  String? subtitle, @StringConverter()  String imageUrl,  ActionItemCardConfig? action,  List<String>? tags)?  $default,) {final _that = this;
switch (_that) {
case _ItemListCardConfig() when $default != null:
return $default(_that.title,_that.subtitle,_that.imageUrl,_that.action,_that.tags);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ItemListCardConfig implements ItemListCardConfig {
  const _ItemListCardConfig({@StringConverter() required this.title, required this.subtitle, @StringConverter() required this.imageUrl, this.action, final  List<String>? tags}): _tags = tags;
  factory _ItemListCardConfig.fromJson(Map<String, dynamic> json) => _$ItemListCardConfigFromJson(json);

@override@StringConverter() final  String title;
@override final  String? subtitle;
@override@StringConverter() final  String imageUrl;
@override final  ActionItemCardConfig? action;
 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ItemListCardConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemListCardConfigCopyWith<_ItemListCardConfig> get copyWith => __$ItemListCardConfigCopyWithImpl<_ItemListCardConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ItemListCardConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItemListCardConfig&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.action, action) || other.action == action)&&const DeepCollectionEquality().equals(other._tags, _tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,subtitle,imageUrl,action,const DeepCollectionEquality().hash(_tags));

@override
String toString() {
  return 'ItemListCardConfig(title: $title, subtitle: $subtitle, imageUrl: $imageUrl, action: $action, tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$ItemListCardConfigCopyWith<$Res> implements $ItemListCardConfigCopyWith<$Res> {
  factory _$ItemListCardConfigCopyWith(_ItemListCardConfig value, $Res Function(_ItemListCardConfig) _then) = __$ItemListCardConfigCopyWithImpl;
@override @useResult
$Res call({
@StringConverter() String title, String? subtitle,@StringConverter() String imageUrl, ActionItemCardConfig? action, List<String>? tags
});


@override $ActionItemCardConfigCopyWith<$Res>? get action;

}
/// @nodoc
class __$ItemListCardConfigCopyWithImpl<$Res>
    implements _$ItemListCardConfigCopyWith<$Res> {
  __$ItemListCardConfigCopyWithImpl(this._self, this._then);

  final _ItemListCardConfig _self;
  final $Res Function(_ItemListCardConfig) _then;

/// Create a copy of ItemListCardConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? subtitle = freezed,Object? imageUrl = null,Object? action = freezed,Object? tags = freezed,}) {
  return _then(_ItemListCardConfig(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as ActionItemCardConfig?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

/// Create a copy of ItemListCardConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActionItemCardConfigCopyWith<$Res>? get action {
    if (_self.action == null) {
    return null;
  }

  return $ActionItemCardConfigCopyWith<$Res>(_self.action!, (value) {
    return _then(_self.copyWith(action: value));
  });
}
}


/// @nodoc
mixin _$ActionItemCardConfig {

 String? get title; Map<String, dynamic> get action;@AlignmentDirectionalConverter() AlignmentDirectional? get alignment;
/// Create a copy of ActionItemCardConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActionItemCardConfigCopyWith<ActionItemCardConfig> get copyWith => _$ActionItemCardConfigCopyWithImpl<ActionItemCardConfig>(this as ActionItemCardConfig, _$identity);

  /// Serializes this ActionItemCardConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActionItemCardConfig&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.action, action)&&(identical(other.alignment, alignment) || other.alignment == alignment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(action),alignment);

@override
String toString() {
  return 'ActionItemCardConfig(title: $title, action: $action, alignment: $alignment)';
}


}

/// @nodoc
abstract mixin class $ActionItemCardConfigCopyWith<$Res>  {
  factory $ActionItemCardConfigCopyWith(ActionItemCardConfig value, $Res Function(ActionItemCardConfig) _then) = _$ActionItemCardConfigCopyWithImpl;
@useResult
$Res call({
 String? title, Map<String, dynamic> action,@AlignmentDirectionalConverter() AlignmentDirectional? alignment
});




}
/// @nodoc
class _$ActionItemCardConfigCopyWithImpl<$Res>
    implements $ActionItemCardConfigCopyWith<$Res> {
  _$ActionItemCardConfigCopyWithImpl(this._self, this._then);

  final ActionItemCardConfig _self;
  final $Res Function(ActionItemCardConfig) _then;

/// Create a copy of ActionItemCardConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? action = null,Object? alignment = freezed,}) {
  return _then(_self.copyWith(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,alignment: freezed == alignment ? _self.alignment : alignment // ignore: cast_nullable_to_non_nullable
as AlignmentDirectional?,
  ));
}

}


/// Adds pattern-matching-related methods to [ActionItemCardConfig].
extension ActionItemCardConfigPatterns on ActionItemCardConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActionItemCardConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActionItemCardConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActionItemCardConfig value)  $default,){
final _that = this;
switch (_that) {
case _ActionItemCardConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActionItemCardConfig value)?  $default,){
final _that = this;
switch (_that) {
case _ActionItemCardConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? title,  Map<String, dynamic> action, @AlignmentDirectionalConverter()  AlignmentDirectional? alignment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActionItemCardConfig() when $default != null:
return $default(_that.title,_that.action,_that.alignment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? title,  Map<String, dynamic> action, @AlignmentDirectionalConverter()  AlignmentDirectional? alignment)  $default,) {final _that = this;
switch (_that) {
case _ActionItemCardConfig():
return $default(_that.title,_that.action,_that.alignment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? title,  Map<String, dynamic> action, @AlignmentDirectionalConverter()  AlignmentDirectional? alignment)?  $default,) {final _that = this;
switch (_that) {
case _ActionItemCardConfig() when $default != null:
return $default(_that.title,_that.action,_that.alignment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ActionItemCardConfig implements ActionItemCardConfig {
  const _ActionItemCardConfig({this.title, required final  Map<String, dynamic> action, @AlignmentDirectionalConverter() this.alignment}): _action = action;
  factory _ActionItemCardConfig.fromJson(Map<String, dynamic> json) => _$ActionItemCardConfigFromJson(json);

@override final  String? title;
 final  Map<String, dynamic> _action;
@override Map<String, dynamic> get action {
  if (_action is EqualUnmodifiableMapView) return _action;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_action);
}

@override@AlignmentDirectionalConverter() final  AlignmentDirectional? alignment;

/// Create a copy of ActionItemCardConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActionItemCardConfigCopyWith<_ActionItemCardConfig> get copyWith => __$ActionItemCardConfigCopyWithImpl<_ActionItemCardConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActionItemCardConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActionItemCardConfig&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._action, _action)&&(identical(other.alignment, alignment) || other.alignment == alignment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(_action),alignment);

@override
String toString() {
  return 'ActionItemCardConfig(title: $title, action: $action, alignment: $alignment)';
}


}

/// @nodoc
abstract mixin class _$ActionItemCardConfigCopyWith<$Res> implements $ActionItemCardConfigCopyWith<$Res> {
  factory _$ActionItemCardConfigCopyWith(_ActionItemCardConfig value, $Res Function(_ActionItemCardConfig) _then) = __$ActionItemCardConfigCopyWithImpl;
@override @useResult
$Res call({
 String? title, Map<String, dynamic> action,@AlignmentDirectionalConverter() AlignmentDirectional? alignment
});




}
/// @nodoc
class __$ActionItemCardConfigCopyWithImpl<$Res>
    implements _$ActionItemCardConfigCopyWith<$Res> {
  __$ActionItemCardConfigCopyWithImpl(this._self, this._then);

  final _ActionItemCardConfig _self;
  final $Res Function(_ActionItemCardConfig) _then;

/// Create a copy of ActionItemCardConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? action = null,Object? alignment = freezed,}) {
  return _then(_ActionItemCardConfig(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,action: null == action ? _self._action : action // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,alignment: freezed == alignment ? _self.alignment : alignment // ignore: cast_nullable_to_non_nullable
as AlignmentDirectional?,
  ));
}


}


/// @nodoc
mixin _$StyleItemCardConfig {

@DecorationConverter() BoxDecoration? get decoration;@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? get padding;@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? get margin;
/// Create a copy of StyleItemCardConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StyleItemCardConfigCopyWith<StyleItemCardConfig> get copyWith => _$StyleItemCardConfigCopyWithImpl<StyleItemCardConfig>(this as StyleItemCardConfig, _$identity);

  /// Serializes this StyleItemCardConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StyleItemCardConfig&&(identical(other.decoration, decoration) || other.decoration == decoration)&&(identical(other.padding, padding) || other.padding == padding)&&(identical(other.margin, margin) || other.margin == margin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,decoration,padding,margin);

@override
String toString() {
  return 'StyleItemCardConfig(decoration: $decoration, padding: $padding, margin: $margin)';
}


}

/// @nodoc
abstract mixin class $StyleItemCardConfigCopyWith<$Res>  {
  factory $StyleItemCardConfigCopyWith(StyleItemCardConfig value, $Res Function(StyleItemCardConfig) _then) = _$StyleItemCardConfigCopyWithImpl;
@useResult
$Res call({
@DecorationConverter() BoxDecoration? decoration,@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? padding,@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? margin
});




}
/// @nodoc
class _$StyleItemCardConfigCopyWithImpl<$Res>
    implements $StyleItemCardConfigCopyWith<$Res> {
  _$StyleItemCardConfigCopyWithImpl(this._self, this._then);

  final StyleItemCardConfig _self;
  final $Res Function(StyleItemCardConfig) _then;

/// Create a copy of StyleItemCardConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? decoration = freezed,Object? padding = freezed,Object? margin = freezed,}) {
  return _then(_self.copyWith(
decoration: freezed == decoration ? _self.decoration : decoration // ignore: cast_nullable_to_non_nullable
as BoxDecoration?,padding: freezed == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as EdgeInsetsDirectional?,margin: freezed == margin ? _self.margin : margin // ignore: cast_nullable_to_non_nullable
as EdgeInsetsDirectional?,
  ));
}

}


/// Adds pattern-matching-related methods to [StyleItemCardConfig].
extension StyleItemCardConfigPatterns on StyleItemCardConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StyleItemCardConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StyleItemCardConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StyleItemCardConfig value)  $default,){
final _that = this;
switch (_that) {
case _StyleItemCardConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StyleItemCardConfig value)?  $default,){
final _that = this;
switch (_that) {
case _StyleItemCardConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@DecorationConverter()  BoxDecoration? decoration, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? padding, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? margin)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StyleItemCardConfig() when $default != null:
return $default(_that.decoration,_that.padding,_that.margin);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@DecorationConverter()  BoxDecoration? decoration, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? padding, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? margin)  $default,) {final _that = this;
switch (_that) {
case _StyleItemCardConfig():
return $default(_that.decoration,_that.padding,_that.margin);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@DecorationConverter()  BoxDecoration? decoration, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? padding, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? margin)?  $default,) {final _that = this;
switch (_that) {
case _StyleItemCardConfig() when $default != null:
return $default(_that.decoration,_that.padding,_that.margin);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StyleItemCardConfig implements StyleItemCardConfig {
  const _StyleItemCardConfig({@DecorationConverter() this.decoration, @EdgeInsetsDirectionalConverter() this.padding, @EdgeInsetsDirectionalConverter() this.margin});
  factory _StyleItemCardConfig.fromJson(Map<String, dynamic> json) => _$StyleItemCardConfigFromJson(json);

@override@DecorationConverter() final  BoxDecoration? decoration;
@override@EdgeInsetsDirectionalConverter() final  EdgeInsetsDirectional? padding;
@override@EdgeInsetsDirectionalConverter() final  EdgeInsetsDirectional? margin;

/// Create a copy of StyleItemCardConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StyleItemCardConfigCopyWith<_StyleItemCardConfig> get copyWith => __$StyleItemCardConfigCopyWithImpl<_StyleItemCardConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StyleItemCardConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StyleItemCardConfig&&(identical(other.decoration, decoration) || other.decoration == decoration)&&(identical(other.padding, padding) || other.padding == padding)&&(identical(other.margin, margin) || other.margin == margin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,decoration,padding,margin);

@override
String toString() {
  return 'StyleItemCardConfig(decoration: $decoration, padding: $padding, margin: $margin)';
}


}

/// @nodoc
abstract mixin class _$StyleItemCardConfigCopyWith<$Res> implements $StyleItemCardConfigCopyWith<$Res> {
  factory _$StyleItemCardConfigCopyWith(_StyleItemCardConfig value, $Res Function(_StyleItemCardConfig) _then) = __$StyleItemCardConfigCopyWithImpl;
@override @useResult
$Res call({
@DecorationConverter() BoxDecoration? decoration,@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? padding,@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? margin
});




}
/// @nodoc
class __$StyleItemCardConfigCopyWithImpl<$Res>
    implements _$StyleItemCardConfigCopyWith<$Res> {
  __$StyleItemCardConfigCopyWithImpl(this._self, this._then);

  final _StyleItemCardConfig _self;
  final $Res Function(_StyleItemCardConfig) _then;

/// Create a copy of StyleItemCardConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? decoration = freezed,Object? padding = freezed,Object? margin = freezed,}) {
  return _then(_StyleItemCardConfig(
decoration: freezed == decoration ? _self.decoration : decoration // ignore: cast_nullable_to_non_nullable
as BoxDecoration?,padding: freezed == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as EdgeInsetsDirectional?,margin: freezed == margin ? _self.margin : margin // ignore: cast_nullable_to_non_nullable
as EdgeInsetsDirectional?,
  ));
}


}


/// @nodoc
mixin _$TextItemConfig {

 int? get maxLines;@TextStyleConverter() TextStyle? get style;@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? get padding;
/// Create a copy of TextItemConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextItemConfigCopyWith<TextItemConfig> get copyWith => _$TextItemConfigCopyWithImpl<TextItemConfig>(this as TextItemConfig, _$identity);

  /// Serializes this TextItemConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextItemConfig&&(identical(other.maxLines, maxLines) || other.maxLines == maxLines)&&(identical(other.style, style) || other.style == style)&&(identical(other.padding, padding) || other.padding == padding));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,maxLines,style,padding);

@override
String toString() {
  return 'TextItemConfig(maxLines: $maxLines, style: $style, padding: $padding)';
}


}

/// @nodoc
abstract mixin class $TextItemConfigCopyWith<$Res>  {
  factory $TextItemConfigCopyWith(TextItemConfig value, $Res Function(TextItemConfig) _then) = _$TextItemConfigCopyWithImpl;
@useResult
$Res call({
 int? maxLines,@TextStyleConverter() TextStyle? style,@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? padding
});




}
/// @nodoc
class _$TextItemConfigCopyWithImpl<$Res>
    implements $TextItemConfigCopyWith<$Res> {
  _$TextItemConfigCopyWithImpl(this._self, this._then);

  final TextItemConfig _self;
  final $Res Function(TextItemConfig) _then;

/// Create a copy of TextItemConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? maxLines = freezed,Object? style = freezed,Object? padding = freezed,}) {
  return _then(_self.copyWith(
maxLines: freezed == maxLines ? _self.maxLines : maxLines // ignore: cast_nullable_to_non_nullable
as int?,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as TextStyle?,padding: freezed == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as EdgeInsetsDirectional?,
  ));
}

}


/// Adds pattern-matching-related methods to [TextItemConfig].
extension TextItemConfigPatterns on TextItemConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TextItemConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TextItemConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TextItemConfig value)  $default,){
final _that = this;
switch (_that) {
case _TextItemConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TextItemConfig value)?  $default,){
final _that = this;
switch (_that) {
case _TextItemConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? maxLines, @TextStyleConverter()  TextStyle? style, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? padding)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TextItemConfig() when $default != null:
return $default(_that.maxLines,_that.style,_that.padding);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? maxLines, @TextStyleConverter()  TextStyle? style, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? padding)  $default,) {final _that = this;
switch (_that) {
case _TextItemConfig():
return $default(_that.maxLines,_that.style,_that.padding);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? maxLines, @TextStyleConverter()  TextStyle? style, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? padding)?  $default,) {final _that = this;
switch (_that) {
case _TextItemConfig() when $default != null:
return $default(_that.maxLines,_that.style,_that.padding);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TextItemConfig implements TextItemConfig {
  const _TextItemConfig({this.maxLines, @TextStyleConverter() this.style, @EdgeInsetsDirectionalConverter() this.padding});
  factory _TextItemConfig.fromJson(Map<String, dynamic> json) => _$TextItemConfigFromJson(json);

@override final  int? maxLines;
@override@TextStyleConverter() final  TextStyle? style;
@override@EdgeInsetsDirectionalConverter() final  EdgeInsetsDirectional? padding;

/// Create a copy of TextItemConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TextItemConfigCopyWith<_TextItemConfig> get copyWith => __$TextItemConfigCopyWithImpl<_TextItemConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TextItemConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TextItemConfig&&(identical(other.maxLines, maxLines) || other.maxLines == maxLines)&&(identical(other.style, style) || other.style == style)&&(identical(other.padding, padding) || other.padding == padding));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,maxLines,style,padding);

@override
String toString() {
  return 'TextItemConfig(maxLines: $maxLines, style: $style, padding: $padding)';
}


}

/// @nodoc
abstract mixin class _$TextItemConfigCopyWith<$Res> implements $TextItemConfigCopyWith<$Res> {
  factory _$TextItemConfigCopyWith(_TextItemConfig value, $Res Function(_TextItemConfig) _then) = __$TextItemConfigCopyWithImpl;
@override @useResult
$Res call({
 int? maxLines,@TextStyleConverter() TextStyle? style,@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? padding
});




}
/// @nodoc
class __$TextItemConfigCopyWithImpl<$Res>
    implements _$TextItemConfigCopyWith<$Res> {
  __$TextItemConfigCopyWithImpl(this._self, this._then);

  final _TextItemConfig _self;
  final $Res Function(_TextItemConfig) _then;

/// Create a copy of TextItemConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? maxLines = freezed,Object? style = freezed,Object? padding = freezed,}) {
  return _then(_TextItemConfig(
maxLines: freezed == maxLines ? _self.maxLines : maxLines // ignore: cast_nullable_to_non_nullable
as int?,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as TextStyle?,padding: freezed == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as EdgeInsetsDirectional?,
  ));
}


}

// dart format on
