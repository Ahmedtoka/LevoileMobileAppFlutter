// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meta_seo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MetaSeoConfig {

 MetaSeoApp? get app; List<MetaSeoRoute>? get routes;
/// Create a copy of MetaSeoConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetaSeoConfigCopyWith<MetaSeoConfig> get copyWith => _$MetaSeoConfigCopyWithImpl<MetaSeoConfig>(this as MetaSeoConfig, _$identity);

  /// Serializes this MetaSeoConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetaSeoConfig&&(identical(other.app, app) || other.app == app)&&const DeepCollectionEquality().equals(other.routes, routes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,app,const DeepCollectionEquality().hash(routes));

@override
String toString() {
  return 'MetaSeoConfig(app: $app, routes: $routes)';
}


}

/// @nodoc
abstract mixin class $MetaSeoConfigCopyWith<$Res>  {
  factory $MetaSeoConfigCopyWith(MetaSeoConfig value, $Res Function(MetaSeoConfig) _then) = _$MetaSeoConfigCopyWithImpl;
@useResult
$Res call({
 MetaSeoApp? app, List<MetaSeoRoute>? routes
});


$MetaSeoAppCopyWith<$Res>? get app;

}
/// @nodoc
class _$MetaSeoConfigCopyWithImpl<$Res>
    implements $MetaSeoConfigCopyWith<$Res> {
  _$MetaSeoConfigCopyWithImpl(this._self, this._then);

  final MetaSeoConfig _self;
  final $Res Function(MetaSeoConfig) _then;

/// Create a copy of MetaSeoConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? app = freezed,Object? routes = freezed,}) {
  return _then(_self.copyWith(
app: freezed == app ? _self.app : app // ignore: cast_nullable_to_non_nullable
as MetaSeoApp?,routes: freezed == routes ? _self.routes : routes // ignore: cast_nullable_to_non_nullable
as List<MetaSeoRoute>?,
  ));
}
/// Create a copy of MetaSeoConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaSeoAppCopyWith<$Res>? get app {
    if (_self.app == null) {
    return null;
  }

  return $MetaSeoAppCopyWith<$Res>(_self.app!, (value) {
    return _then(_self.copyWith(app: value));
  });
}
}


/// Adds pattern-matching-related methods to [MetaSeoConfig].
extension MetaSeoConfigPatterns on MetaSeoConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetaSeoConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetaSeoConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetaSeoConfig value)  $default,){
final _that = this;
switch (_that) {
case _MetaSeoConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetaSeoConfig value)?  $default,){
final _that = this;
switch (_that) {
case _MetaSeoConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MetaSeoApp? app,  List<MetaSeoRoute>? routes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetaSeoConfig() when $default != null:
return $default(_that.app,_that.routes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MetaSeoApp? app,  List<MetaSeoRoute>? routes)  $default,) {final _that = this;
switch (_that) {
case _MetaSeoConfig():
return $default(_that.app,_that.routes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MetaSeoApp? app,  List<MetaSeoRoute>? routes)?  $default,) {final _that = this;
switch (_that) {
case _MetaSeoConfig() when $default != null:
return $default(_that.app,_that.routes);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _MetaSeoConfig extends MetaSeoConfig {
  const _MetaSeoConfig({this.app, final  List<MetaSeoRoute>? routes}): _routes = routes,super._();
  factory _MetaSeoConfig.fromJson(Map<String, dynamic> json) => _$MetaSeoConfigFromJson(json);

@override final  MetaSeoApp? app;
 final  List<MetaSeoRoute>? _routes;
@override List<MetaSeoRoute>? get routes {
  final value = _routes;
  if (value == null) return null;
  if (_routes is EqualUnmodifiableListView) return _routes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of MetaSeoConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetaSeoConfigCopyWith<_MetaSeoConfig> get copyWith => __$MetaSeoConfigCopyWithImpl<_MetaSeoConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetaSeoConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetaSeoConfig&&(identical(other.app, app) || other.app == app)&&const DeepCollectionEquality().equals(other._routes, _routes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,app,const DeepCollectionEquality().hash(_routes));

@override
String toString() {
  return 'MetaSeoConfig(app: $app, routes: $routes)';
}


}

/// @nodoc
abstract mixin class _$MetaSeoConfigCopyWith<$Res> implements $MetaSeoConfigCopyWith<$Res> {
  factory _$MetaSeoConfigCopyWith(_MetaSeoConfig value, $Res Function(_MetaSeoConfig) _then) = __$MetaSeoConfigCopyWithImpl;
@override @useResult
$Res call({
 MetaSeoApp? app, List<MetaSeoRoute>? routes
});


@override $MetaSeoAppCopyWith<$Res>? get app;

}
/// @nodoc
class __$MetaSeoConfigCopyWithImpl<$Res>
    implements _$MetaSeoConfigCopyWith<$Res> {
  __$MetaSeoConfigCopyWithImpl(this._self, this._then);

  final _MetaSeoConfig _self;
  final $Res Function(_MetaSeoConfig) _then;

/// Create a copy of MetaSeoConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? app = freezed,Object? routes = freezed,}) {
  return _then(_MetaSeoConfig(
app: freezed == app ? _self.app : app // ignore: cast_nullable_to_non_nullable
as MetaSeoApp?,routes: freezed == routes ? _self._routes : routes // ignore: cast_nullable_to_non_nullable
as List<MetaSeoRoute>?,
  ));
}

/// Create a copy of MetaSeoConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaSeoAppCopyWith<$Res>? get app {
    if (_self.app == null) {
    return null;
  }

  return $MetaSeoAppCopyWith<$Res>(_self.app!, (value) {
    return _then(_self.copyWith(app: value));
  });
}
}

// dart format on
