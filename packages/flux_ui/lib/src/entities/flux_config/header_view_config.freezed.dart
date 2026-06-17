// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'header_view_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HeaderViewConfig {

@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? get margin;@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? get padding; String get title; String? get actionTitle; Map<String, dynamic>? get action;@DateTimeConverter() DateTime? get datetimeCountdown;
/// Create a copy of HeaderViewConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HeaderViewConfigCopyWith<HeaderViewConfig> get copyWith => _$HeaderViewConfigCopyWithImpl<HeaderViewConfig>(this as HeaderViewConfig, _$identity);

  /// Serializes this HeaderViewConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HeaderViewConfig&&(identical(other.margin, margin) || other.margin == margin)&&(identical(other.padding, padding) || other.padding == padding)&&(identical(other.title, title) || other.title == title)&&(identical(other.actionTitle, actionTitle) || other.actionTitle == actionTitle)&&const DeepCollectionEquality().equals(other.action, action)&&(identical(other.datetimeCountdown, datetimeCountdown) || other.datetimeCountdown == datetimeCountdown));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,margin,padding,title,actionTitle,const DeepCollectionEquality().hash(action),datetimeCountdown);

@override
String toString() {
  return 'HeaderViewConfig(margin: $margin, padding: $padding, title: $title, actionTitle: $actionTitle, action: $action, datetimeCountdown: $datetimeCountdown)';
}


}

