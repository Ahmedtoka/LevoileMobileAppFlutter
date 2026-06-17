// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_grid_layout_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CardGridLayoutConfig implements DiagnosticableTreeMixin {

 FluxGridViewConfig get gridConfig; List<CardGridItemConfig> get items; double get borderRadius;
/// Create a copy of CardGridLayoutConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardGridLayoutConfigCopyWith<CardGridLayoutConfig> get copyWith => _$CardGridLayoutConfigCopyWithImpl<CardGridLayoutConfig>(this as CardGridLayoutConfig, _$identity);

  /// Serializes this CardGridLayoutConfig to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CardGridLayoutConfig'))
    ..add(DiagnosticsProperty('gridConfig', gridConfig))..add(DiagnosticsProperty('items', items))..add(DiagnosticsProperty('borderRadius', borderRadius));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CardGridLayoutConfig&&(identical(other.gridConfig, gridConfig) || other.gridConfig == gridConfig)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.borderRadius, borderRadius) || other.borderRadius == borderRadius));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gridConfig,const DeepCollectionEquality().hash(items),borderRadius);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CardGridLayoutConfig(gridConfig: $gridConfig, items: $items, borderRadius: $borderRadius)';
}


}

/// @nodoc
abstract mixin class $CardGridLayoutConfigCopyWith<$Res>  {
  factory $CardGridLayoutConfigCopyWith(CardGridLayoutConfig value, $Res Function(CardGridLayoutConfig) _then) = _$CardGridLayoutConfigCopyWithImpl;
@useResult
$Res call({
 FluxGridViewConfig gridConfig, List<CardGridItemConfig> items, double borderRadius
});


$FluxGridViewConfigCopyWith<$Res> get gridConfig;

}
/// @nodoc
class _$CardGridLayoutConfigCopyWithImpl<$Res>
    implements $CardGridLayoutConfigCopyWith<$Res> {
  _$CardGridLayoutConfigCopyWithImpl(this._self, this._then);

  final CardGridLayoutConfig _self;
  final $Res Function(CardGridLayoutConfig) _then;

/// Create a copy of CardGridLayoutConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gridConfig = null,Object? items = null,Object? borderRadius = null,}) {
  return _then(_self.copyWith(
gridConfig: null == gridConfig ? _self.gridConfig : gridConfig // ignore: cast_nullable_to_non_nullable
as FluxGridViewConfig,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CardGridItemConfig>,borderRadius: null == borderRadius ? _self.borderRadius : borderRadius // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of CardGridLayoutConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxGridViewConfigCopyWith<$Res> get gridConfig {
  
  return $FluxGridViewConfigCopyWith<$Res>(_self.gridConfig, (value) {
    return _then(_self.copyWith(gridConfig: value));
  });
}
}


/// Adds pattern-matching-related methods to [CardGridLayoutConfig].
extension CardGridLayoutConfigPatterns on CardGridLayoutConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CardGridLayoutConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CardGridLayoutConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CardGridLayoutConfig value)  $default,){
final _that = this;
switch (_that) {
case _CardGridLayoutConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CardGridLayoutConfig value)?  $default,){
final _that = this;
switch (_that) {
case _CardGridLayoutConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FluxGridViewConfig gridConfig,  List<CardGridItemConfig> items,  double borderRadius)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CardGridLayoutConfig() when $default != null:
return $default(_that.gridConfig,_that.items,_that.borderRadius);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FluxGridViewConfig gridConfig,  List<CardGridItemConfig> items,  double borderRadius)  $default,) {final _that = this;
switch (_that) {
case _CardGridLayoutConfig():
return $default(_that.gridConfig,_that.items,_that.borderRadius);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FluxGridViewConfig gridConfig,  List<CardGridItemConfig> items,  double borderRadius)?  $default,) {final _that = this;
switch (_that) {
case _CardGridLayoutConfig() when $default != null:
return $default(_that.gridConfig,_that.items,_that.borderRadius);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CardGridLayoutConfig with DiagnosticableTreeMixin implements CardGridLayoutConfig {
  const _CardGridLayoutConfig({this.gridConfig = const FluxGridViewConfig(), required final  List<CardGridItemConfig> items, this.borderRadius = 0}): _items = items;
  factory _CardGridLayoutConfig.fromJson(Map<String, dynamic> json) => _$CardGridLayoutConfigFromJson(json);

@override@JsonKey() final  FluxGridViewConfig gridConfig;
 final  List<CardGridItemConfig> _items;
@override List<CardGridItemConfig> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  double borderRadius;

/// Create a copy of CardGridLayoutConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CardGridLayoutConfigCopyWith<_CardGridLayoutConfig> get copyWith => __$CardGridLayoutConfigCopyWithImpl<_CardGridLayoutConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CardGridLayoutConfigToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CardGridLayoutConfig'))
    ..add(DiagnosticsProperty('gridConfig', gridConfig))..add(DiagnosticsProperty('items', items))..add(DiagnosticsProperty('borderRadius', borderRadius));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CardGridLayoutConfig&&(identical(other.gridConfig, gridConfig) || other.gridConfig == gridConfig)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.borderRadius, borderRadius) || other.borderRadius == borderRadius));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gridConfig,const DeepCollectionEquality().hash(_items),borderRadius);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CardGridLayoutConfig(gridConfig: $gridConfig, items: $items, borderRadius: $borderRadius)';
}


}

/// @nodoc
abstract mixin class _$CardGridLayoutConfigCopyWith<$Res> implements $CardGridLayoutConfigCopyWith<$Res> {
  factory _$CardGridLayoutConfigCopyWith(_CardGridLayoutConfig value, $Res Function(_CardGridLayoutConfig) _then) = __$CardGridLayoutConfigCopyWithImpl;
@override @useResult
$Res call({
 FluxGridViewConfig gridConfig, List<CardGridItemConfig> items, double borderRadius
});


@override $FluxGridViewConfigCopyWith<$Res> get gridConfig;

}
/// @nodoc
class __$CardGridLayoutConfigCopyWithImpl<$Res>
    implements _$CardGridLayoutConfigCopyWith<$Res> {
  __$CardGridLayoutConfigCopyWithImpl(this._self, this._then);

  final _CardGridLayoutConfig _self;
  final $Res Function(_CardGridLayoutConfig) _then;

/// Create a copy of CardGridLayoutConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gridConfig = null,Object? items = null,Object? borderRadius = null,}) {
  return _then(_CardGridLayoutConfig(
gridConfig: null == gridConfig ? _self.gridConfig : gridConfig // ignore: cast_nullable_to_non_nullable
as FluxGridViewConfig,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CardGridItemConfig>,borderRadius: null == borderRadius ? _self.borderRadius : borderRadius // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of CardGridLayoutConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FluxGridViewConfigCopyWith<$Res> get gridConfig {
  
  return $FluxGridViewConfigCopyWith<$Res>(_self.gridConfig, (value) {
    return _then(_self.copyWith(gridConfig: value));
  });
}
}

// dart format on
