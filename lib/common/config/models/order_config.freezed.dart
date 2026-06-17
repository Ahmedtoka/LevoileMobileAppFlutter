// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderConfig implements DiagnosticableTreeMixin {

 int get version; bool get enableReorder;
/// Create a copy of OrderConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderConfigCopyWith<OrderConfig> get copyWith => _$OrderConfigCopyWithImpl<OrderConfig>(this as OrderConfig, _$identity);

  /// Serializes this OrderConfig to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'OrderConfig'))
    ..add(DiagnosticsProperty('version', version))..add(DiagnosticsProperty('enableReorder', enableReorder));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderConfig&&(identical(other.version, version) || other.version == version)&&(identical(other.enableReorder, enableReorder) || other.enableReorder == enableReorder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,enableReorder);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'OrderConfig(version: $version, enableReorder: $enableReorder)';
}


}

/// @nodoc
abstract mixin class $OrderConfigCopyWith<$Res>  {
  factory $OrderConfigCopyWith(OrderConfig value, $Res Function(OrderConfig) _then) = _$OrderConfigCopyWithImpl;
@useResult
$Res call({
 int version, bool enableReorder
});




}
/// @nodoc
class _$OrderConfigCopyWithImpl<$Res>
    implements $OrderConfigCopyWith<$Res> {
  _$OrderConfigCopyWithImpl(this._self, this._then);

  final OrderConfig _self;
  final $Res Function(OrderConfig) _then;

/// Create a copy of OrderConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? version = null,Object? enableReorder = null,}) {
  return _then(_self.copyWith(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,enableReorder: null == enableReorder ? _self.enableReorder : enableReorder // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderConfig].
extension OrderConfigPatterns on OrderConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderConfig value)  $default,){
final _that = this;
switch (_that) {
case _OrderConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderConfig value)?  $default,){
final _that = this;
switch (_that) {
case _OrderConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int version,  bool enableReorder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderConfig() when $default != null:
return $default(_that.version,_that.enableReorder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int version,  bool enableReorder)  $default,) {final _that = this;
switch (_that) {
case _OrderConfig():
return $default(_that.version,_that.enableReorder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int version,  bool enableReorder)?  $default,) {final _that = this;
switch (_that) {
case _OrderConfig() when $default != null:
return $default(_that.version,_that.enableReorder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderConfig with DiagnosticableTreeMixin implements OrderConfig {
  const _OrderConfig({this.version = 1, this.enableReorder = true});
  factory _OrderConfig.fromJson(Map<String, dynamic> json) => _$OrderConfigFromJson(json);

@override@JsonKey() final  int version;
@override@JsonKey() final  bool enableReorder;

/// Create a copy of OrderConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderConfigCopyWith<_OrderConfig> get copyWith => __$OrderConfigCopyWithImpl<_OrderConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderConfigToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'OrderConfig'))
    ..add(DiagnosticsProperty('version', version))..add(DiagnosticsProperty('enableReorder', enableReorder));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderConfig&&(identical(other.version, version) || other.version == version)&&(identical(other.enableReorder, enableReorder) || other.enableReorder == enableReorder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,enableReorder);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'OrderConfig(version: $version, enableReorder: $enableReorder)';
}


}

/// @nodoc
abstract mixin class _$OrderConfigCopyWith<$Res> implements $OrderConfigCopyWith<$Res> {
  factory _$OrderConfigCopyWith(_OrderConfig value, $Res Function(_OrderConfig) _then) = __$OrderConfigCopyWithImpl;
@override @useResult
$Res call({
 int version, bool enableReorder
});




}
/// @nodoc
class __$OrderConfigCopyWithImpl<$Res>
    implements _$OrderConfigCopyWith<$Res> {
  __$OrderConfigCopyWithImpl(this._self, this._then);

  final _OrderConfig _self;
  final $Res Function(_OrderConfig) _then;

/// Create a copy of OrderConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = null,Object? enableReorder = null,}) {
  return _then(_OrderConfig(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,enableReorder: null == enableReorder ? _self.enableReorder : enableReorder // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