/// @nodoc
abstract mixin class $HeaderViewConfigCopyWith<$Res>  {
  factory $HeaderViewConfigCopyWith(HeaderViewConfig value, $Res Function(HeaderViewConfig) _then) = _$HeaderViewConfigCopyWithImpl;
@useResult
$Res call({
@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? margin,@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? padding, String title, String? actionTitle, Map<String, dynamic>? action,@DateTimeConverter() DateTime? datetimeCountdown
});




}
/// @nodoc
class _$HeaderViewConfigCopyWithImpl<$Res>
    implements $HeaderViewConfigCopyWith<$Res> {
  _$HeaderViewConfigCopyWithImpl(this._self, this._then);

  final HeaderViewConfig _self;
  final $Res Function(HeaderViewConfig) _then;

/// Create a copy of HeaderViewConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? margin = freezed,Object? padding = freezed,Object? title = null,Object? actionTitle = freezed,Object? action = freezed,Object? datetimeCountdown = freezed,}) {
  return _then(_self.copyWith(
margin: freezed == margin ? _self.margin : margin // ignore: cast_nullable_to_non_nullable
as EdgeInsetsDirectional?,padding: freezed == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as EdgeInsetsDirectional?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,actionTitle: freezed == actionTitle ? _self.actionTitle : actionTitle // ignore: cast_nullable_to_non_nullable
as String?,action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,datetimeCountdown: freezed == datetimeCountdown ? _self.datetimeCountdown : datetimeCountdown // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [HeaderViewConfig].
extension HeaderViewConfigPatterns on HeaderViewConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HeaderViewConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HeaderViewConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HeaderViewConfig value)  $default,){
final _that = this;
switch (_that) {
case _HeaderViewConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HeaderViewConfig value)?  $default,){
final _that = this;
switch (_that) {
case _HeaderViewConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? margin, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? padding,  String title,  String? actionTitle,  Map<String, dynamic>? action, @DateTimeConverter()  DateTime? datetimeCountdown)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HeaderViewConfig() when $default != null:
return $default(_that.margin,_that.padding,_that.title,_that.actionTitle,_that.action,_that.datetimeCountdown);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? margin, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? padding,  String title,  String? actionTitle,  Map<String, dynamic>? action, @DateTimeConverter()  DateTime? datetimeCountdown)  $default,) {final _that = this;
switch (_that) {
case _HeaderViewConfig():
return $default(_that.margin,_that.padding,_that.title,_that.actionTitle,_that.action,_that.datetimeCountdown);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? margin, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? padding,  String title,  String? actionTitle,  Map<String, dynamic>? action, @DateTimeConverter()  DateTime? datetimeCountdown)?  $default,) {final _that = this;
switch (_that) {
case _HeaderViewConfig() when $default != null:
return $default(_that.margin,_that.padding,_that.title,_that.actionTitle,_that.action,_that.datetimeCountdown);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HeaderViewConfig implements HeaderViewConfig {
  const _HeaderViewConfig({@EdgeInsetsDirectionalConverter() this.margin, @EdgeInsetsDirectionalConverter() this.padding, required this.title, this.actionTitle, final  Map<String, dynamic>? action, @DateTimeConverter() this.datetimeCountdown}): _action = action;
  factory _HeaderViewConfig.fromJson(Map<String, dynamic> json) => _$HeaderViewConfigFromJson(json);

@override@EdgeInsetsDirectionalConverter() final  EdgeInsetsDirectional? margin;
@override@EdgeInsetsDirectionalConverter() final  EdgeInsetsDirectional? padding;
@override final  String title;
@override final  String? actionTitle;
 final  Map<String, dynamic>? _action;
@override Map<String, dynamic>? get action {
  final value = _action;
  if (value == null) return null;
  if (_action is EqualUnmodifiableMapView) return _action;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@DateTimeConverter() final  DateTime? datetimeCountdown;

/// Create a copy of HeaderViewConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HeaderViewConfigCopyWith<_HeaderViewConfig> get copyWith => __$HeaderViewConfigCopyWithImpl<_HeaderViewConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HeaderViewConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HeaderViewConfig&&(identical(other.margin, margin) || other.margin == margin)&&(identical(other.padding, padding) || other.padding == padding)&&(identical(other.title, title) || other.title == title)&&(identical(other.actionTitle, actionTitle) || other.actionTitle == actionTitle)&&const DeepCollectionEquality().equals(other._action, _action)&&(identical(other.datetimeCountdown, datetimeCountdown) || other.datetimeCountdown == datetimeCountdown));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,margin,padding,title,actionTitle,const DeepCollectionEquality().hash(_action),datetimeCountdown);

@override
String toString() {
  return 'HeaderViewConfig(margin: $margin, padding: $padding, title: $title, actionTitle: $actionTitle, action: $action, datetimeCountdown: $datetimeCountdown)';
}


}

/// @nodoc
abstract mixin class _$HeaderViewConfigCopyWith<$Res> implements $HeaderViewConfigCopyWith<$Res> {
  factory _$HeaderViewConfigCopyWith(_HeaderViewConfig value, $Res Function(_HeaderViewConfig) _then) = __$HeaderViewConfigCopyWithImpl;
@override @useResult
$Res call({
@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? margin,@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? padding, String title, String? actionTitle, Map<String, dynamic>? action,@DateTimeConverter() DateTime? datetimeCountdown
});




}
/// @nodoc
class __$HeaderViewConfigCopyWithImpl<$Res>
    implements _$HeaderViewConfigCopyWith<$Res> {
  __$HeaderViewConfigCopyWithImpl(this._self, this._then);

  final _HeaderViewConfig _self;
  final $Res Function(_HeaderViewConfig) _then;

/// Create a copy of HeaderViewConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? margin = freezed,Object? padding = freezed,Object? title = null,Object? actionTitle = freezed,Object? action = freezed,Object? datetimeCountdown = freezed,}) {
  return _then(_HeaderViewConfig(
margin: freezed == margin ? _self.margin : margin // ignore: cast_nullable_to_non_nullable
as EdgeInsetsDirectional?,padding: freezed == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as EdgeInsetsDirectional?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,actionTitle: freezed == actionTitle ? _self.actionTitle : actionTitle // ignore: cast_nullable_to_non_nullable
as String?,action: freezed == action ? _self._action : action // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,datetimeCountdown: freezed == datetimeCountdown ? _self.datetimeCountdown : datetimeCountdown // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
