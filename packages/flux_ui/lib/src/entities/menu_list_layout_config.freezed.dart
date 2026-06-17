// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_list_layout_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MenuListLayoutConfig {

 List<MenuListItemConfig> get items; double get itemSpacing; double? get itemHeight;@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? get padding; MenuListItemStyle get style;
/// Create a copy of MenuListLayoutConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuListLayoutConfigCopyWith<MenuListLayoutConfig> get copyWith => _$MenuListLayoutConfigCopyWithImpl<MenuListLayoutConfig>(this as MenuListLayoutConfig, _$identity);

  /// Serializes this MenuListLayoutConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuListLayoutConfig&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.itemSpacing, itemSpacing) || other.itemSpacing == itemSpacing)&&(identical(other.itemHeight, itemHeight) || other.itemHeight == itemHeight)&&(identical(other.padding, padding) || other.padding == padding)&&(identical(other.style, style) || other.style == style));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),itemSpacing,itemHeight,padding,style);

@override
String toString() {
  return 'MenuListLayoutConfig(items: $items, itemSpacing: $itemSpacing, itemHeight: $itemHeight, padding: $padding, style: $style)';
}


}

/// @nodoc
abstract mixin class $MenuListLayoutConfigCopyWith<$Res>  {
  factory $MenuListLayoutConfigCopyWith(MenuListLayoutConfig value, $Res Function(MenuListLayoutConfig) _then) = _$MenuListLayoutConfigCopyWithImpl;
@useResult
$Res call({
 List<MenuListItemConfig> items, double itemSpacing, double? itemHeight,@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? padding, MenuListItemStyle style
});


$MenuListItemStyleCopyWith<$Res> get style;

}
/// @nodoc
class _$MenuListLayoutConfigCopyWithImpl<$Res>
    implements $MenuListLayoutConfigCopyWith<$Res> {
  _$MenuListLayoutConfigCopyWithImpl(this._self, this._then);

  final MenuListLayoutConfig _self;
  final $Res Function(MenuListLayoutConfig) _then;

/// Create a copy of MenuListLayoutConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? itemSpacing = null,Object? itemHeight = freezed,Object? padding = freezed,Object? style = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<MenuListItemConfig>,itemSpacing: null == itemSpacing ? _self.itemSpacing : itemSpacing // ignore: cast_nullable_to_non_nullable
as double,itemHeight: freezed == itemHeight ? _self.itemHeight : itemHeight // ignore: cast_nullable_to_non_nullable
as double?,padding: freezed == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as EdgeInsetsDirectional?,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as MenuListItemStyle,
  ));
}
/// Create a copy of MenuListLayoutConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MenuListItemStyleCopyWith<$Res> get style {
  
  return $MenuListItemStyleCopyWith<$Res>(_self.style, (value) {
    return _then(_self.copyWith(style: value));
  });
}
}


/// Adds pattern-matching-related methods to [MenuListLayoutConfig].
extension MenuListLayoutConfigPatterns on MenuListLayoutConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuListLayoutConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuListLayoutConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuListLayoutConfig value)  $default,){
final _that = this;
switch (_that) {
case _MenuListLayoutConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuListLayoutConfig value)?  $default,){
final _that = this;
switch (_that) {
case _MenuListLayoutConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MenuListItemConfig> items,  double itemSpacing,  double? itemHeight, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? padding,  MenuListItemStyle style)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuListLayoutConfig() when $default != null:
return $default(_that.items,_that.itemSpacing,_that.itemHeight,_that.padding,_that.style);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MenuListItemConfig> items,  double itemSpacing,  double? itemHeight, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? padding,  MenuListItemStyle style)  $default,) {final _that = this;
switch (_that) {
case _MenuListLayoutConfig():
return $default(_that.items,_that.itemSpacing,_that.itemHeight,_that.padding,_that.style);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MenuListItemConfig> items,  double itemSpacing,  double? itemHeight, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? padding,  MenuListItemStyle style)?  $default,) {final _that = this;
switch (_that) {
case _MenuListLayoutConfig() when $default != null:
return $default(_that.items,_that.itemSpacing,_that.itemHeight,_that.padding,_that.style);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuListLayoutConfig extends MenuListLayoutConfig {
  const _MenuListLayoutConfig({required final  List<MenuListItemConfig> items, this.itemSpacing = 8, this.itemHeight, @EdgeInsetsDirectionalConverter() this.padding, this.style = const MenuListItemStyle()}): _items = items,super._();
  factory _MenuListLayoutConfig.fromJson(Map<String, dynamic> json) => _$MenuListLayoutConfigFromJson(json);

 final  List<MenuListItemConfig> _items;
@override List<MenuListItemConfig> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  double itemSpacing;
@override final  double? itemHeight;
@override@EdgeInsetsDirectionalConverter() final  EdgeInsetsDirectional? padding;
@override@JsonKey() final  MenuListItemStyle style;

/// Create a copy of MenuListLayoutConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuListLayoutConfigCopyWith<_MenuListLayoutConfig> get copyWith => __$MenuListLayoutConfigCopyWithImpl<_MenuListLayoutConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuListLayoutConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuListLayoutConfig&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.itemSpacing, itemSpacing) || other.itemSpacing == itemSpacing)&&(identical(other.itemHeight, itemHeight) || other.itemHeight == itemHeight)&&(identical(other.padding, padding) || other.padding == padding)&&(identical(other.style, style) || other.style == style));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),itemSpacing,itemHeight,padding,style);

@override
String toString() {
  return 'MenuListLayoutConfig(items: $items, itemSpacing: $itemSpacing, itemHeight: $itemHeight, padding: $padding, style: $style)';
}


}

/// @nodoc
abstract mixin class _$MenuListLayoutConfigCopyWith<$Res> implements $MenuListLayoutConfigCopyWith<$Res> {
  factory _$MenuListLayoutConfigCopyWith(_MenuListLayoutConfig value, $Res Function(_MenuListLayoutConfig) _then) = __$MenuListLayoutConfigCopyWithImpl;
@override @useResult
$Res call({
 List<MenuListItemConfig> items, double itemSpacing, double? itemHeight,@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? padding, MenuListItemStyle style
});


@override $MenuListItemStyleCopyWith<$Res> get style;

}
/// @nodoc
class __$MenuListLayoutConfigCopyWithImpl<$Res>
    implements _$MenuListLayoutConfigCopyWith<$Res> {
  __$MenuListLayoutConfigCopyWithImpl(this._self, this._then);

  final _MenuListLayoutConfig _self;
  final $Res Function(_MenuListLayoutConfig) _then;

/// Create a copy of MenuListLayoutConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? itemSpacing = null,Object? itemHeight = freezed,Object? padding = freezed,Object? style = null,}) {
  return _then(_MenuListLayoutConfig(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<MenuListItemConfig>,itemSpacing: null == itemSpacing ? _self.itemSpacing : itemSpacing // ignore: cast_nullable_to_non_nullable
as double,itemHeight: freezed == itemHeight ? _self.itemHeight : itemHeight // ignore: cast_nullable_to_non_nullable
as double?,padding: freezed == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as EdgeInsetsDirectional?,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as MenuListItemStyle,
  ));
}

/// Create a copy of MenuListLayoutConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MenuListItemStyleCopyWith<$Res> get style {
  
  return $MenuListItemStyleCopyWith<$Res>(_self.style, (value) {
    return _then(_self.copyWith(style: value));
  });
}
}

// dart format on
