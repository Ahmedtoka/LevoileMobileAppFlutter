// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_review_tile_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TestimonialStyle implements DiagnosticableTreeMixin {

 FluxCardConfig get cardConfig; double get spacing; List<ProductReviewTileElement> get elementOrder; FluxTextStyleConfig? get userNameStyleConfig; FluxTextStyleConfig? get reviewTextStyleConfig; FluxImageStyleConfig? get imageStyleConfig; FluxImageStyleConfig? get avatarStyleConfig; FluxRatingStyleConfig get ratingStyleConfig;
/// Create a copy of TestimonialStyle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestimonialStyleCopyWith<TestimonialStyle> get copyWith => _$TestimonialStyleCopyWithImpl<TestimonialStyle>(this as TestimonialStyle, _$identity);

  /// Serializes this TestimonialStyle to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TestimonialStyle'))
    ..add(DiagnosticsProperty('cardConfig', cardConfig))..add(DiagnosticsProperty('spacing', spacing))..add(DiagnosticsProperty('elementOrder', elementOrder))..add(DiagnosticsProperty('userNameStyleConfig', userNameStyleConfig))..add(DiagnosticsProperty('reviewTextStyleConfig', reviewTextStyleConfig))..add(DiagnosticsProperty('imageStyleConfig', imageStyleConfig))..add(DiagnosticsProperty('avatarStyleConfig', avatarStyleConfig))..add(DiagnosticsProperty('ratingStyleConfig', ratingStyleConfig));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestimonialStyle&&(identical(other.cardConfig, cardConfig) || other.cardConfig == cardConfig)&&(identical(other.spacing, spacing) || other.spacing == spacing)&&const DeepCollectionEquality().equals(other.elementOrder, elementOrder)&&(identical(other.userNameStyleConfig, userNameStyleConfig) || other.userNameStyleConfig == userNameStyleConfig)&&(identical(other.reviewTextStyleConfig, reviewTextStyleConfig) || other.reviewTextStyleConfig == reviewTextStyleConfig)&&(identical(other.imageStyleConfig, imageStyleConfig) || other.imageStyleConfig == imageStyleConfig)&&(identical(other.avatarStyleConfig, avatarStyleConfig) || other.avatarStyleConfig == avatarStyleConfig)&&(identical(other.ratingStyleConfig, ratingStyleConfig) || other.ratingStyleConfig == ratingStyleConfig));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cardConfig,spacing,const DeepCollectionEquality().hash(elementOrder),userNameStyleConfig,reviewTextStyleConfig,imageStyleConfig,avatarStyleConfig,ratingStyleConfig);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TestimonialStyle(cardConfig: $cardConfig, spacing: $spacing, elementOrder: $elementOrder, userNameStyleConfig: $userNameStyleConfig, reviewTextStyleConfig: $reviewTextStyleConfig, imageStyleConfig: $imageStyleConfig, avatarStyleConfig: $avatarStyleConfig, ratingStyleConfig: $ratingStyleConfig)';
}


}

