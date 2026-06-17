// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seo_meta_twitter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SeoMetaTwitter {

 String get title; String get description; String get image;@JsonKey(readValue: _readValueSeoTwitterCard) SeoTwitterCard get card;
/// Create a copy of SeoMetaTwitter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeoMetaTwitterCopyWith<SeoMetaTwitter> get copyWith => _$SeoMetaTwitterCopyWithImpl<SeoMetaTwitter>(this as SeoMetaTwitter, _$identity);

  /// Serializes this SeoMetaTwitter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeoMetaTwitter&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.card, card) || other.card == card));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,image,card);

@override
String toString() {
  return 'SeoMetaTwitter(title: $title, description: $description, image: $image, card: $card)';
}


}

/// @nodoc
abstract mixin class $SeoMetaTwitterCopyWith<$Res>  {
  factory $SeoMetaTwitterCopyWith(SeoMetaTwitter value, $Res Function(SeoMetaTwitter) _then) = _$SeoMetaTwitterCopyWithImpl;
@useResult
$Res call({
 String title, String description, String image,@JsonKey(readValue: _readValueSeoTwitterCard) SeoTwitterCard card
});




}
/// @nodoc
class _$SeoMetaTwitterCopyWithImpl<$Res>
    implements $SeoMetaTwitterCopyWith<$Res> {
  _$SeoMetaTwitterCopyWithImpl(this._self, this._then);

  final SeoMetaTwitter _self;
  final $Res Function(SeoMetaTwitter) _then;

/// Create a copy of SeoMetaTwitter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = null,Object? image = null,Object? card = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,card: null == card ? _self.card : card // ignore: cast_nullable_to_non_nullable
as SeoTwitterCard,
  ));
}

}


/// Adds pattern-matching-related methods to [SeoMetaTwitter].
extension SeoMetaTwitterPatterns on SeoMetaTwitter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeoMetaTwitter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeoMetaTwitter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeoMetaTwitter value)  $default,){
final _that = this;
switch (_that) {
case _SeoMetaTwitter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeoMetaTwitter value)?  $default,){
final _that = this;
switch (_that) {
case _SeoMetaTwitter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String description,  String image, @JsonKey(readValue: _readValueSeoTwitterCard)  SeoTwitterCard card)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeoMetaTwitter() when $default != null:
return $default(_that.title,_that.description,_that.image,_that.card);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String description,  String image, @JsonKey(readValue: _readValueSeoTwitterCard)  SeoTwitterCard card)  $default,) {final _that = this;
switch (_that) {
case _SeoMetaTwitter():
return $default(_that.title,_that.description,_that.image,_that.card);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String description,  String image, @JsonKey(readValue: _readValueSeoTwitterCard)  SeoTwitterCard card)?  $default,) {final _that = this;
switch (_that) {
case _SeoMetaTwitter() when $default != null:
return $default(_that.title,_that.description,_that.image,_that.card);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeoMetaTwitter extends SeoMetaTwitter {
  const _SeoMetaTwitter({required this.title, required this.description, required this.image, @JsonKey(readValue: _readValueSeoTwitterCard) required this.card}): super._();
  factory _SeoMetaTwitter.fromJson(Map<String, dynamic> json) => _$SeoMetaTwitterFromJson(json);

@override final  String title;
@override final  String description;
@override final  String image;
@override@JsonKey(readValue: _readValueSeoTwitterCard) final  SeoTwitterCard card;

/// Create a copy of SeoMetaTwitter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeoMetaTwitterCopyWith<_SeoMetaTwitter> get copyWith => __$SeoMetaTwitterCopyWithImpl<_SeoMetaTwitter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeoMetaTwitterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeoMetaTwitter&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.card, card) || other.card == card));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,image,card);

@override
String toString() {
  return 'SeoMetaTwitter(title: $title, description: $description, image: $image, card: $card)';
}


}

/// @nodoc
abstract mixin class _$SeoMetaTwitterCopyWith<$Res> implements $SeoMetaTwitterCopyWith<$Res> {
  factory _$SeoMetaTwitterCopyWith(_SeoMetaTwitter value, $Res Function(_SeoMetaTwitter) _then) = __$SeoMetaTwitterCopyWithImpl;
@override @useResult
$Res call({
 String title, String description, String image,@JsonKey(readValue: _readValueSeoTwitterCard) SeoTwitterCard card
});




}
/// @nodoc
class __$SeoMetaTwitterCopyWithImpl<$Res>
    implements _$SeoMetaTwitterCopyWith<$Res> {
  __$SeoMetaTwitterCopyWithImpl(this._self, this._then);

  final _SeoMetaTwitter _self;
  final $Res Function(_SeoMetaTwitter) _then;

/// Create a copy of SeoMetaTwitter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? image = null,Object? card = null,}) {
  return _then(_SeoMetaTwitter(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,card: null == card ? _self.card : card // ignore: cast_nullable_to_non_nullable
as SeoTwitterCard,
  ));
}


}

// dart format on
