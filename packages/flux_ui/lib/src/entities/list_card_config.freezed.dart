// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_card_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListCardConfig {

// Height for content, image and action
 double? get heightContent; double? get heightImage; double? get heightAction;// Config for title and subtitle
 TextItemConfig? get titleTextConfig; TextItemConfig? get subtitleTextConfig;// action config
 StyleItemCardConfig? get actionBoxStyle; TextItemConfig? get actionTextConfig;// tag config
 StyleItemCardConfig? get tagBoxStyle; TextItemConfig? get tagTextConfig;// widget config
 StyleItemCardConfig? get cardBoxStyle; List<ItemListCardConfig>? get items;@AxisConverter() Axis? get axis;/// only support border, border radius, margin and padding
 StyleItemCardConfig? get imageBoxStyle;// Padding for content
@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? get contentPadding;// Padding for card
@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? get padding;// Style for list card
 ListCardStyle get style;/// Number of item in line. Only support for horizontal
/// Min 1, Max 3
 double? get itemInLine;///  Spacing for item
 double? get itemSpacing;@DividerConverter() Divider? get divider;
/// Create a copy of ListCardConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListCardConfigCopyWith<ListCardConfig> get copyWith => _$ListCardConfigCopyWithImpl<ListCardConfig>(this as ListCardConfig, _$identity);

  /// Serializes this ListCardConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListCardConfig&&(identical(other.heightContent, heightContent) || other.heightContent == heightContent)&&(identical(other.heightImage, heightImage) || other.heightImage == heightImage)&&(identical(other.heightAction, heightAction) || other.heightAction == heightAction)&&(identical(other.titleTextConfig, titleTextConfig) || other.titleTextConfig == titleTextConfig)&&(identical(other.subtitleTextConfig, subtitleTextConfig) || other.subtitleTextConfig == subtitleTextConfig)&&(identical(other.actionBoxStyle, actionBoxStyle) || other.actionBoxStyle == actionBoxStyle)&&(identical(other.actionTextConfig, actionTextConfig) || other.actionTextConfig == actionTextConfig)&&(identical(other.tagBoxStyle, tagBoxStyle) || other.tagBoxStyle == tagBoxStyle)&&(identical(other.tagTextConfig, tagTextConfig) || other.tagTextConfig == tagTextConfig)&&(identical(other.cardBoxStyle, cardBoxStyle) || other.cardBoxStyle == cardBoxStyle)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.axis, axis) || other.axis == axis)&&(identical(other.imageBoxStyle, imageBoxStyle) || other.imageBoxStyle == imageBoxStyle)&&(identical(other.contentPadding, contentPadding) || other.contentPadding == contentPadding)&&(identical(other.padding, padding) || other.padding == padding)&&(identical(other.style, style) || other.style == style)&&(identical(other.itemInLine, itemInLine) || other.itemInLine == itemInLine)&&(identical(other.itemSpacing, itemSpacing) || other.itemSpacing == itemSpacing)&&(identical(other.divider, divider) || other.divider == divider));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,heightContent,heightImage,heightAction,titleTextConfig,subtitleTextConfig,actionBoxStyle,actionTextConfig,tagBoxStyle,tagTextConfig,cardBoxStyle,const DeepCollectionEquality().hash(items),axis,imageBoxStyle,contentPadding,padding,style,itemInLine,itemSpacing,divider]);

@override
String toString() {
  return 'ListCardConfig(heightContent: $heightContent, heightImage: $heightImage, heightAction: $heightAction, titleTextConfig: $titleTextConfig, subtitleTextConfig: $subtitleTextConfig, actionBoxStyle: $actionBoxStyle, actionTextConfig: $actionTextConfig, tagBoxStyle: $tagBoxStyle, tagTextConfig: $tagTextConfig, cardBoxStyle: $cardBoxStyle, items: $items, axis: $axis, imageBoxStyle: $imageBoxStyle, contentPadding: $contentPadding, padding: $padding, style: $style, itemInLine: $itemInLine, itemSpacing: $itemSpacing, divider: $divider)';
}


}