/// @nodoc
abstract mixin class $TestimonialStyleCopyWith<$Res>  {
  factory $TestimonialStyleCopyWith(TestimonialStyle value, $Res Function(TestimonialStyle) _then) = _$TestimonialStyleCopyWithImpl;
@useResult
$Res call({
 FluxCardConfig cardConfig, double spacing, List<ProductReviewTileElement> elementOrder, FluxTextStyleConfig? userNameStyleConfig, FluxTextStyleConfig? reviewTextStyleConfig, FluxImageStyleConfig? imageStyleConfig, FluxImageStyleConfig? avatarStyleConfig, FluxRatingStyleConfig ratingStyleConfig
});


$FluxCardConfigCopyWith<$Res> get cardConfig;$FluxTextStyleConfigCopyWith<$Res>? get userNameStyleConfig;$FluxTextStyleConfigCopyWith<$Res>? get reviewTextStyleConfig;$FluxImageStyleConfigCopyWith<$Res>? get imageStyleConfig;$FluxImageStyleConfigCopyWith<$Res>? get avatarStyleConfig;$FluxRatingStyleConfigCopyWith<$Res> get ratingStyleConfig;

}
/// @nodoc
class _$TestimonialStyleCopyWithImpl<$Res>
    implements $TestimonialStyleCopyWith<$Res> {
  _$TestimonialStyleCopyWithImpl(this._self, this._then);

  final TestimonialStyle _self;
  final $Res Function(TestimonialStyle) _then;

/// Create a copy of TestimonialStyle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cardConfig = null,Object? spacing = null,Object? elementOrder = null,Object? userNameStyleConfig = freezed,Object? reviewTextStyleConfig = freezed,Object? imageStyleConfig = freezed,Object? avatarStyleConfig = freezed,Object? ratingStyleConfig = null,}) {
  return _then(_self.copyWith(
cardConfig: null == cardConfig ? _self.cardConfig : cardConfig // ignore: cast_nullable_to_non_nullable
as FluxCardConfig,spacing: null == spacing ? _self.spacing : spacing // ignore: cast_nullable_to_non_nullable
as double,elementOrder: null == elementOrder ? _self.elementOrder : elementOrder // ignore: cast_nullable_to_non_nullable
as List<ProductReviewTileElement>,userNameStyleConfig: freezed == userNameStyleConfig ? _self.userNameStyleConfig : userNameStyleConfig // ignore: cast_nullable_to_non_nullable
as FluxTextStyleConfig?,reviewTextStyleConfig: freezed == reviewTextStyleConfig ? _self.reviewTextStyleConfig : reviewTextStyleConfig // ignore: cast_nullable_to_non_nullable
as FluxTextStyleConfig?,imageStyleConfig: freezed == imageStyleConfig ? _self.imageStyleConfig : imageStyleConfig // ignore: cast_nullable_to_non_nullable
as FluxImageStyleConfig?,avatarStyleConfig: freezed == avatarStyleConfig ? _self.avatarStyleConfig : avatarStyleConfig // ignore: cast_nullable_to_non_nullable
as FluxImageStyleConfig?,ratingStyleConfig: null == ratingStyleConfig ? _self.ratingStyleConfig : ratingStyleConfig // ignore: cast_nullable_to_non_nullable
as FluxRatingStyleConfig,
  ));
}
/// Create a copy of TestimonialStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxCardConfigCopyWith<$Res> get cardConfig {
  
  return $FluxCardConfigCopyWith<$Res>(_self.cardConfig, (value) {
    return _then(_self.copyWith(cardConfig: value));
  });
}/// Create a copy of TestimonialStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxTextStyleConfigCopyWith<$Res>? get userNameStyleConfig {
    if (_self.userNameStyleConfig == null) {
    return null;
  }

  return $FluxTextStyleConfigCopyWith<$Res>(_self.userNameStyleConfig!, (value) {
    return _then(_self.copyWith(userNameStyleConfig: value));
  });
}/// Create a copy of TestimonialStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxTextStyleConfigCopyWith<$Res>? get reviewTextStyleConfig {
    if (_self.reviewTextStyleConfig == null) {
    return null;
  }

  return $FluxTextStyleConfigCopyWith<$Res>(_self.reviewTextStyleConfig!, (value) {
    return _then(_self.copyWith(reviewTextStyleConfig: value));
  });
}/// Create a copy of TestimonialStyle
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
}/// Create a copy of TestimonialStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxImageStyleConfigCopyWith<$Res>? get avatarStyleConfig {
    if (_self.avatarStyleConfig == null) {
    return null;
  }

  return $FluxImageStyleConfigCopyWith<$Res>(_self.avatarStyleConfig!, (value) {
    return _then(_self.copyWith(avatarStyleConfig: value));
  });
}/// Create a copy of TestimonialStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxRatingStyleConfigCopyWith<$Res> get ratingStyleConfig {
  
  return $FluxRatingStyleConfigCopyWith<$Res>(_self.ratingStyleConfig, (value) {
    return _then(_self.copyWith(ratingStyleConfig: value));
  });
}
}


