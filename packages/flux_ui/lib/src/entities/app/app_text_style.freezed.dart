// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_text_style.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppTextStyle {

 AppColor? get color; AppColor? get backgroundColor; double? get fontSize;@FontWeightConverter() FontWeight? get fontWeight; FontStyle? get fontStyle; double? get letterSpacing; double? get wordSpacing; double? get height;@ShadowsConverter() List<Shadow>? get shadows;@TextDecorationConverter() TextDecoration? get decoration; AppColor? get decorationColor; TextDecorationStyle? get decorationStyle; double? get decorationThickness; String? get fontFamily; TextOverflow? get overflow;
/// Create a copy of AppTextStyle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppTextStyleCopyWith<AppTextStyle> get copyWith => _$AppTextStyleCopyWithImpl<AppTextStyle>(this as AppTextStyle, _$identity);

  /// Serializes this AppTextStyle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppTextStyle&&(identical(other.color, color) || other.color == color)&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor)&&(identical(other.fontSize, fontSize) || other.fontSize == fontSize)&&(identical(other.fontWeight, fontWeight) || other.fontWeight == fontWeight)&&(identical(other.fontStyle, fontStyle) || other.fontStyle == fontStyle)&&(identical(other.letterSpacing, letterSpacing) || other.letterSpacing == letterSpacing)&&(identical(other.wordSpacing, wordSpacing) || other.wordSpacing == wordSpacing)&&(identical(other.height, height) || other.height == height)&&const DeepCollectionEquality().equals(other.shadows, shadows)&&(identical(other.decoration, decoration) || other.decoration == decoration)&&(identical(other.decorationColor, decorationColor) || other.decorationColor == decorationColor)&&(identical(other.decorationStyle, decorationStyle) || other.decorationStyle == decorationStyle)&&(identical(other.decorationThickness, decorationThickness) || other.decorationThickness == decorationThickness)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&(identical(other.overflow, overflow) || other.overflow == overflow));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,color,backgroundColor,fontSize,fontWeight,fontStyle,letterSpacing,wordSpacing,height,const DeepCollectionEquality().hash(shadows),decoration,decorationColor,decorationStyle,decorationThickness,fontFamily,overflow);

@override
String toString() {
  return 'AppTextStyle(color: $color, backgroundColor: $backgroundColor, fontSize: $fontSize, fontWeight: $fontWeight, fontStyle: $fontStyle, letterSpacing: $letterSpacing, wordSpacing: $wordSpacing, height: $height, shadows: $shadows, decoration: $decoration, decorationColor: $decorationColor, decorationStyle: $decorationStyle, decorationThickness: $decorationThickness, fontFamily: $fontFamily, overflow: $overflow)';
}


}

