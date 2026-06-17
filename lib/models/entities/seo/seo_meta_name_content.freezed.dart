// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seo_meta_name_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SeoMetaNameContent {

 String get name; String get content;
/// Create a copy of SeoMetaNameContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeoMetaNameContentCopyWith<SeoMetaNameContent> get copyWith => _$SeoMetaNameContentCopyWithImpl<SeoMetaNameContent>(this as SeoMetaNameContent, _$identity);

  /// Serializes this SeoMetaNameContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeoMetaNameContent&&(identical(other.name, name) || other.name == name)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,content);

@override
String toString() {
  return 'SeoMetaNameContent(name: $name, content: $content)';
}


}

/// @nodoc
abstract mixin class $SeoMetaNameContentCopyWith<$Res>  {
  factory $SeoMetaNameContentCopyWith(SeoMetaNameContent value, $Res Function(SeoMetaNameContent) _then) = _$SeoMetaNameContentCopyWithImpl;
@useResult
$Res call({
 String name, String content
});




}
/// @nodoc
class _$SeoMetaNameContentCopyWithImpl<$Res>
    implements $SeoMetaNameContentCopyWith<$Res> {
  _$SeoMetaNameContentCopyWithImpl(this._self, this._then);

  final SeoMetaNameContent _self;
  final $Res Function(SeoMetaNameContent) _then;

/// Create a copy of SeoMetaNameContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? content = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SeoMetaNameContent].
extension SeoMetaNameContentPatterns on SeoMetaNameContent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeoMetaNameContent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeoMetaNameContent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeoMetaNameContent value)  $default,){
final _that = this;
switch (_that) {
case _SeoMetaNameContent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeoMetaNameContent value)?  $default,){
final _that = this;
switch (_that) {
case _SeoMetaNameContent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeoMetaNameContent() when $default != null:
return $default(_that.name,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String content)  $default,) {final _that = this;
switch (_that) {
case _SeoMetaNameContent():
return $default(_that.name,_that.content);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String content)?  $default,) {final _that = this;
switch (_that) {
case _SeoMetaNameContent() when $default != null:
return $default(_that.name,_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeoMetaNameContent extends SeoMetaNameContent {
  const _SeoMetaNameContent({required this.name, required this.content}): super._();
  factory _SeoMetaNameContent.fromJson(Map<String, dynamic> json) => _$SeoMetaNameContentFromJson(json);

@override final  String name;
@override final  String content;

/// Create a copy of SeoMetaNameContent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeoMetaNameContentCopyWith<_SeoMetaNameContent> get copyWith => __$SeoMetaNameContentCopyWithImpl<_SeoMetaNameContent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeoMetaNameContentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeoMetaNameContent&&(identical(other.name, name) || other.name == name)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,content);

@override
String toString() {
  return 'SeoMetaNameContent(name: $name, content: $content)';
}


}

/// @nodoc
abstract mixin class _$SeoMetaNameContentCopyWith<$Res> implements $SeoMetaNameContentCopyWith<$Res> {
  factory _$SeoMetaNameContentCopyWith(_SeoMetaNameContent value, $Res Function(_SeoMetaNameContent) _then) = __$SeoMetaNameContentCopyWithImpl;
@override @useResult
$Res call({
 String name, String content
});




}
/// @nodoc
class __$SeoMetaNameContentCopyWithImpl<$Res>
    implements _$SeoMetaNameContentCopyWith<$Res> {
  __$SeoMetaNameContentCopyWithImpl(this._self, this._then);

  final _SeoMetaNameContent _self;
  final $Res Function(_SeoMetaNameContent) _then;

/// Create a copy of SeoMetaNameContent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? content = null,}) {
  return _then(_SeoMetaNameContent(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
