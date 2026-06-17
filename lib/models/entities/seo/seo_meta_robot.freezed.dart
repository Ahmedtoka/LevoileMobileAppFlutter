// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seo_meta_robot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SeoMetaRobot {

@JsonKey(readValue: _readValueRobotsName) SeoRobotsName get name; String get content;
/// Create a copy of SeoMetaRobot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeoMetaRobotCopyWith<SeoMetaRobot> get copyWith => _$SeoMetaRobotCopyWithImpl<SeoMetaRobot>(this as SeoMetaRobot, _$identity);

  /// Serializes this SeoMetaRobot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeoMetaRobot&&(identical(other.name, name) || other.name == name)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,content);

@override
String toString() {
  return 'SeoMetaRobot(name: $name, content: $content)';
}


}

/// @nodoc
abstract mixin class $SeoMetaRobotCopyWith<$Res>  {
  factory $SeoMetaRobotCopyWith(SeoMetaRobot value, $Res Function(SeoMetaRobot) _then) = _$SeoMetaRobotCopyWithImpl;
@useResult
$Res call({
@JsonKey(readValue: _readValueRobotsName) SeoRobotsName name, String content
});




}
/// @nodoc
class _$SeoMetaRobotCopyWithImpl<$Res>
    implements $SeoMetaRobotCopyWith<$Res> {
  _$SeoMetaRobotCopyWithImpl(this._self, this._then);

  final SeoMetaRobot _self;
  final $Res Function(SeoMetaRobot) _then;

/// Create a copy of SeoMetaRobot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? content = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as SeoRobotsName,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SeoMetaRobot].
extension SeoMetaRobotPatterns on SeoMetaRobot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeoMetaRobot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeoMetaRobot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeoMetaRobot value)  $default,){
final _that = this;
switch (_that) {
case _SeoMetaRobot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeoMetaRobot value)?  $default,){
final _that = this;
switch (_that) {
case _SeoMetaRobot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(readValue: _readValueRobotsName)  SeoRobotsName name,  String content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeoMetaRobot() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(readValue: _readValueRobotsName)  SeoRobotsName name,  String content)  $default,) {final _that = this;
switch (_that) {
case _SeoMetaRobot():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(readValue: _readValueRobotsName)  SeoRobotsName name,  String content)?  $default,) {final _that = this;
switch (_that) {
case _SeoMetaRobot() when $default != null:
return $default(_that.name,_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeoMetaRobot extends SeoMetaRobot {
  const _SeoMetaRobot({@JsonKey(readValue: _readValueRobotsName) required this.name, required this.content}): super._();
  factory _SeoMetaRobot.fromJson(Map<String, dynamic> json) => _$SeoMetaRobotFromJson(json);

@override@JsonKey(readValue: _readValueRobotsName) final  SeoRobotsName name;
@override final  String content;

/// Create a copy of SeoMetaRobot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeoMetaRobotCopyWith<_SeoMetaRobot> get copyWith => __$SeoMetaRobotCopyWithImpl<_SeoMetaRobot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeoMetaRobotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeoMetaRobot&&(identical(other.name, name) || other.name == name)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,content);

@override
String toString() {
  return 'SeoMetaRobot(name: $name, content: $content)';
}


}

/// @nodoc
abstract mixin class _$SeoMetaRobotCopyWith<$Res> implements $SeoMetaRobotCopyWith<$Res> {
  factory _$SeoMetaRobotCopyWith(_SeoMetaRobot value, $Res Function(_SeoMetaRobot) _then) = __$SeoMetaRobotCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(readValue: _readValueRobotsName) SeoRobotsName name, String content
});




}
/// @nodoc
class __$SeoMetaRobotCopyWithImpl<$Res>
    implements _$SeoMetaRobotCopyWith<$Res> {
  __$SeoMetaRobotCopyWithImpl(this._self, this._then);

  final _SeoMetaRobot _self;
  final $Res Function(_SeoMetaRobot) _then;

/// Create a copy of SeoMetaRobot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? content = null,}) {
  return _then(_SeoMetaRobot(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as SeoRobotsName,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
