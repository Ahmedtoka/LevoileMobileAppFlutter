// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_color.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
AppColor _$AppColorFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'solid':
          return SolidColor.fromJson(
            json
          );
                case 'theme':
          return ThemeColor.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'AppColor',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$AppColor {



  /// Serializes this AppColor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppColor);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppColor()';
}


}

/// @nodoc
class $AppColorCopyWith<$Res>  {
$AppColorCopyWith(AppColor _, $Res Function(AppColor) __);
}


/// Adds pattern-matching-related methods to [AppColor].
extension AppColorPatterns on AppColor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SolidColor value)?  solid,TResult Function( ThemeColor value)?  theme,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SolidColor() when solid != null:
return solid(_that);case ThemeColor() when theme != null:
return theme(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SolidColor value)  solid,required TResult Function( ThemeColor value)  theme,}){
final _that = this;
switch (_that) {
case SolidColor():
return solid(_that);case ThemeColor():
return theme(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SolidColor value)?  solid,TResult? Function( ThemeColor value)?  theme,}){
final _that = this;
switch (_that) {
case SolidColor() when solid != null:
return solid(_that);case ThemeColor() when theme != null:
return theme(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function(@ColorConverter()  Color? color)?  solid,TResult Function( MaterialColorName materialColorName)?  theme,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SolidColor() when solid != null:
return solid(_that.color);case ThemeColor() when theme != null:
return theme(_that.materialColorName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function(@ColorConverter()  Color? color)  solid,required TResult Function( MaterialColorName materialColorName)  theme,}) {final _that = this;
switch (_that) {
case SolidColor():
return solid(_that.color);case ThemeColor():
return theme(_that.materialColorName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function(@ColorConverter()  Color? color)?  solid,TResult? Function( MaterialColorName materialColorName)?  theme,}) {final _that = this;
switch (_that) {
case SolidColor() when solid != null:
return solid(_that.color);case ThemeColor() when theme != null:
return theme(_that.materialColorName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class SolidColor extends AppColor {
  const SolidColor(@ColorConverter() this.color, {final  String? $type}): $type = $type ?? 'solid',super._();
  factory SolidColor.fromJson(Map<String, dynamic> json) => _$SolidColorFromJson(json);

@ColorConverter() final  Color? color;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of AppColor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SolidColorCopyWith<SolidColor> get copyWith => _$SolidColorCopyWithImpl<SolidColor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SolidColorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SolidColor&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,color);

@override
String toString() {
  return 'AppColor.solid(color: $color)';
}


}

/// @nodoc
abstract mixin class $SolidColorCopyWith<$Res> implements $AppColorCopyWith<$Res> {
  factory $SolidColorCopyWith(SolidColor value, $Res Function(SolidColor) _then) = _$SolidColorCopyWithImpl;
@useResult
$Res call({
@ColorConverter() Color? color
});




}
/// @nodoc
class _$SolidColorCopyWithImpl<$Res>
    implements $SolidColorCopyWith<$Res> {
  _$SolidColorCopyWithImpl(this._self, this._then);

  final SolidColor _self;
  final $Res Function(SolidColor) _then;

/// Create a copy of AppColor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? color = freezed,}) {
  return _then(SolidColor(
freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ThemeColor extends AppColor {
  const ThemeColor(this.materialColorName, {final  String? $type}): $type = $type ?? 'theme',super._();
  factory ThemeColor.fromJson(Map<String, dynamic> json) => _$ThemeColorFromJson(json);

 final  MaterialColorName materialColorName;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of AppColor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThemeColorCopyWith<ThemeColor> get copyWith => _$ThemeColorCopyWithImpl<ThemeColor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ThemeColorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemeColor&&(identical(other.materialColorName, materialColorName) || other.materialColorName == materialColorName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,materialColorName);

@override
String toString() {
  return 'AppColor.theme(materialColorName: $materialColorName)';
}


}

/// @nodoc
abstract mixin class $ThemeColorCopyWith<$Res> implements $AppColorCopyWith<$Res> {
  factory $ThemeColorCopyWith(ThemeColor value, $Res Function(ThemeColor) _then) = _$ThemeColorCopyWithImpl;
@useResult
$Res call({
 MaterialColorName materialColorName
});




}
/// @nodoc
class _$ThemeColorCopyWithImpl<$Res>
    implements $ThemeColorCopyWith<$Res> {
  _$ThemeColorCopyWithImpl(this._self, this._then);

  final ThemeColor _self;
  final $Res Function(ThemeColor) _then;

/// Create a copy of AppColor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? materialColorName = null,}) {
  return _then(ThemeColor(
null == materialColorName ? _self.materialColorName : materialColorName // ignore: cast_nullable_to_non_nullable
as MaterialColorName,
  ));
}


}

// dart format on