/// Adds pattern-matching-related methods to [TestimonialStyle].
extension TestimonialStylePatterns on TestimonialStyle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TestimonialStyle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TestimonialStyle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TestimonialStyle value)  $default,){
final _that = this;
switch (_that) {
case _TestimonialStyle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TestimonialStyle value)?  $default,){
final _that = this;
switch (_that) {
case _TestimonialStyle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FluxCardConfig cardConfig,  double spacing,  List<ProductReviewTileElement> elementOrder,  FluxTextStyleConfig? userNameStyleConfig,  FluxTextStyleConfig? reviewTextStyleConfig,  FluxImageStyleConfig? imageStyleConfig,  FluxImageStyleConfig? avatarStyleConfig,  FluxRatingStyleConfig ratingStyleConfig)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TestimonialStyle() when $default != null:
return $default(_that.cardConfig,_that.spacing,_that.elementOrder,_that.userNameStyleConfig,_that.reviewTextStyleConfig,_that.imageStyleConfig,_that.avatarStyleConfig,_that.ratingStyleConfig);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FluxCardConfig cardConfig,  double spacing,  List<ProductReviewTileElement> elementOrder,  FluxTextStyleConfig? userNameStyleConfig,  FluxTextStyleConfig? reviewTextStyleConfig,  FluxImageStyleConfig? imageStyleConfig,  FluxImageStyleConfig? avatarStyleConfig,  FluxRatingStyleConfig ratingStyleConfig)  $default,) {final _that = this;
switch (_that) {
case _TestimonialStyle():
return $default(_that.cardConfig,_that.spacing,_that.elementOrder,_that.userNameStyleConfig,_that.reviewTextStyleConfig,_that.imageStyleConfig,_that.avatarStyleConfig,_that.ratingStyleConfig);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FluxCardConfig cardConfig,  double spacing,  List<ProductReviewTileElement> elementOrder,  FluxTextStyleConfig? userNameStyleConfig,  FluxTextStyleConfig? reviewTextStyleConfig,  FluxImageStyleConfig? imageStyleConfig,  FluxImageStyleConfig? avatarStyleConfig,  FluxRatingStyleConfig ratingStyleConfig)?  $default,) {final _that = this;
switch (_that) {
case _TestimonialStyle() when $default != null:
return $default(_that.cardConfig,_that.spacing,_that.elementOrder,_that.userNameStyleConfig,_that.reviewTextStyleConfig,_that.imageStyleConfig,_that.avatarStyleConfig,_that.ratingStyleConfig);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TestimonialStyle extends TestimonialStyle with DiagnosticableTreeMixin {
  const _TestimonialStyle({this.cardConfig = const FluxCardConfig(), this.spacing = 8.0, final  List<ProductReviewTileElement> elementOrder = ProductReviewTileElement.defaultOrder, this.userNameStyleConfig, this.reviewTextStyleConfig, this.imageStyleConfig, this.avatarStyleConfig, this.ratingStyleConfig = const FluxRatingStyleConfig()}): _elementOrder = elementOrder,super._();
  factory _TestimonialStyle.fromJson(Map<String, dynamic> json) => _$TestimonialStyleFromJson(json);

@override@JsonKey() final  FluxCardConfig cardConfig;
@override@JsonKey() final  double spacing;
 final  List<ProductReviewTileElement> _elementOrder;
@override@JsonKey() List<ProductReviewTileElement> get elementOrder {
  if (_elementOrder is EqualUnmodifiableListView) return _elementOrder;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_elementOrder);
}

@override final  FluxTextStyleConfig? userNameStyleConfig;
@override final  FluxTextStyleConfig? reviewTextStyleConfig;
@override final  FluxImageStyleConfig? imageStyleConfig;
@override final  FluxImageStyleConfig? avatarStyleConfig;
@override@JsonKey() final  FluxRatingStyleConfig ratingStyleConfig;

/// Create a copy of TestimonialStyle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestimonialStyleCopyWith<_TestimonialStyle> get copyWith => __$TestimonialStyleCopyWithImpl<_TestimonialStyle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TestimonialStyleToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TestimonialStyle'))
    ..add(DiagnosticsProperty('cardConfig', cardConfig))..add(DiagnosticsProperty('spacing', spacing))..add(DiagnosticsProperty('elementOrder', elementOrder))..add(DiagnosticsProperty('userNameStyleConfig', userNameStyleConfig))..add(DiagnosticsProperty('reviewTextStyleConfig', reviewTextStyleConfig))..add(DiagnosticsProperty('imageStyleConfig', imageStyleConfig))..add(DiagnosticsProperty('avatarStyleConfig', avatarStyleConfig))..add(DiagnosticsProperty('ratingStyleConfig', ratingStyleConfig));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestimonialStyle&&(identical(other.cardConfig, cardConfig) || other.cardConfig == cardConfig)&&(identical(other.spacing, spacing) || other.spacing == spacing)&&const DeepCollectionEquality().equals(other._elementOrder, _elementOrder)&&(identical(other.userNameStyleConfig, userNameStyleConfig) || other.userNameStyleConfig == userNameStyleConfig)&&(identical(other.reviewTextStyleConfig, reviewTextStyleConfig) || other.reviewTextStyleConfig == reviewTextStyleConfig)&&(identical(other.imageStyleConfig, imageStyleConfig) || other.imageStyleConfig == imageStyleConfig)&&(identical(other.avatarStyleConfig, avatarStyleConfig) || other.avatarStyleConfig == avatarStyleConfig)&&(identical(other.ratingStyleConfig, ratingStyleConfig) || other.ratingStyleConfig == ratingStyleConfig));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cardConfig,spacing,const DeepCollectionEquality().hash(_elementOrder),userNameStyleConfig,reviewTextStyleConfig,imageStyleConfig,avatarStyleConfig,ratingStyleConfig);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TestimonialStyle(cardConfig: $cardConfig, spacing: $spacing, elementOrder: $elementOrder, userNameStyleConfig: $userNameStyleConfig, reviewTextStyleConfig: $reviewTextStyleConfig, imageStyleConfig: $imageStyleConfig, avatarStyleConfig: $avatarStyleConfig, ratingStyleConfig: $ratingStyleConfig)';
}


}

