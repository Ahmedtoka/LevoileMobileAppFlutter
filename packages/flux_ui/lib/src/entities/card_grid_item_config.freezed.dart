// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_grid_item_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CardGridItemConfig implements DiagnosticableTreeMixin {

 String? get id; String get name; String get imageUrl;
/// Create a copy of CardGridItemConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardGridItemConfigCopyWith<CardGridItemConfig> get copyWith => _$CardGridItemConfigCopyWithImpl<CardGridItemConfig>(this as CardGridItemConfig, _$identity);

  /// Serializes this CardGridItemConfig to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CardGridItemConfig'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('imageUrl', imageUrl));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CardGridItemConfig&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CardGridItemConfig(id: $id, name: $name, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $CardGridItemConfigCopyWith<$Res>  {
  factory $CardGridItemConfigCopyWith(CardGridItemConfig value, $Res Function(CardGridItemConfig) _then) = _$CardGridItemConfigCopyWithImpl;
@useResult
$Res call({
 String? id, String name, String imageUrl
});




}
/// @nodoc
class _$CardGridItemConfigCopyWithImpl<$Res>
    implements $CardGridItemConfigCopyWith<$Res> {
  _$CardGridItemConfigCopyWithImpl(this._self, this._then);

  final CardGridItemConfig _self;
  final $Res Function(CardGridItemConfig) _then;

/// Create a copy of CardGridItemConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? imageUrl = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CardGridItemConfig].
extension CardGridItemConfigPatterns on CardGridItemConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CardGridItemConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CardGridItemConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CardGridItemConfig value)  $default,){
final _that = this;
switch (_that) {
case _CardGridItemConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CardGridItemConfig value)?  $default,){
final _that = this;
switch (_that) {
case _CardGridItemConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String name,  String imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CardGridItemConfig() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String name,  String imageUrl)  $default,) {final _that = this;
switch (_that) {
case _CardGridItemConfig():
return $default(_that.id,_that.name,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String name,  String imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _CardGridItemConfig() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CardGridItemConfig with DiagnosticableTreeMixin implements CardGridItemConfig {
  const _CardGridItemConfig({this.id, required this.name, required this.imageUrl});
  factory _CardGridItemConfig.fromJson(Map<String, dynamic> json) => _$CardGridItemConfigFromJson(json);

@override final  String? id;
@override final  String name;
@override final  String imageUrl;

/// Create a copy of CardGridItemConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CardGridItemConfigCopyWith<_CardGridItemConfig> get copyWith => __$CardGridItemConfigCopyWithImpl<_CardGridItemConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CardGridItemConfigToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CardGridItemConfig'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('imageUrl', imageUrl));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CardGridItemConfig&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CardGridItemConfig(id: $id, name: $name, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$CardGridItemConfigCopyWith<$Res> implements $CardGridItemConfigCopyWith<$Res> {
  factory _$CardGridItemConfigCopyWith(_CardGridItemConfig value, $Res Function(_CardGridItemConfig) _then) = __$CardGridItemConfigCopyWithImpl;
@override @useResult
$Res call({
 String? id, String name, String imageUrl
});




}
/// @nodoc
class __$CardGridItemConfigCopyWithImpl<$Res>
    implements _$CardGridItemConfigCopyWith<$Res> {
  __$CardGridItemConfigCopyWithImpl(this._self, this._then);

  final _CardGridItemConfig _self;
  final $Res Function(_CardGridItemConfig) _then;

/// Create a copy of CardGridItemConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? imageUrl = null,}) {
  return _then(_CardGridItemConfig(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
