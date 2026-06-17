// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_preview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductPreview {

 String get title; String get textPrice; String get imageUrl; String? get textDiscountedPrice; double? get discountPercentage; bool get isFavorite;@ListColorConverter() List<Color>? get colorVariants;
/// Create a copy of ProductPreview
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductPreviewCopyWith<ProductPreview> get copyWith => _$ProductPreviewCopyWithImpl<ProductPreview>(this as ProductPreview, _$identity);

  /// Serializes this ProductPreview to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductPreview&&(identical(other.title, title) || other.title == title)&&(identical(other.textPrice, textPrice) || other.textPrice == textPrice)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.textDiscountedPrice, textDiscountedPrice) || other.textDiscountedPrice == textDiscountedPrice)&&(identical(other.discountPercentage, discountPercentage) || other.discountPercentage == discountPercentage)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&const DeepCollectionEquality().equals(other.colorVariants, colorVariants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,textPrice,imageUrl,textDiscountedPrice,discountPercentage,isFavorite,const DeepCollectionEquality().hash(colorVariants));

@override
String toString() {
  return 'ProductPreview(title: $title, textPrice: $textPrice, imageUrl: $imageUrl, textDiscountedPrice: $textDiscountedPrice, discountPercentage: $discountPercentage, isFavorite: $isFavorite, colorVariants: $colorVariants)';
}


}