/// @nodoc
abstract mixin class _$TestimonialStyleCopyWith<$Res> implements $TestimonialStyleCopyWith<$Res> {
  factory _$TestimonialStyleCopyWith(_TestimonialStyle value, $Res Function(_TestimonialStyle) _then) = __$TestimonialStyleCopyWithImpl;
@override @useResult
$Res call({
 FluxCardConfig cardConfig, double spacing, List<ProductReviewTileElement> elementOrder, FluxTextStyleConfig? userNameStyleConfig, FluxTextStyleConfig? reviewTextStyleConfig, FluxImageStyleConfig? imageStyleConfig, FluxImageStyleConfig? avatarStyleConfig, FluxRatingStyleConfig ratingStyleConfig
});


@override $FluxCardConfigCopyWith<$Res> get cardConfig;@override $FluxTextStyleConfigCopyWith<$Res>? get userNameStyleConfig;@override $FluxTextStyleConfigCopyWith<$Res>? get reviewTextStyleConfig;@override $FluxImageStyleConfigCopyWith<$Res>? get imageStyleConfig;@override $FluxImageStyleConfigCopyWith<$Res>? get avatarStyleConfig;@override $FluxRatingStyleConfigCopyWith<$Res> get ratingStyleConfig;

}
/// @nodoc
class __$TestimonialStyleCopyWithImpl<$Res>
    implements _$TestimonialStyleCopyWith<$Res> {
  __$TestimonialStyleCopyWithImpl(this._self, this._then);

  final _TestimonialStyle _self;
  final $Res Function(_TestimonialStyle) _then;

/// Create a copy of TestimonialStyle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cardConfig = null,Object? spacing = null,Object? elementOrder = null,Object? userNameStyleConfig = freezed,Object? reviewTextStyleConfig = freezed,Object? imageStyleConfig = freezed,Object? avatarStyleConfig = freezed,Object? ratingStyleConfig = null,}) {
  return _then(_TestimonialStyle(
cardConfig: null == cardConfig ? _self.cardConfig : cardConfig // ignore: cast_nullable_to_non_nullable
as FluxCardConfig,spacing: null == spacing ? _self.spacing : spacing // ignore: cast_nullable_to_non_nullable
as double,elementOrder: null == elementOrder ? _self._elementOrder : elementOrder // ignore: cast_nullable_to_non_nullable
as List<ProductReviewTileElement>,userNameStyleConfig: freezed == userNameStyleConfig ? _self.userNameStyleConfig : userNameStyleConfig // ignore: cast_nullable_to_non_nullable
as FluxTextStyleConfig?,reviewTextStyleConfig: freezed == reviewTextStyleConfig ? _self.reviewTextStyleConfig : reviewTextStyleConfig // ignore: cast_nullable_to_non_nullable
as FluxTextStyleConfig?,imageStyleConfig: freezed == imageStyleConfig ? _self.imageStyleConfig : imageStyleConfig // ignore: cast_nullable_to_non_nullable
as FluxImageStyleConfig?,avatarStyleConfig: freezed == avatarStyleConfig ? _self.avatarStyleConfig : avatarStyleConfig // ignore: cast_nullable_to_non_nullable
as FluxImageStyleConfig?,ratingStyleConfig: null == ratingStyleConfig ? _self.ratingStyleConfig : ratingStyleConfig // ignore: cast_nullable_to_non_nullable
as FluxRatingStyleConfig,
  ));
}

