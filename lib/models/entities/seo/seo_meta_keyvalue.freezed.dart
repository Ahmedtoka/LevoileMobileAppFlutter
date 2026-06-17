// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seo_meta_keyvalue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SeoMetaKeyValue {

 String get key; String get value;
/// Create a copy of SeoMetaKeyValue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeoMetaKeyValueCopyWith<SeoMetaKeyValue> get copyWith => _$SeoMetaKeyValueCopyWithImpl<SeoMetaKeyValue>(this as SeoMetaKeyValue, _$identity);

  /// Serializes this SeoMetaKeyValue to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeoMetaKeyValue&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,value);

@override
String toString() {
  return 'SeoMetaKeyValue(key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class $SeoMetaKeyValueCopyWith<$Res>  {
  factory $SeoMetaKeyValueCopyWith(SeoMetaKeyValue value, $Res Function(SeoMetaKeyValue) _then) = _$SeoMetaKeyValueCopyWithImpl;
@useResult
$Res call({
 String key, String value
});




}
/// @nodoc
class _$SeoMetaKeyValueCopyWithImpl<$Res>
    implements $SeoMetaKeyValueCopyWith<$Res> {
  _$SeoMetaKeyValueCopyWithImpl(this._self, this._then);

  final SeoMetaKeyValue _self;
  final $Res Function(SeoMetaKeyValue) _then;

/// Create a copy of SeoMetaKeyValue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? value = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SeoMetaKeyValue].
extension SeoMetaKeyValuePatterns on SeoMetaKeyValue {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeoMetaKeyValue value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeoMetaKeyValue() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeoMetaKeyValue value)  $default,){
final _that = this;
switch (_that) {
case _SeoMetaKeyValue():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeoMetaKeyValue value)?  $default,){
final _that = this;
switch (_that) {
case _SeoMetaKeyValue() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeoMetaKeyValue() when $default != null:
return $default(_that.key,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  String value)  $default,) {final _that = this;
switch (_that) {
case _SeoMetaKeyValue():
return $default(_that.key,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  String value)?  $default,) {final _that = this;
switch (_that) {
case _SeoMetaKeyValue() when $default != null:
return $default(_that.key,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeoMetaKeyValue extends SeoMetaKeyValue {
  const _SeoMetaKeyValue({required this.key, required this.value}): super._();
  factory _SeoMetaKeyValue.fromJson(Map<String, dynamic> json) => _$SeoMetaKeyValueFromJson(json);

@override final  String key;
@override final  String value;

/// Create a copy of SeoMetaKeyValue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeoMetaKeyValueCopyWith<_SeoMetaKeyValue> get copyWith => __$SeoMetaKeyValueCopyWithImpl<_SeoMetaKeyValue>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeoMetaKeyValueToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeoMetaKeyValue&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,value);

@override
String toString() {
  return 'SeoMetaKeyValue(key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class _$SeoMetaKeyValueCopyWith<$Res> implements $SeoMetaKeyValueCopyWith<$Res> {
  factory _$SeoMetaKeyValueCopyWith(_SeoMetaKeyValue value, $Res Function(_SeoMetaKeyValue) _then) = __$SeoMetaKeyValueCopyWithImpl;
@override @useResult
$Res call({
 String key, String value
});




}
/// @nodoc
class __$SeoMetaKeyValueCopyWithImpl<$Res>
    implements _$SeoMetaKeyValueCopyWith<$Res> {
  __$SeoMetaKeyValueCopyWithImpl(this._self, this._then);

  final _SeoMetaKeyValue _self;
  final $Res Function(_SeoMetaKeyValue) _then;

/// Create a copy of SeoMetaKeyValue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? value = null,}) {
  return _then(_SeoMetaKeyValue(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