/// @nodoc
abstract mixin class $ProductPreviewCopyWith<$Res>  {
  factory $ProductPreviewCopyWith(ProductPreview value, $Res Function(ProductPreview) _then) = _$ProductPreviewCopyWithImpl;
@useResult
$Res call({
 String title, String textPrice, String imageUrl, String? textDiscountedPrice, double? discountPercentage, bool isFavorite,@ListColorConverter() List<Color>? colorVariants
});




}
/// @nodoc
class _$ProductPreviewCopyWithImpl<$Res>
    implements $ProductPreviewCopyWith<$Res> {
  _$ProductPreviewCopyWithImpl(this._self, this._then);

  final ProductPreview _self;
  final $Res Function(ProductPreview) _then;

/// Create a copy of ProductPreview
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? textPrice = null,Object? imageUrl = null,Object? textDiscountedPrice = freezed,Object? discountPercentage = freezed,Object? isFavorite = null,Object? colorVariants = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,textPrice: null == textPrice ? _self.textPrice : textPrice // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,textDiscountedPrice: freezed == textDiscountedPrice ? _self.textDiscountedPrice : textDiscountedPrice // ignore: cast_nullable_to_non_nullable
as String?,discountPercentage: freezed == discountPercentage ? _self.discountPercentage : discountPercentage // ignore: cast_nullable_to_non_nullable
as double?,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,colorVariants: freezed == colorVariants ? _self.colorVariants : colorVariants // ignore: cast_nullable_to_non_nullable
as List<Color>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductPreview].
extension ProductPreviewPatterns on ProductPreview {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductPreview value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductPreview() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductPreview value)  $default,){
final _that = this;
switch (_that) {
case _ProductPreview():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductPreview value)?  $default,){
final _that = this;
switch (_that) {
case _ProductPreview() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String textPrice,  String imageUrl,  String? textDiscountedPrice,  double? discountPercentage,  bool isFavorite, @ListColorConverter()  List<Color>? colorVariants)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductPreview() when $default != null:
return $default(_that.title,_that.textPrice,_that.imageUrl,_that.textDiscountedPrice,_that.discountPercentage,_that.isFavorite,_that.colorVariants);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String textPrice,  String imageUrl,  String? textDiscountedPrice,  double? discountPercentage,  bool isFavorite, @ListColorConverter()  List<Color>? colorVariants)  $default,) {final _that = this;
switch (_that) {
case _ProductPreview():
return $default(_that.title,_that.textPrice,_that.imageUrl,_that.textDiscountedPrice,_that.discountPercentage,_that.isFavorite,_that.colorVariants);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String textPrice,  String imageUrl,  String? textDiscountedPrice,  double? discountPercentage,  bool isFavorite, @ListColorConverter()  List<Color>? colorVariants)?  $default,) {final _that = this;
switch (_that) {
case _ProductPreview() when $default != null:
return $default(_that.title,_that.textPrice,_that.imageUrl,_that.textDiscountedPrice,_that.discountPercentage,_that.isFavorite,_that.colorVariants);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductPreview extends ProductPreview {
  const _ProductPreview({required this.title, required this.textPrice, required this.imageUrl, this.textDiscountedPrice, this.discountPercentage, this.isFavorite = false, @ListColorConverter() final  List<Color>? colorVariants}): _colorVariants = colorVariants,super._();
  factory _ProductPreview.fromJson(Map<String, dynamic> json) => _$ProductPreviewFromJson(json);

@override final  String title;
@override final  String textPrice;
@override final  String imageUrl;
@override final  String? textDiscountedPrice;
@override final  double? discountPercentage;
@override@JsonKey() final  bool isFavorite;
 final  List<Color>? _colorVariants;
@override@ListColorConverter() List<Color>? get colorVariants {
  final value = _colorVariants;
  if (value == null) return null;
  if (_colorVariants is EqualUnmodifiableListView) return _colorVariants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ProductPreview
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductPreviewCopyWith<_ProductPreview> get copyWith => __$ProductPreviewCopyWithImpl<_ProductPreview>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductPreviewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductPreview&&(identical(other.title, title) || other.title == title)&&(identical(other.textPrice, textPrice) || other.textPrice == textPrice)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.textDiscountedPrice, textDiscountedPrice) || other.textDiscountedPrice == textDiscountedPrice)&&(identical(other.discountPercentage, discountPercentage) || other.discountPercentage == discountPercentage)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&const DeepCollectionEquality().equals(other._colorVariants, _colorVariants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,textPrice,imageUrl,textDiscountedPrice,discountPercentage,isFavorite,const DeepCollectionEquality().hash(_colorVariants));

@override
String toString() {
  return 'ProductPreview(title: $title, textPrice: $textPrice, imageUrl: $imageUrl, textDiscountedPrice: $textDiscountedPrice, discountPercentage: $discountPercentage, isFavorite: $isFavorite, colorVariants: $colorVariants)';
}


}

/// @nodoc
abstract mixin class _$ProductPreviewCopyWith<$Res> implements $ProductPreviewCopyWith<$Res> {
  factory _$ProductPreviewCopyWith(_ProductPreview value, $Res Function(_ProductPreview) _then) = __$ProductPreviewCopyWithImpl;
@override @useResult
$Res call({
 String title, String textPrice, String imageUrl, String? textDiscountedPrice, double? discountPercentage, bool isFavorite,@ListColorConverter() List<Color>? colorVariants
});




}
/// @nodoc
class __$ProductPreviewCopyWithImpl<$Res>
    implements _$ProductPreviewCopyWith<$Res> {
  __$ProductPreviewCopyWithImpl(this._self, this._then);

  final _ProductPreview _self;
  final $Res Function(_ProductPreview) _then;

/// Create a copy of ProductPreview
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? textPrice = null,Object? imageUrl = null,Object? textDiscountedPrice = freezed,Object? discountPercentage = freezed,Object? isFavorite = null,Object? colorVariants = freezed,}) {
  return _then(_ProductPreview(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,textPrice: null == textPrice ? _self.textPrice : textPrice // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,textDiscountedPrice: freezed == textDiscountedPrice ? _self.textDiscountedPrice : textDiscountedPrice // ignore: cast_nullable_to_non_nullable
as String?,discountPercentage: freezed == discountPercentage ? _self.discountPercentage : discountPercentage // ignore: cast_nullable_to_non_nullable
as double?,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,colorVariants: freezed == colorVariants ? _self._colorVariants : colorVariants // ignore: cast_nullable_to_non_nullable
as List<Color>?,
  ));
}


}

// dart format on