/// Create a copy of TestimonialStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxCardConfigCopyWith<$Res> get cardConfig {
  
  return $FluxCardConfigCopyWith<$Res>(_self.cardConfig, (value) {
    return _then(_self.copyWith(cardConfig: value));
  });
}/// Create a copy of TestimonialStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxTextStyleConfigCopyWith<$Res>? get userNameStyleConfig {
    if (_self.userNameStyleConfig == null) {
    return null;
  }

  return $FluxTextStyleConfigCopyWith<$Res>(_self.userNameStyleConfig!, (value) {
    return _then(_self.copyWith(userNameStyleConfig: value));
  });
}/// Create a copy of TestimonialStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxTextStyleConfigCopyWith<$Res>? get reviewTextStyleConfig {
    if (_self.reviewTextStyleConfig == null) {
    return null;
  }

  return $FluxTextStyleConfigCopyWith<$Res>(_self.reviewTextStyleConfig!, (value) {
    return _then(_self.copyWith(reviewTextStyleConfig: value));
  });
}/// Create a copy of TestimonialStyle
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
}/// Create a copy of TestimonialStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxImageStyleConfigCopyWith<$Res>? get avatarStyleConfig {
    if (_self.avatarStyleConfig == null) {
    return null;
  }

  return $FluxImageStyleConfigCopyWith<$Res>(_self.avatarStyleConfig!, (value) {
    return _then(_self.copyWith(avatarStyleConfig: value));
  });
}/// Create a copy of TestimonialStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxRatingStyleConfigCopyWith<$Res> get ratingStyleConfig {
  
  return $FluxRatingStyleConfigCopyWith<$Res>(_self.ratingStyleConfig, (value) {
    return _then(_self.copyWith(ratingStyleConfig: value));
  });
}
}