/// @nodoc
abstract mixin class $ListCardConfigCopyWith<$Res>  {
  factory $ListCardConfigCopyWith(ListCardConfig value, $Res Function(ListCardConfig) _then) = _$ListCardConfigCopyWithImpl;
@useResult
$Res call({
 double? heightContent, double? heightImage, double? heightAction, TextItemConfig? titleTextConfig, TextItemConfig? subtitleTextConfig, StyleItemCardConfig? actionBoxStyle, TextItemConfig? actionTextConfig, StyleItemCardConfig? tagBoxStyle, TextItemConfig? tagTextConfig, StyleItemCardConfig? cardBoxStyle, List<ItemListCardConfig>? items,@AxisConverter() Axis? axis, StyleItemCardConfig? imageBoxStyle,@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? contentPadding,@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? padding, ListCardStyle style, double? itemInLine, double? itemSpacing,@DividerConverter() Divider? divider
});


$TextItemConfigCopyWith<$Res>? get titleTextConfig;$TextItemConfigCopyWith<$Res>? get subtitleTextConfig;$StyleItemCardConfigCopyWith<$Res>? get actionBoxStyle;$TextItemConfigCopyWith<$Res>? get actionTextConfig;$StyleItemCardConfigCopyWith<$Res>? get tagBoxStyle;$TextItemConfigCopyWith<$Res>? get tagTextConfig;$StyleItemCardConfigCopyWith<$Res>? get cardBoxStyle;$StyleItemCardConfigCopyWith<$Res>? get imageBoxStyle;

}
/// @nodoc
class _$ListCardConfigCopyWithImpl<$Res>
    implements $ListCardConfigCopyWith<$Res> {
  _$ListCardConfigCopyWithImpl(this._self, this._then);

  final ListCardConfig _self;
  final $Res Function(ListCardConfig) _then;

/// Create a copy of ListCardConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? heightContent = freezed,Object? heightImage = freezed,Object? heightAction = freezed,Object? titleTextConfig = freezed,Object? subtitleTextConfig = freezed,Object? actionBoxStyle = freezed,Object? actionTextConfig = freezed,Object? tagBoxStyle = freezed,Object? tagTextConfig = freezed,Object? cardBoxStyle = freezed,Object? items = freezed,Object? axis = freezed,Object? imageBoxStyle = freezed,Object? contentPadding = freezed,Object? padding = freezed,Object? style = null,Object? itemInLine = freezed,Object? itemSpacing = freezed,Object? divider = freezed,}) {
  return _then(_self.copyWith(
heightContent: freezed == heightContent ? _self.heightContent : heightContent // ignore: cast_nullable_to_non_nullable
as double?,heightImage: freezed == heightImage ? _self.heightImage : heightImage // ignore: cast_nullable_to_non_nullable
as double?,heightAction: freezed == heightAction ? _self.heightAction : heightAction // ignore: cast_nullable_to_non_nullable
as double?,titleTextConfig: freezed == titleTextConfig ? _self.titleTextConfig : titleTextConfig // ignore: cast_nullable_to_non_nullable
as TextItemConfig?,subtitleTextConfig: freezed == subtitleTextConfig ? _self.subtitleTextConfig : subtitleTextConfig // ignore: cast_nullable_to_non_nullable
as TextItemConfig?,actionBoxStyle: freezed == actionBoxStyle ? _self.actionBoxStyle : actionBoxStyle // ignore: cast_nullable_to_non_nullable
as StyleItemCardConfig?,actionTextConfig: freezed == actionTextConfig ? _self.actionTextConfig : actionTextConfig // ignore: cast_nullable_to_non_nullable
as TextItemConfig?,tagBoxStyle: freezed == tagBoxStyle ? _self.tagBoxStyle : tagBoxStyle // ignore: cast_nullable_to_non_nullable
as StyleItemCardConfig?,tagTextConfig: freezed == tagTextConfig ? _self.tagTextConfig : tagTextConfig // ignore: cast_nullable_to_non_nullable
as TextItemConfig?,cardBoxStyle: freezed == cardBoxStyle ? _self.cardBoxStyle : cardBoxStyle // ignore: cast_nullable_to_non_nullable
as StyleItemCardConfig?,items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ItemListCardConfig>?,axis: freezed == axis ? _self.axis : axis // ignore: cast_nullable_to_non_nullable
as Axis?,imageBoxStyle: freezed == imageBoxStyle ? _self.imageBoxStyle : imageBoxStyle // ignore: cast_nullable_to_non_nullable
as StyleItemCardConfig?,contentPadding: freezed == contentPadding ? _self.contentPadding : contentPadding // ignore: cast_nullable_to_non_nullable
as EdgeInsetsDirectional?,padding: freezed == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as EdgeInsetsDirectional?,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as ListCardStyle,itemInLine: freezed == itemInLine ? _self.itemInLine : itemInLine // ignore: cast_nullable_to_non_nullable
as double?,itemSpacing: freezed == itemSpacing ? _self.itemSpacing : itemSpacing // ignore: cast_nullable_to_non_nullable
as double?,divider: freezed == divider ? _self.divider : divider // ignore: cast_nullable_to_non_nullable
as Divider?,
  ));
}
/// Create a copy of ListCardConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TextItemConfigCopyWith<$Res>? get titleTextConfig {
    if (_self.titleTextConfig == null) {
    return null;
  }

  return $TextItemConfigCopyWith<$Res>(_self.titleTextConfig!, (value) {
    return _then(_self.copyWith(titleTextConfig: value));
  });
}/// Create a copy of ListCardConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TextItemConfigCopyWith<$Res>? get subtitleTextConfig {
    if (_self.subtitleTextConfig == null) {
    return null;
  }

  return $TextItemConfigCopyWith<$Res>(_self.subtitleTextConfig!, (value) {
    return _then(_self.copyWith(subtitleTextConfig: value));
  });
}/// Create a copy of ListCardConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StyleItemCardConfigCopyWith<$Res>? get actionBoxStyle {
    if (_self.actionBoxStyle == null) {
    return null;
  }

  return $StyleItemCardConfigCopyWith<$Res>(_self.actionBoxStyle!, (value) {
    return _then(_self.copyWith(actionBoxStyle: value));
  });
}/// Create a copy of ListCardConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TextItemConfigCopyWith<$Res>? get actionTextConfig {
    if (_self.actionTextConfig == null) {
    return null;
  }

  return $TextItemConfigCopyWith<$Res>(_self.actionTextConfig!, (value) {
    return _then(_self.copyWith(actionTextConfig: value));
  });
}/// Create a copy of ListCardConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StyleItemCardConfigCopyWith<$Res>? get tagBoxStyle {
    if (_self.tagBoxStyle == null) {
    return null;
  }

  return $StyleItemCardConfigCopyWith<$Res>(_self.tagBoxStyle!, (value) {
    return _then(_self.copyWith(tagBoxStyle: value));
  });
}/// Create a copy of ListCardConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TextItemConfigCopyWith<$Res>? get tagTextConfig {
    if (_self.tagTextConfig == null) {
    return null;
  }

  return $TextItemConfigCopyWith<$Res>(_self.tagTextConfig!, (value) {
    return _then(_self.copyWith(tagTextConfig: value));
  });
}/// Create a copy of ListCardConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StyleItemCardConfigCopyWith<$Res>? get cardBoxStyle {
    if (_self.cardBoxStyle == null) {
    return null;
  }

  return $StyleItemCardConfigCopyWith<$Res>(_self.cardBoxStyle!, (value) {
    return _then(_self.copyWith(cardBoxStyle: value));
  });
}/// Create a copy of ListCardConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StyleItemCardConfigCopyWith<$Res>? get imageBoxStyle {
    if (_self.imageBoxStyle == null) {
    return null;
  }

  return $StyleItemCardConfigCopyWith<$Res>(_self.imageBoxStyle!, (value) {
    return _then(_self.copyWith(imageBoxStyle: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListCardConfig].
extension ListCardConfigPatterns on ListCardConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListCardConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListCardConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListCardConfig value)  $default,){
final _that = this;
switch (_that) {
case _ListCardConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListCardConfig value)?  $default,){
final _that = this;
switch (_that) {
case _ListCardConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? heightContent,  double? heightImage,  double? heightAction,  TextItemConfig? titleTextConfig,  TextItemConfig? subtitleTextConfig,  StyleItemCardConfig? actionBoxStyle,  TextItemConfig? actionTextConfig,  StyleItemCardConfig? tagBoxStyle,  TextItemConfig? tagTextConfig,  StyleItemCardConfig? cardBoxStyle,  List<ItemListCardConfig>? items, @AxisConverter()  Axis? axis,  StyleItemCardConfig? imageBoxStyle, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? contentPadding, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? padding,  ListCardStyle style,  double? itemInLine,  double? itemSpacing, @DividerConverter()  Divider? divider)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListCardConfig() when $default != null:
return $default(_that.heightContent,_that.heightImage,_that.heightAction,_that.titleTextConfig,_that.subtitleTextConfig,_that.actionBoxStyle,_that.actionTextConfig,_that.tagBoxStyle,_that.tagTextConfig,_that.cardBoxStyle,_that.items,_that.axis,_that.imageBoxStyle,_that.contentPadding,_that.padding,_that.style,_that.itemInLine,_that.itemSpacing,_that.divider);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? heightContent,  double? heightImage,  double? heightAction,  TextItemConfig? titleTextConfig,  TextItemConfig? subtitleTextConfig,  StyleItemCardConfig? actionBoxStyle,  TextItemConfig? actionTextConfig,  StyleItemCardConfig? tagBoxStyle,  TextItemConfig? tagTextConfig,  StyleItemCardConfig? cardBoxStyle,  List<ItemListCardConfig>? items, @AxisConverter()  Axis? axis,  StyleItemCardConfig? imageBoxStyle, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? contentPadding, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? padding,  ListCardStyle style,  double? itemInLine,  double? itemSpacing, @DividerConverter()  Divider? divider)  $default,) {final _that = this;
switch (_that) {
case _ListCardConfig():
return $default(_that.heightContent,_that.heightImage,_that.heightAction,_that.titleTextConfig,_that.subtitleTextConfig,_that.actionBoxStyle,_that.actionTextConfig,_that.tagBoxStyle,_that.tagTextConfig,_that.cardBoxStyle,_that.items,_that.axis,_that.imageBoxStyle,_that.contentPadding,_that.padding,_that.style,_that.itemInLine,_that.itemSpacing,_that.divider);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? heightContent,  double? heightImage,  double? heightAction,  TextItemConfig? titleTextConfig,  TextItemConfig? subtitleTextConfig,  StyleItemCardConfig? actionBoxStyle,  TextItemConfig? actionTextConfig,  StyleItemCardConfig? tagBoxStyle,  TextItemConfig? tagTextConfig,  StyleItemCardConfig? cardBoxStyle,  List<ItemListCardConfig>? items, @AxisConverter()  Axis? axis,  StyleItemCardConfig? imageBoxStyle, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? contentPadding, @EdgeInsetsDirectionalConverter()  EdgeInsetsDirectional? padding,  ListCardStyle style,  double? itemInLine,  double? itemSpacing, @DividerConverter()  Divider? divider)?  $default,) {final _that = this;
switch (_that) {
case _ListCardConfig() when $default != null:
return $default(_that.heightContent,_that.heightImage,_that.heightAction,_that.titleTextConfig,_that.subtitleTextConfig,_that.actionBoxStyle,_that.actionTextConfig,_that.tagBoxStyle,_that.tagTextConfig,_that.cardBoxStyle,_that.items,_that.axis,_that.imageBoxStyle,_that.contentPadding,_that.padding,_that.style,_that.itemInLine,_that.itemSpacing,_that.divider);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListCardConfig implements ListCardConfig {
  const _ListCardConfig({this.heightContent, this.heightImage, this.heightAction, this.titleTextConfig, this.subtitleTextConfig, this.actionBoxStyle, this.actionTextConfig, this.tagBoxStyle, this.tagTextConfig, this.cardBoxStyle, final  List<ItemListCardConfig>? items, @AxisConverter() this.axis, this.imageBoxStyle, @EdgeInsetsDirectionalConverter() this.contentPadding, @EdgeInsetsDirectionalConverter() this.padding, this.style = ListCardStyle.titleHeading, this.itemInLine, this.itemSpacing, @DividerConverter() this.divider}): _items = items;
  factory _ListCardConfig.fromJson(Map<String, dynamic> json) => _$ListCardConfigFromJson(json);

// Height for content, image and action
@override final  double? heightContent;
@override final  double? heightImage;
@override final  double? heightAction;
// Config for title and subtitle
@override final  TextItemConfig? titleTextConfig;
@override final  TextItemConfig? subtitleTextConfig;
// action config
@override final  StyleItemCardConfig? actionBoxStyle;
@override final  TextItemConfig? actionTextConfig;
// tag config
@override final  StyleItemCardConfig? tagBoxStyle;
@override final  TextItemConfig? tagTextConfig;
// widget config
@override final  StyleItemCardConfig? cardBoxStyle;
 final  List<ItemListCardConfig>? _items;
@override List<ItemListCardConfig>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@AxisConverter() final  Axis? axis;
/// only support border, border radius, margin and padding
@override final  StyleItemCardConfig? imageBoxStyle;
// Padding for content
@override@EdgeInsetsDirectionalConverter() final  EdgeInsetsDirectional? contentPadding;
// Padding for card
@override@EdgeInsetsDirectionalConverter() final  EdgeInsetsDirectional? padding;
// Style for list card
@override@JsonKey() final  ListCardStyle style;
/// Number of item in line. Only support for horizontal
/// Min 1, Max 3
@override final  double? itemInLine;
///  Spacing for item
@override final  double? itemSpacing;
@override@DividerConverter() final  Divider? divider;

/// Create a copy of ListCardConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListCardConfigCopyWith<_ListCardConfig> get copyWith => __$ListCardConfigCopyWithImpl<_ListCardConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListCardConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListCardConfig&&(identical(other.heightContent, heightContent) || other.heightContent == heightContent)&&(identical(other.heightImage, heightImage) || other.heightImage == heightImage)&&(identical(other.heightAction, heightAction) || other.heightAction == heightAction)&&(identical(other.titleTextConfig, titleTextConfig) || other.titleTextConfig == titleTextConfig)&&(identical(other.subtitleTextConfig, subtitleTextConfig) || other.subtitleTextConfig == subtitleTextConfig)&&(identical(other.actionBoxStyle, actionBoxStyle) || other.actionBoxStyle == actionBoxStyle)&&(identical(other.actionTextConfig, actionTextConfig) || other.actionTextConfig == actionTextConfig)&&(identical(other.tagBoxStyle, tagBoxStyle) || other.tagBoxStyle == tagBoxStyle)&&(identical(other.tagTextConfig, tagTextConfig) || other.tagTextConfig == tagTextConfig)&&(identical(other.cardBoxStyle, cardBoxStyle) || other.cardBoxStyle == cardBoxStyle)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.axis, axis) || other.axis == axis)&&(identical(other.imageBoxStyle, imageBoxStyle) || other.imageBoxStyle == imageBoxStyle)&&(identical(other.contentPadding, contentPadding) || other.contentPadding == contentPadding)&&(identical(other.padding, padding) || other.padding == padding)&&(identical(other.style, style) || other.style == style)&&(identical(other.itemInLine, itemInLine) || other.itemInLine == itemInLine)&&(identical(other.itemSpacing, itemSpacing) || other.itemSpacing == itemSpacing)&&(identical(other.divider, divider) || other.divider == divider));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,heightContent,heightImage,heightAction,titleTextConfig,subtitleTextConfig,actionBoxStyle,actionTextConfig,tagBoxStyle,tagTextConfig,cardBoxStyle,const DeepCollectionEquality().hash(_items),axis,imageBoxStyle,contentPadding,padding,style,itemInLine,itemSpacing,divider]);

@override
String toString() {
  return 'ListCardConfig(heightContent: $heightContent, heightImage: $heightImage, heightAction: $heightAction, titleTextConfig: $titleTextConfig, subtitleTextConfig: $subtitleTextConfig, actionBoxStyle: $actionBoxStyle, actionTextConfig: $actionTextConfig, tagBoxStyle: $tagBoxStyle, tagTextConfig: $tagTextConfig, cardBoxStyle: $cardBoxStyle, items: $items, axis: $axis, imageBoxStyle: $imageBoxStyle, contentPadding: $contentPadding, padding: $padding, style: $style, itemInLine: $itemInLine, itemSpacing: $itemSpacing, divider: $divider)';
}


}

/// @nodoc
abstract mixin class _$ListCardConfigCopyWith<$Res> implements $ListCardConfigCopyWith<$Res> {
  factory _$ListCardConfigCopyWith(_ListCardConfig value, $Res Function(_ListCardConfig) _then) = __$ListCardConfigCopyWithImpl;
@override @useResult
$Res call({
 double? heightContent, double? heightImage, double? heightAction, TextItemConfig? titleTextConfig, TextItemConfig? subtitleTextConfig, StyleItemCardConfig? actionBoxStyle, TextItemConfig? actionTextConfig, StyleItemCardConfig? tagBoxStyle, TextItemConfig? tagTextConfig, StyleItemCardConfig? cardBoxStyle, List<ItemListCardConfig>? items,@AxisConverter() Axis? axis, StyleItemCardConfig? imageBoxStyle,@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? contentPadding,@EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? padding, ListCardStyle style, double? itemInLine, double? itemSpacing,@DividerConverter() Divider? divider
});


@override $TextItemConfigCopyWith<$Res>? get titleTextConfig;@override $TextItemConfigCopyWith<$Res>? get subtitleTextConfig;@override $StyleItemCardConfigCopyWith<$Res>? get actionBoxStyle;@override $TextItemConfigCopyWith<$Res>? get actionTextConfig;@override $StyleItemCardConfigCopyWith<$Res>? get tagBoxStyle;@override $TextItemConfigCopyWith<$Res>? get tagTextConfig;@override $StyleItemCardConfigCopyWith<$Res>? get cardBoxStyle;@override $StyleItemCardConfigCopyWith<$Res>? get imageBoxStyle;

}
/// @nodoc
class __$ListCardConfigCopyWithImpl<$Res>
    implements _$ListCardConfigCopyWith<$Res> {
  __$ListCardConfigCopyWithImpl(this._self, this._then);

  final _ListCardConfig _self;
  final $Res Function(_ListCardConfig) _then;

/// Create a copy of ListCardConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? heightContent = freezed,Object? heightImage = freezed,Object? heightAction = freezed,Object? titleTextConfig = freezed,Object? subtitleTextConfig = freezed,Object? actionBoxStyle = freezed,Object? actionTextConfig = freezed,Object? tagBoxStyle = freezed,Object? tagTextConfig = freezed,Object? cardBoxStyle = freezed,Object? items = freezed,Object? axis = freezed,Object? imageBoxStyle = freezed,Object? contentPadding = freezed,Object? padding = freezed,Object? style = null,Object? itemInLine = freezed,Object? itemSpacing = freezed,Object? divider = freezed,}) {
  return _then(_ListCardConfig(
heightContent: freezed == heightContent ? _self.heightContent : heightContent // ignore: cast_nullable_to_non_nullable
as double?,heightImage: freezed == heightImage ? _self.heightImage : heightImage // ignore: cast_nullable_to_non_nullable
as double?,heightAction: freezed == heightAction ? _self.heightAction : heightAction // ignore: cast_nullable_to_non_nullable
as double?,titleTextConfig: freezed == titleTextConfig ? _self.titleTextConfig : titleTextConfig // ignore: cast_nullable_to_non_nullable
as TextItemConfig?,subtitleTextConfig: freezed == subtitleTextConfig ? _self.subtitleTextConfig : subtitleTextConfig // ignore: cast_nullable_to_non_nullable
as TextItemConfig?,actionBoxStyle: freezed == actionBoxStyle ? _self.actionBoxStyle : actionBoxStyle // ignore: cast_nullable_to_non_nullable
as StyleItemCardConfig?,actionTextConfig: freezed == actionTextConfig ? _self.actionTextConfig : actionTextConfig // ignore: cast_nullable_to_non_nullable
as TextItemConfig?,tagBoxStyle: freezed == tagBoxStyle ? _self.tagBoxStyle : tagBoxStyle // ignore: cast_nullable_to_non_nullable
as StyleItemCardConfig?,tagTextConfig: freezed == tagTextConfig ? _self.tagTextConfig : tagTextConfig // ignore: cast_nullable_to_non_nullable
as TextItemConfig?,cardBoxStyle: freezed == cardBoxStyle ? _self.cardBoxStyle : cardBoxStyle // ignore: cast_nullable_to_non_nullable
as StyleItemCardConfig?,items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ItemListCardConfig>?,axis: freezed == axis ? _self.axis : axis // ignore: cast_nullable_to_non_nullable
as Axis?,imageBoxStyle: freezed == imageBoxStyle ? _self.imageBoxStyle : imageBoxStyle // ignore: cast_nullable_to_non_nullable
as StyleItemCardConfig?,contentPadding: freezed == contentPadding ? _self.contentPadding : contentPadding // ignore: cast_nullable_to_non_nullable
as EdgeInsetsDirectional?,padding: freezed == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as EdgeInsetsDirectional?,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as ListCardStyle,itemInLine: freezed == itemInLine ? _self.itemInLine : itemInLine // ignore: cast_nullable_to_non_nullable
as double?,itemSpacing: freezed == itemSpacing ? _self.itemSpacing : itemSpacing // ignore: cast_nullable_to_non_nullable
as double?,divider: freezed == divider ? _self.divider : divider // ignore: cast_nullable_to_non_nullable
as Divider?,
  ));
}

/// Create a copy of ListCardConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TextItemConfigCopyWith<$Res>? get titleTextConfig {
    if (_self.titleTextConfig == null) {
    return null;
  }

  return $TextItemConfigCopyWith<$Res>(_self.titleTextConfig!, (value) {
    return _then(_self.copyWith(titleTextConfig: value));
  });
}/// Create a copy of ListCardConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TextItemConfigCopyWith<$Res>? get subtitleTextConfig {
    if (_self.subtitleTextConfig == null) {
    return null;
  }

  return $TextItemConfigCopyWith<$Res>(_self.subtitleTextConfig!, (value) {
    return _then(_self.copyWith(subtitleTextConfig: value));
  });
}/// Create a copy of ListCardConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StyleItemCardConfigCopyWith<$Res>? get actionBoxStyle {
    if (_self.actionBoxStyle == null) {
    return null;
  }

  return $StyleItemCardConfigCopyWith<$Res>(_self.actionBoxStyle!, (value) {
    return _then(_self.copyWith(actionBoxStyle: value));
  });
}/// Create a copy of ListCardConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TextItemConfigCopyWith<$Res>? get actionTextConfig {
    if (_self.actionTextConfig == null) {
    return null;
  }

  return $TextItemConfigCopyWith<$Res>(_self.actionTextConfig!, (value) {
    return _then(_self.copyWith(actionTextConfig: value));
  });
}/// Create a copy of ListCardConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StyleItemCardConfigCopyWith<$Res>? get tagBoxStyle {
    if (_self.tagBoxStyle == null) {
    return null;
  }

  return $StyleItemCardConfigCopyWith<$Res>(_self.tagBoxStyle!, (value) {
    return _then(_self.copyWith(tagBoxStyle: value));
  });
}/// Create a copy of ListCardConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TextItemConfigCopyWith<$Res>? get tagTextConfig {
    if (_self.tagTextConfig == null) {
    return null;
  }

  return $TextItemConfigCopyWith<$Res>(_self.tagTextConfig!, (value) {
    return _then(_self.copyWith(tagTextConfig: value));
  });
}/// Create a copy of ListCardConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StyleItemCardConfigCopyWith<$Res>? get cardBoxStyle {
    if (_self.cardBoxStyle == null) {
    return null;
  }

  return $StyleItemCardConfigCopyWith<$Res>(_self.cardBoxStyle!, (value) {
    return _then(_self.copyWith(cardBoxStyle: value));
  });
}/// Create a copy of ListCardConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StyleItemCardConfigCopyWith<$Res>? get imageBoxStyle {
    if (_self.imageBoxStyle == null) {
    return null;
  }

  return $StyleItemCardConfigCopyWith<$Res>(_self.imageBoxStyle!, (value) {
    return _then(_self.copyWith(imageBoxStyle: value));
  });
}
}

// dart format on
