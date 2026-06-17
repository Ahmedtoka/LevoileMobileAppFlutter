// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seo_meta_property_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SeoMetaPropertyContent {

 String get property; String get content;
/// Create a copy of SeoMetaPropertyContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeoMetaPropertyContentCopyWith<SeoMetaPropertyContent> get copyWith => _$SeoMetaPropertyContentCopyWithImpl<SeoMetaPropertyContent>(this as SeoMetaPropertyContent, _$identity);

  /// Serializes this SeoMetaPropertyContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeoMetaPropertyContent&&(identical(other.property, property) || other.property == property)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,property,content);

@override
String toString() {
  return 'SeoMetaPropertyContent(property: $property, content: $content)';
}


}

/// @nodoc
abstract mixin class $SeoMetaPropertyContentCopyWith<$Res>  {
  factory $SeoMetaPropertyContentCopyWith(SeoMetaPropertyContent value, $Res Function(SeoMetaPropertyContent) _then) = _$SeoMetaPropertyContentCopyWithImpl;
@useResult
$Res call({
 String property, String content
});




}
/// @nodoc
class _$SeoMetaPropertyContentCopyWithImpl<$Res>
    implements $SeoMetaPropertyContentCopyWith<$Res> {
  _$SeoMetaPropertyContentCopyWithImpl(this._self, this._then);

  final SeoMetaPropertyContent _self;
  final $Res Function(SeoMetaPropertyContent) _then;

/// Create a copy of SeoMetaPropertyContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? property = null,Object? content = null,}) {
  return _then(_self.copyWith(
property: null == property ? _self.property : property // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SeoMetaPropertyContent].
extension SeoMetaPropertyContentPatterns on SeoMetaPropertyContent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeoMetaPropertyContent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeoMetaPropertyContent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeoMetaPropertyContent value)  $default,){
final _that = this;
switch (_that) {
case _SeoMetaPropertyContent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeoMetaPropertyContent value)?  $default,){
final _that = this;
switch (_that) {
case _SeoMetaPropertyContent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String property,  String content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeoMetaPropertyContent() when $default != null:
return $default(_that.property,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String property,  String content)  $default,) {final _that = this;
switch (_that) {
case _SeoMetaPropertyContent():
return $default(_that.property,_that.content);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String property,  String content)?  $default,) {final _that = this;
switch (_that) {
case _SeoMetaPropertyContent() when $default != null:
return $default(_that.property,_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeoMetaPropertyContent extends SeoMetaPropertyContent {
  const _SeoMetaPropertyContent({required this.property, required this.content}): super._();
  factory _SeoMetaPropertyContent.fromJson(Map<String, dynamic> json) => _$SeoMetaPropertyContentFromJson(json);

@override final  String property;
@override final  String content;

/// Create a copy of SeoMetaPropertyContent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeoMetaPropertyContentCopyWith<_SeoMetaPropertyContent> get copyWith => __$SeoMetaPropertyContentCopyWithImpl<_SeoMetaPropertyContent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeoMetaPropertyContentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeoMetaPropertyContent&&(identical(other.property, property) || other.property == property)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,property,content);

@override
String toString() {
  return 'SeoMetaPropertyContent(property: $property, content: $content)';
}


}

/// @nodoc
abstract mixin class _$SeoMetaPropertyContentCopyWith<$Res> implements $SeoMetaPropertyContentCopyWith<$Res> {
  factory _$SeoMetaPropertyContentCopyWith(_SeoMetaPropertyContent value, $Res Function(_SeoMetaPropertyContent) _then) = __$SeoMetaPropertyContentCopyWithImpl;
@override @useResult
$Res call({
 String property, String content
});




}
/// @nodoc
class __$SeoMetaPropertyContentCopyWithImpl<$Res>
    implements _$SeoMetaPropertyContentCopyWith<$Res> {
  __$SeoMetaPropertyContentCopyWithImpl(this._self, this._then);

  final _SeoMetaPropertyContent _self;
  final $Res Function(_SeoMetaPropertyContent) _then;

/// Create a copy of SeoMetaPropertyContent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? property = null,Object? content = null,}) {
  return _then(_SeoMetaPropertyContent(
property: null == property ? _self.property : property // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