/// @nodoc
mixin _$ProductReviewTileConfig implements DiagnosticableTreeMixin {

 String? get id; String? get imageUrl; String? get reviewText; UserTileConfig? get userTile; TestimonialStyle? get style;
/// Create a copy of ProductReviewTileConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductReviewTileConfigCopyWith<ProductReviewTileConfig> get copyWith => _$ProductReviewTileConfigCopyWithImpl<ProductReviewTileConfig>(this as ProductReviewTileConfig, _$identity);

  /// Serializes this ProductReviewTileConfig to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProductReviewTileConfig'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('imageUrl', imageUrl))..add(DiagnosticsProperty('reviewText', reviewText))..add(DiagnosticsProperty('userTile', userTile))..add(DiagnosticsProperty('style', style));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductReviewTileConfig&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.reviewText, reviewText) || other.reviewText == reviewText)&&(identical(other.userTile, userTile) || other.userTile == userTile)&&(identical(other.style, style) || other.style == style));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,imageUrl,reviewText,userTile,style);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProductReviewTileConfig(id: $id, imageUrl: $imageUrl, reviewText: $reviewText, userTile: $userTile, style: $style)';
}


}

/// @nodoc
abstract mixin class $ProductReviewTileConfigCopyWith<$Res>  {
  factory $ProductReviewTileConfigCopyWith(ProductReviewTileConfig value, $Res Function(ProductReviewTileConfig) _then) = _$ProductReviewTileConfigCopyWithImpl;
@useResult
$Res call({
 String? id, String? imageUrl, String? reviewText, UserTileConfig? userTile, TestimonialStyle? style
});


$UserTileConfigCopyWith<$Res>? get userTile;$TestimonialStyleCopyWith<$Res>? get style;

}
/// @nodoc
class _$ProductReviewTileConfigCopyWithImpl<$Res>
    implements $ProductReviewTileConfigCopyWith<$Res> {
  _$ProductReviewTileConfigCopyWithImpl(this._self, this._then);

  final ProductReviewTileConfig _self;
  final $Res Function(ProductReviewTileConfig) _then;

/// Create a copy of ProductReviewTileConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? imageUrl = freezed,Object? reviewText = freezed,Object? userTile = freezed,Object? style = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,reviewText: freezed == reviewText ? _self.reviewText : reviewText // ignore: cast_nullable_to_non_nullable
as String?,userTile: freezed == userTile ? _self.userTile : userTile // ignore: cast_nullable_to_non_nullable
as UserTileConfig?,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as TestimonialStyle?,
  ));
}
/// Create a copy of ProductReviewTileConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserTileConfigCopyWith<$Res>? get userTile {
    if (_self.userTile == null) {
    return null;
  }

  return $UserTileConfigCopyWith<$Res>(_self.userTile!, (value) {
    return _then(_self.copyWith(userTile: value));
  });
}/// Create a copy of ProductReviewTileConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TestimonialStyleCopyWith<$Res>? get style {
    if (_self.style == null) {
    return null;
  }

  return $TestimonialStyleCopyWith<$Res>(_self.style!, (value) {
    return _then(_self.copyWith(style: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductReviewTileConfig].
extension ProductReviewTileConfigPatterns on ProductReviewTileConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductReviewTileConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductReviewTileConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductReviewTileConfig value)  $default,){
final _that = this;
switch (_that) {
case _ProductReviewTileConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductReviewTileConfig value)?  $default,){
final _that = this;
switch (_that) {
case _ProductReviewTileConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? imageUrl,  String? reviewText,  UserTileConfig? userTile,  TestimonialStyle? style)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductReviewTileConfig() when $default != null:
return $default(_that.id,_that.imageUrl,_that.reviewText,_that.userTile,_that.style);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? imageUrl,  String? reviewText,  UserTileConfig? userTile,  TestimonialStyle? style)  $default,) {final _that = this;
switch (_that) {
case _ProductReviewTileConfig():
return $default(_that.id,_that.imageUrl,_that.reviewText,_that.userTile,_that.style);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? imageUrl,  String? reviewText,  UserTileConfig? userTile,  TestimonialStyle? style)?  $default,) {final _that = this;
switch (_that) {
case _ProductReviewTileConfig() when $default != null:
return $default(_that.id,_that.imageUrl,_that.reviewText,_that.userTile,_that.style);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductReviewTileConfig extends ProductReviewTileConfig with DiagnosticableTreeMixin {
  const _ProductReviewTileConfig({this.id, this.imageUrl, this.reviewText, this.userTile, this.style}): super._();
  factory _ProductReviewTileConfig.fromJson(Map<String, dynamic> json) => _$ProductReviewTileConfigFromJson(json);

@override final  String? id;
@override final  String? imageUrl;
@override final  String? reviewText;
@override final  UserTileConfig? userTile;
@override final  TestimonialStyle? style;

/// Create a copy of ProductReviewTileConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductReviewTileConfigCopyWith<_ProductReviewTileConfig> get copyWith => __$ProductReviewTileConfigCopyWithImpl<_ProductReviewTileConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductReviewTileConfigToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProductReviewTileConfig'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('imageUrl', imageUrl))..add(DiagnosticsProperty('reviewText', reviewText))..add(DiagnosticsProperty('userTile', userTile))..add(DiagnosticsProperty('style', style));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductReviewTileConfig&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.reviewText, reviewText) || other.reviewText == reviewText)&&(identical(other.userTile, userTile) || other.userTile == userTile)&&(identical(other.style, style) || other.style == style));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,imageUrl,reviewText,userTile,style);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProductReviewTileConfig(id: $id, imageUrl: $imageUrl, reviewText: $reviewText, userTile: $userTile, style: $style)';
}


}

/// @nodoc
abstract mixin class _$ProductReviewTileConfigCopyWith<$Res> implements $ProductReviewTileConfigCopyWith<$Res> {
  factory _$ProductReviewTileConfigCopyWith(_ProductReviewTileConfig value, $Res Function(_ProductReviewTileConfig) _then) = __$ProductReviewTileConfigCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? imageUrl, String? reviewText, UserTileConfig? userTile, TestimonialStyle? style
});


