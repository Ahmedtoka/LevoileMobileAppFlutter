// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_size_advance_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ItemSizeAdvanceConfig {

 double get value; ItemSizeAdvanceType get type;
/// Create a copy of ItemSizeAdvanceConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemSizeAdvanceConfigCopyWith<ItemSizeAdvanceConfig> get copyWith => _$ItemSizeAdvanceConfigCopyWithImpl<ItemSizeAdvanceConfig>(this as ItemSizeAdvanceConfig, _$identity);

  /// Serializes this ItemSizeAdvanceConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemSizeAdvanceConfig&&(identical(other.value, value) || other.value == value)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,type);

@override
String toString() {
  return 'ItemSizeAdvanceConfig(value: $value, type: $type)';
}


}

/// @nodoc
abstract mixin class $ItemSizeAdvanceConfigCopyWith<$Res>  {
  factory $ItemSizeAdvanceConfigCopyWith(ItemSizeAdvanceConfig value, $Res Function(ItemSizeAdvanceConfig) _then) = _$ItemSizeAdvanceConfigCopyWithImpl;
@useResult
$Res call({
 double value, ItemSizeAdvanceType type
});




}
/// @nodoc
class _$ItemSizeAdvanceConfigCopyWithImpl<$Res>
    implements $ItemSizeAdvanceConfigCopyWith<$Res> {
  _$ItemSizeAdvanceConfigCopyWithImpl(this._self, this._then);

  final ItemSizeAdvanceConfig _self;
  final $Res Function(ItemSizeAdvanceConfig) _then;

/// Create a copy of ItemSizeAdvanceConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? type = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ItemSizeAdvanceType,
  ));
}

}


/// Adds pattern-matching-related methods to [ItemSizeAdvanceConfig].
extension ItemSizeAdvanceConfigPatterns on ItemSizeAdvanceConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ItemSizeAdvanceConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ItemSizeAdvanceConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ItemSizeAdvanceConfig value)  $default,){
final _that = this;
switch (_that) {
case _ItemSizeAdvanceConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ItemSizeAdvanceConfig value)?  $default,){
final _that = this;
switch (_that) {
case _ItemSizeAdvanceConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double value,  ItemSizeAdvanceType type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ItemSizeAdvanceConfig() when $default != null:
return $default(_that.value,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double value,  ItemSizeAdvanceType type)  $default,) {final _that = this;
switch (_that) {
case _ItemSizeAdvanceConfig():
return $default(_that.value,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double value,  ItemSizeAdvanceType type)?  $default,) {final _that = this;
switch (_that) {
case _ItemSizeAdvanceConfig() when $default != null:
return $default(_that.value,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ItemSizeAdvanceConfig implements ItemSizeAdvanceConfig {
  const _ItemSizeAdvanceConfig({required this.value, this.type = ItemSizeAdvanceType.fixed});
  factory _ItemSizeAdvanceConfig.fromJson(Map<String, dynamic> json) => _$ItemSizeAdvanceConfigFromJson(json);

@override final  double value;
@override@JsonKey() final  ItemSizeAdvanceType type;

/// Create a copy of ItemSizeAdvanceConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemSizeAdvanceConfigCopyWith<_ItemSizeAdvanceConfig> get copyWith => __$ItemSizeAdvanceConfigCopyWithImpl<_ItemSizeAdvanceConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ItemSizeAdvanceConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItemSizeAdvanceConfig&&(identical(other.value, value) || other.value == value)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,type);

@override
String toString() {
  return 'ItemSizeAdvanceConfig(value: $value, type: $type)';
}


}

/// @nodoc
abstract mixin class _$ItemSizeAdvanceConfigCopyWith<$Res> implements $ItemSizeAdvanceConfigCopyWith<$Res> {
  factory _$ItemSizeAdvanceConfigCopyWith(_ItemSizeAdvanceConfig value, $Res Function(_ItemSizeAdvanceConfig) _then) = __$ItemSizeAdvanceConfigCopyWithImpl;
@override @useResult
$Res call({
 double value, ItemSizeAdvanceType type
});




}
/// @nodoc
class __$ItemSizeAdvanceConfigCopyWithImpl<$Res>
    implements _$ItemSizeAdvanceConfigCopyWith<$Res> {
  __$ItemSizeAdvanceConfigCopyWithImpl(this._self, this._then);

  final _ItemSizeAdvanceConfig _self;
  final $Res Function(_ItemSizeAdvanceConfig) _then;

/// Create a copy of ItemSizeAdvanceConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? type = null,}) {
  return _then(_ItemSizeAdvanceConfig(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ItemSizeAdvanceType,
  ));
}


}

// dart format on