/// @nodoc
abstract mixin class $AppTextStyleCopyWith<$Res>  {
  factory $AppTextStyleCopyWith(AppTextStyle value, $Res Function(AppTextStyle) _then) = _$AppTextStyleCopyWithImpl;
@useResult
$Res call({
 AppColor? color, AppColor? backgroundColor, double? fontSize,@FontWeightConverter() FontWeight? fontWeight, FontStyle? fontStyle, double? letterSpacing, double? wordSpacing, double? height,@ShadowsConverter() List<Shadow>? shadows,@TextDecorationConverter() TextDecoration? decoration, AppColor? decorationColor, TextDecorationStyle? decorationStyle, double? decorationThickness, String? fontFamily, TextOverflow? overflow
});


$AppColorCopyWith<$Res>? get color;$AppColorCopyWith<$Res>? get backgroundColor;$AppColorCopyWith<$Res>? get decorationColor;

}
/// @nodoc
class _$AppTextStyleCopyWithImpl<$Res>
    implements $AppTextStyleCopyWith<$Res> {
  _$AppTextStyleCopyWithImpl(this._self, this._then);

  final AppTextStyle _self;
  final $Res Function(AppTextStyle) _then;

/// Create a copy of AppTextStyle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? color = freezed,Object? backgroundColor = freezed,Object? fontSize = freezed,Object? fontWeight = freezed,Object? fontStyle = freezed,Object? letterSpacing = freezed,Object? wordSpacing = freezed,Object? height = freezed,Object? shadows = freezed,Object? decoration = freezed,Object? decorationColor = freezed,Object? decorationStyle = freezed,Object? decorationThickness = freezed,Object? fontFamily = freezed,Object? overflow = freezed,}) {
  return _then(_self.copyWith(
color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as AppColor?,backgroundColor: freezed == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as AppColor?,fontSize: freezed == fontSize ? _self.fontSize : fontSize // ignore: cast_nullable_to_non_nullable
as double?,fontWeight: freezed == fontWeight ? _self.fontWeight : fontWeight // ignore: cast_nullable_to_non_nullable
as FontWeight?,fontStyle: freezed == fontStyle ? _self.fontStyle : fontStyle // ignore: cast_nullable_to_non_nullable
as FontStyle?,letterSpacing: freezed == letterSpacing ? _self.letterSpacing : letterSpacing // ignore: cast_nullable_to_non_nullable
as double?,wordSpacing: freezed == wordSpacing ? _self.wordSpacing : wordSpacing // ignore: cast_nullable_to_non_nullable
as double?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,shadows: freezed == shadows ? _self.shadows : shadows // ignore: cast_nullable_to_non_nullable
as List<Shadow>?,decoration: freezed == decoration ? _self.decoration : decoration // ignore: cast_nullable_to_non_nullable
as TextDecoration?,decorationColor: freezed == decorationColor ? _self.decorationColor : decorationColor // ignore: cast_nullable_to_non_nullable
as AppColor?,decorationStyle: freezed == decorationStyle ? _self.decorationStyle : decorationStyle // ignore: cast_nullable_to_non_nullable
as TextDecorationStyle?,decorationThickness: freezed == decorationThickness ? _self.decorationThickness : decorationThickness // ignore: cast_nullable_to_non_nullable
as double?,fontFamily: freezed == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String?,overflow: freezed == overflow ? _self.overflow : overflow // ignore: cast_nullable_to_non_nullable
as TextOverflow?,
  ));
}
/// Create a copy of AppTextStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppColorCopyWith<$Res>? get color {
    if (_self.color == null) {
    return null;
  }

  return $AppColorCopyWith<$Res>(_self.color!, (value) {
    return _then(_self.copyWith(color: value));
  });
}/// Create a copy of AppTextStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppColorCopyWith<$Res>? get backgroundColor {
    if (_self.backgroundColor == null) {
    return null;
  }

  return $AppColorCopyWith<$Res>(_self.backgroundColor!, (value) {
    return _then(_self.copyWith(backgroundColor: value));
  });
}/// Create a copy of AppTextStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppColorCopyWith<$Res>? get decorationColor {
    if (_self.decorationColor == null) {
    return null;
  }

  return $AppColorCopyWith<$Res>(_self.decorationColor!, (value) {
    return _then(_self.copyWith(decorationColor: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppTextStyle].
extension AppTextStylePatterns on AppTextStyle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppTextStyle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppTextStyle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppTextStyle value)  $default,){
final _that = this;
switch (_that) {
case _AppTextStyle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppTextStyle value)?  $default,){
final _that = this;
switch (_that) {
case _AppTextStyle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AppColor? color,  AppColor? backgroundColor,  double? fontSize, @FontWeightConverter()  FontWeight? fontWeight,  FontStyle? fontStyle,  double? letterSpacing,  double? wordSpacing,  double? height, @ShadowsConverter()  List<Shadow>? shadows, @TextDecorationConverter()  TextDecoration? decoration,  AppColor? decorationColor,  TextDecorationStyle? decorationStyle,  double? decorationThickness,  String? fontFamily,  TextOverflow? overflow)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppTextStyle() when $default != null:
return $default(_that.color,_that.backgroundColor,_that.fontSize,_that.fontWeight,_that.fontStyle,_that.letterSpacing,_that.wordSpacing,_that.height,_that.shadows,_that.decoration,_that.decorationColor,_that.decorationStyle,_that.decorationThickness,_that.fontFamily,_that.overflow);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AppColor? color,  AppColor? backgroundColor,  double? fontSize, @FontWeightConverter()  FontWeight? fontWeight,  FontStyle? fontStyle,  double? letterSpacing,  double? wordSpacing,  double? height, @ShadowsConverter()  List<Shadow>? shadows, @TextDecorationConverter()  TextDecoration? decoration,  AppColor? decorationColor,  TextDecorationStyle? decorationStyle,  double? decorationThickness,  String? fontFamily,  TextOverflow? overflow)  $default,) {final _that = this;
switch (_that) {
case _AppTextStyle():
return $default(_that.color,_that.backgroundColor,_that.fontSize,_that.fontWeight,_that.fontStyle,_that.letterSpacing,_that.wordSpacing,_that.height,_that.shadows,_that.decoration,_that.decorationColor,_that.decorationStyle,_that.decorationThickness,_that.fontFamily,_that.overflow);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AppColor? color,  AppColor? backgroundColor,  double? fontSize, @FontWeightConverter()  FontWeight? fontWeight,  FontStyle? fontStyle,  double? letterSpacing,  double? wordSpacing,  double? height, @ShadowsConverter()  List<Shadow>? shadows, @TextDecorationConverter()  TextDecoration? decoration,  AppColor? decorationColor,  TextDecorationStyle? decorationStyle,  double? decorationThickness,  String? fontFamily,  TextOverflow? overflow)?  $default,) {final _that = this;
switch (_that) {
case _AppTextStyle() when $default != null:
return $default(_that.color,_that.backgroundColor,_that.fontSize,_that.fontWeight,_that.fontStyle,_that.letterSpacing,_that.wordSpacing,_that.height,_that.shadows,_that.decoration,_that.decorationColor,_that.decorationStyle,_that.decorationThickness,_that.fontFamily,_that.overflow);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppTextStyle extends AppTextStyle {
  const _AppTextStyle({this.color, this.backgroundColor, this.fontSize, @FontWeightConverter() this.fontWeight, this.fontStyle, this.letterSpacing, this.wordSpacing, this.height, @ShadowsConverter() final  List<Shadow>? shadows, @TextDecorationConverter() this.decoration, this.decorationColor, this.decorationStyle, this.decorationThickness, this.fontFamily, this.overflow}): _shadows = shadows,super._();
  factory _AppTextStyle.fromJson(Map<String, dynamic> json) => _$AppTextStyleFromJson(json);

@override final  AppColor? color;
@override final  AppColor? backgroundColor;
@override final  double? fontSize;
@override@FontWeightConverter() final  FontWeight? fontWeight;
@override final  FontStyle? fontStyle;
@override final  double? letterSpacing;
@override final  double? wordSpacing;
@override final  double? height;
 final  List<Shadow>? _shadows;
@override@ShadowsConverter() List<Shadow>? get shadows {
  final value = _shadows;
  if (value == null) return null;
  if (_shadows is EqualUnmodifiableListView) return _shadows;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@TextDecorationConverter() final  TextDecoration? decoration;
@override final  AppColor? decorationColor;
@override final  TextDecorationStyle? decorationStyle;
@override final  double? decorationThickness;
@override final  String? fontFamily;
@override final  TextOverflow? overflow;

/// Create a copy of AppTextStyle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppTextStyleCopyWith<_AppTextStyle> get copyWith => __$AppTextStyleCopyWithImpl<_AppTextStyle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppTextStyleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppTextStyle&&(identical(other.color, color) || other.color == color)&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor)&&(identical(other.fontSize, fontSize) || other.fontSize == fontSize)&&(identical(other.fontWeight, fontWeight) || other.fontWeight == fontWeight)&&(identical(other.fontStyle, fontStyle) || other.fontStyle == fontStyle)&&(identical(other.letterSpacing, letterSpacing) || other.letterSpacing == letterSpacing)&&(identical(other.wordSpacing, wordSpacing) || other.wordSpacing == wordSpacing)&&(identical(other.height, height) || other.height == height)&&const DeepCollectionEquality().equals(other._shadows, _shadows)&&(identical(other.decoration, decoration) || other.decoration == decoration)&&(identical(other.decorationColor, decorationColor) || other.decorationColor == decorationColor)&&(identical(other.decorationStyle, decorationStyle) || other.decorationStyle == decorationStyle)&&(identical(other.decorationThickness, decorationThickness) || other.decorationThickness == decorationThickness)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&(identical(other.overflow, overflow) || other.overflow == overflow));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,color,backgroundColor,fontSize,fontWeight,fontStyle,letterSpacing,wordSpacing,height,const DeepCollectionEquality().hash(_shadows),decoration,decorationColor,decorationStyle,decorationThickness,fontFamily,overflow);

@override
String toString() {
  return 'AppTextStyle(color: $color, backgroundColor: $backgroundColor, fontSize: $fontSize, fontWeight: $fontWeight, fontStyle: $fontStyle, letterSpacing: $letterSpacing, wordSpacing: $wordSpacing, height: $height, shadows: $shadows, decoration: $decoration, decorationColor: $decorationColor, decorationStyle: $decorationStyle, decorationThickness: $decorationThickness, fontFamily: $fontFamily, overflow: $overflow)';
}


}

/// @nodoc
abstract mixin class _$AppTextStyleCopyWith<$Res> implements $AppTextStyleCopyWith<$Res> {
  factory _$AppTextStyleCopyWith(_AppTextStyle value, $Res Function(_AppTextStyle) _then) = __$AppTextStyleCopyWithImpl;
@override @useResult
$Res call({
 AppColor? color, AppColor? backgroundColor, double? fontSize,@FontWeightConverter() FontWeight? fontWeight, FontStyle? fontStyle, double? letterSpacing, double? wordSpacing, double? height,@ShadowsConverter() List<Shadow>? shadows,@TextDecorationConverter() TextDecoration? decoration, AppColor? decorationColor, TextDecorationStyle? decorationStyle, double? decorationThickness, String? fontFamily, TextOverflow? overflow
});


@override $AppColorCopyWith<$Res>? get color;@override $AppColorCopyWith<$Res>? get backgroundColor;@override $AppColorCopyWith<$Res>? get decorationColor;

}
/// @nodoc
class __$AppTextStyleCopyWithImpl<$Res>
    implements _$AppTextStyleCopyWith<$Res> {
  __$AppTextStyleCopyWithImpl(this._self, this._then);

  final _AppTextStyle _self;
  final $Res Function(_AppTextStyle) _then;

/// Create a copy of AppTextStyle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? color = freezed,Object? backgroundColor = freezed,Object? fontSize = freezed,Object? fontWeight = freezed,Object? fontStyle = freezed,Object? letterSpacing = freezed,Object? wordSpacing = freezed,Object? height = freezed,Object? shadows = freezed,Object? decoration = freezed,Object? decorationColor = freezed,Object? decorationStyle = freezed,Object? decorationThickness = freezed,Object? fontFamily = freezed,Object? overflow = freezed,}) {
  return _then(_AppTextStyle(
color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as AppColor?,backgroundColor: freezed == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as AppColor?,fontSize: freezed == fontSize ? _self.fontSize : fontSize // ignore: cast_nullable_to_non_nullable
as double?,fontWeight: freezed == fontWeight ? _self.fontWeight : fontWeight // ignore: cast_nullable_to_non_nullable
as FontWeight?,fontStyle: freezed == fontStyle ? _self.fontStyle : fontStyle // ignore: cast_nullable_to_non_nullable
as FontStyle?,letterSpacing: freezed == letterSpacing ? _self.letterSpacing : letterSpacing // ignore: cast_nullable_to_non_nullable
as double?,wordSpacing: freezed == wordSpacing ? _self.wordSpacing : wordSpacing // ignore: cast_nullable_to_non_nullable
as double?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,shadows: freezed == shadows ? _self._shadows : shadows // ignore: cast_nullable_to_non_nullable
as List<Shadow>?,decoration: freezed == decoration ? _self.decoration : decoration // ignore: cast_nullable_to_non_nullable
as TextDecoration?,decorationColor: freezed == decorationColor ? _self.decorationColor : decorationColor // ignore: cast_nullable_to_non_nullable
as AppColor?,decorationStyle: freezed == decorationStyle ? _self.decorationStyle : decorationStyle // ignore: cast_nullable_to_non_nullable
as TextDecorationStyle?,decorationThickness: freezed == decorationThickness ? _self.decorationThickness : decorationThickness // ignore: cast_nullable_to_non_nullable
as double?,fontFamily: freezed == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String?,overflow: freezed == overflow ? _self.overflow : overflow // ignore: cast_nullable_to_non_nullable
as TextOverflow?,
  ));
}

/// Create a copy of AppTextStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppColorCopyWith<$Res>? get color {
    if (_self.color == null) {
    return null;
  }

  return $AppColorCopyWith<$Res>(_self.color!, (value) {
    return _then(_self.copyWith(color: value));
  });
}/// Create a copy of AppTextStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppColorCopyWith<$Res>? get backgroundColor {
    if (_self.backgroundColor == null) {
    return null;
  }

  return $AppColorCopyWith<$Res>(_self.backgroundColor!, (value) {
    return _then(_self.copyWith(backgroundColor: value));
  });
}/// Create a copy of AppTextStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppColorCopyWith<$Res>? get decorationColor {
    if (_self.decorationColor == null) {
    return null;
  }

  return $AppColorCopyWith<$Res>(_self.decorationColor!, (value) {
    return _then(_self.copyWith(decorationColor: value));
  });
}
}

// dart format on