@override $UserTileConfigCopyWith<$Res>? get userTile;@override $TestimonialStyleCopyWith<$Res>? get style;

}
/// @nodoc
class __$ProductReviewTileConfigCopyWithImpl<$Res>
    implements _$ProductReviewTileConfigCopyWith<$Res> {
  __$ProductReviewTileConfigCopyWithImpl(this._self, this._then);

  final _ProductReviewTileConfig _self;
  final $Res Function(_ProductReviewTileConfig) _then;

/// Create a copy of ProductReviewTileConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? imageUrl = freezed,Object? reviewText = freezed,Object? userTile = freezed,Object? style = freezed,}) {
  return _then(_ProductReviewTileConfig(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,reviewText: freezed == reviewText ? _self.reviewText : reviewText // ignore: cast_nullable_to_non_nullable
as String?,userTile: freezed == userTile ? _self.userTile : userTile // ignore: cast_nullable_to_non_nullable
as UserTileConfig?,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as TestimonialStyle?,
  ));
}

/// Create a copy of ProductReviewTileConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserTileConfigCopyWith<$Res>? get userTile {
    if (_self.userTile == null) {
    return null;
  }

  return $UserTileConfigCopyWith<$Res>(_self.userTile!, (value) {
    return _then(_self.copyWith(userTile: value));
  });
}/// Create a copy of ProductReviewTileConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TestimonialStyleCopyWith<$Res>? get style {
    if (_self.style == null) {
    return null;
  }

  return $TestimonialStyleCopyWith<$Res>(_self.style!, (value) {
    return _then(_self.copyWith(style: value));
  });
}
}

// dart format on
