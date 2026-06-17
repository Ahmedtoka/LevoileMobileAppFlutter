// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meta_seo_route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MetaSeoRoute {

 String get route; SeoConfig get config;
/// Create a copy of MetaSeoRoute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetaSeoRouteCopyWith<MetaSeoRoute> get copyWith => _$MetaSeoRouteCopyWithImpl<MetaSeoRoute>(this as MetaSeoRoute, _$identity);

  /// Serializes this MetaSeoRoute to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetaSeoRoute&&(identical(other.route, route) || other.route == route)&&(identical(other.config, config) || other.config == config));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,route,config);

@override
String toString() {
  return 'MetaSeoRoute(route: $route, config: $config)';
}


}

/// @nodoc
abstract mixin class $MetaSeoRouteCopyWith<$Res>  {
  factory $MetaSeoRouteCopyWith(MetaSeoRoute value, $Res Function(MetaSeoRoute) _then) = _$MetaSeoRouteCopyWithImpl;
@useResult
$Res call({
 String route, SeoConfig config
});


$SeoConfigCopyWith<$Res> get config;

}
/// @nodoc
class _$MetaSeoRouteCopyWithImpl<$Res>
    implements $MetaSeoRouteCopyWith<$Res> {
  _$MetaSeoRouteCopyWithImpl(this._self, this._then);

  final MetaSeoRoute _self;
  final $Res Function(MetaSeoRoute) _then;

/// Create a copy of MetaSeoRoute
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? route = null,Object? config = null,}) {
  return _then(_self.copyWith(
route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as String,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as SeoConfig,
  ));
}
/// Create a copy of MetaSeoRoute
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeoConfigCopyWith<$Res> get config {
  
  return $SeoConfigCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}


/// Adds pattern-matching-related methods to [MetaSeoRoute].
extension MetaSeoRoutePatterns on MetaSeoRoute {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetaSeoRoute value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetaSeoRoute() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetaSeoRoute value)  $default,){
final _that = this;
switch (_that) {
case _MetaSeoRoute():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetaSeoRoute value)?  $default,){
final _that = this;
switch (_that) {
case _MetaSeoRoute() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String route,  SeoConfig config)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetaSeoRoute() when $default != null:
return $default(_that.route,_that.config);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String route,  SeoConfig config)  $default,) {final _that = this;
switch (_that) {
case _MetaSeoRoute():
return $default(_that.route,_that.config);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String route,  SeoConfig config)?  $default,) {final _that = this;
switch (_that) {
case _MetaSeoRoute() when $default != null:
return $default(_that.route,_that.config);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _MetaSeoRoute extends MetaSeoRoute {
  const _MetaSeoRoute({required this.route, required this.config}): super._();
  factory _MetaSeoRoute.fromJson(Map<String, dynamic> json) => _$MetaSeoRouteFromJson(json);

@override final  String route;
@override final  SeoConfig config;

/// Create a copy of MetaSeoRoute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetaSeoRouteCopyWith<_MetaSeoRoute> get copyWith => __$MetaSeoRouteCopyWithImpl<_MetaSeoRoute>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetaSeoRouteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetaSeoRoute&&(identical(other.route, route) || other.route == route)&&(identical(other.config, config) || other.config == config));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,route,config);

@override
String toString() {
  return 'MetaSeoRoute(route: $route, config: $config)';
}


}

/// @nodoc
abstract mixin class _$MetaSeoRouteCopyWith<$Res> implements $MetaSeoRouteCopyWith<$Res> {
  factory _$MetaSeoRouteCopyWith(_MetaSeoRoute value, $Res Function(_MetaSeoRoute) _then) = __$MetaSeoRouteCopyWithImpl;
@override @useResult
$Res call({
 String route, SeoConfig config
});


@override $SeoConfigCopyWith<$Res> get config;

}
/// @nodoc
class __$MetaSeoRouteCopyWithImpl<$Res>
    implements _$MetaSeoRouteCopyWith<$Res> {
  __$MetaSeoRouteCopyWithImpl(this._self, this._then);

  final _MetaSeoRoute _self;
  final $Res Function(_MetaSeoRoute) _then;

/// Create a copy of MetaSeoRoute
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? route = null,Object? config = null,}) {
  return _then(_MetaSeoRoute(
route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as String,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as SeoConfig,
  ));
}

/// Create a copy of MetaSeoRoute
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeoConfigCopyWith<$Res> get config {
  
  return $SeoConfigCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}

// dart format on
