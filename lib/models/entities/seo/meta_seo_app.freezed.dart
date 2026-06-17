// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meta_seo_app.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MetaSeoApp {

 List<String>? get excludes; SeoConfig get config;
/// Create a copy of MetaSeoApp
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetaSeoAppCopyWith<MetaSeoApp> get copyWith => _$MetaSeoAppCopyWithImpl<MetaSeoApp>(this as MetaSeoApp, _$identity);

  /// Serializes this MetaSeoApp to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetaSeoApp&&const DeepCollectionEquality().equals(other.excludes, excludes)&&(identical(other.config, config) || other.config == config));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(excludes),config);

@override
String toString() {
  return 'MetaSeoApp(excludes: $excludes, config: $config)';
}


}

/// @nodoc
abstract mixin class $MetaSeoAppCopyWith<$Res>  {
  factory $MetaSeoAppCopyWith(MetaSeoApp value, $Res Function(MetaSeoApp) _then) = _$MetaSeoAppCopyWithImpl;
@useResult
$Res call({
 List<String>? excludes, SeoConfig config
});


$SeoConfigCopyWith<$Res> get config;

}
/// @nodoc
class _$MetaSeoAppCopyWithImpl<$Res>
    implements $MetaSeoAppCopyWith<$Res> {
  _$MetaSeoAppCopyWithImpl(this._self, this._then);

  final MetaSeoApp _self;
  final $Res Function(MetaSeoApp) _then;

/// Create a copy of MetaSeoApp
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? excludes = freezed,Object? config = null,}) {
  return _then(_self.copyWith(
excludes: freezed == excludes ? _self.excludes : excludes // ignore: cast_nullable_to_non_nullable
as List<String>?,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as SeoConfig,
  ));
}
/// Create a copy of MetaSeoApp
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeoConfigCopyWith<$Res> get config {
  
  return $SeoConfigCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}


/// Adds pattern-matching-related methods to [MetaSeoApp].
extension MetaSeoAppPatterns on MetaSeoApp {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetaSeoApp value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetaSeoApp() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetaSeoApp value)  $default,){
final _that = this;
switch (_that) {
case _MetaSeoApp():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetaSeoApp value)?  $default,){
final _that = this;
switch (_that) {
case _MetaSeoApp() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String>? excludes,  SeoConfig config)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetaSeoApp() when $default != null:
return $default(_that.excludes,_that.config);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String>? excludes,  SeoConfig config)  $default,) {final _that = this;
switch (_that) {
case _MetaSeoApp():
return $default(_that.excludes,_that.config);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String>? excludes,  SeoConfig config)?  $default,) {final _that = this;
switch (_that) {
case _MetaSeoApp() when $default != null:
return $default(_that.excludes,_that.config);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _MetaSeoApp extends MetaSeoApp {
  const _MetaSeoApp({final  List<String>? excludes, required this.config}): _excludes = excludes,super._();
  factory _MetaSeoApp.fromJson(Map<String, dynamic> json) => _$MetaSeoAppFromJson(json);

 final  List<String>? _excludes;
@override List<String>? get excludes {
  final value = _excludes;
  if (value == null) return null;
  if (_excludes is EqualUnmodifiableListView) return _excludes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  SeoConfig config;

/// Create a copy of MetaSeoApp
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetaSeoAppCopyWith<_MetaSeoApp> get copyWith => __$MetaSeoAppCopyWithImpl<_MetaSeoApp>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetaSeoAppToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetaSeoApp&&const DeepCollectionEquality().equals(other._excludes, _excludes)&&(identical(other.config, config) || other.config == config));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_excludes),config);

@override
String toString() {
  return 'MetaSeoApp(excludes: $excludes, config: $config)';
}


}

/// @nodoc
abstract mixin class _$MetaSeoAppCopyWith<$Res> implements $MetaSeoAppCopyWith<$Res> {
  factory _$MetaSeoAppCopyWith(_MetaSeoApp value, $Res Function(_MetaSeoApp) _then) = __$MetaSeoAppCopyWithImpl;
@override @useResult
$Res call({
 List<String>? excludes, SeoConfig config
});


@override $SeoConfigCopyWith<$Res> get config;

}
/// @nodoc
class __$MetaSeoAppCopyWithImpl<$Res>
    implements _$MetaSeoAppCopyWith<$Res> {
  __$MetaSeoAppCopyWithImpl(this._self, this._then);

  final _MetaSeoApp _self;
  final $Res Function(_MetaSeoApp) _then;

/// Create a copy of MetaSeoApp
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? excludes = freezed,Object? config = null,}) {
  return _then(_MetaSeoApp(
excludes: freezed == excludes ? _self._excludes : excludes // ignore: cast_nullable_to_non_nullable
as List<String>?,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as SeoConfig,
  ));
}

/// Create a copy of MetaSeoApp
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
