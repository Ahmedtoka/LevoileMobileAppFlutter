// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seo_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SeoConfig {

 SeoMetaRobot? get metaRobot; SeoMetaKeyValue? get metaKeyValue; SeoMetaNameContent? get metaNameContent; SeoMetaPropertyContent? get metaPropertyContent; SeoMetaTwitter? get metaTwitter; String? get author; String? get description; List<String>? get keywords; String? get viewport; String? get httpEquiv; String? get facebookAppID; String? get ogTitle; String? get ogDescription; String? get ogImage;
/// Create a copy of SeoConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeoConfigCopyWith<SeoConfig> get copyWith => _$SeoConfigCopyWithImpl<SeoConfig>(this as SeoConfig, _$identity);

  /// Serializes this SeoConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeoConfig&&(identical(other.metaRobot, metaRobot) || other.metaRobot == metaRobot)&&(identical(other.metaKeyValue, metaKeyValue) || other.metaKeyValue == metaKeyValue)&&(identical(other.metaNameContent, metaNameContent) || other.metaNameContent == metaNameContent)&&(identical(other.metaPropertyContent, metaPropertyContent) || other.metaPropertyContent == metaPropertyContent)&&(identical(other.metaTwitter, metaTwitter) || other.metaTwitter == metaTwitter)&&(identical(other.author, author) || other.author == author)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.keywords, keywords)&&(identical(other.viewport, viewport) || other.viewport == viewport)&&(identical(other.httpEquiv, httpEquiv) || other.httpEquiv == httpEquiv)&&(identical(other.facebookAppID, facebookAppID) || other.facebookAppID == facebookAppID)&&(identical(other.ogTitle, ogTitle) || other.ogTitle == ogTitle)&&(identical(other.ogDescription, ogDescription) || other.ogDescription == ogDescription)&&(identical(other.ogImage, ogImage) || other.ogImage == ogImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,metaRobot,metaKeyValue,metaNameContent,metaPropertyContent,metaTwitter,author,description,const DeepCollectionEquality().hash(keywords),viewport,httpEquiv,facebookAppID,ogTitle,ogDescription,ogImage);

@override
String toString() {
  return 'SeoConfig(metaRobot: $metaRobot, metaKeyValue: $metaKeyValue, metaNameContent: $metaNameContent, metaPropertyContent: $metaPropertyContent, metaTwitter: $metaTwitter, author: $author, description: $description, keywords: $keywords, viewport: $viewport, httpEquiv: $httpEquiv, facebookAppID: $facebookAppID, ogTitle: $ogTitle, ogDescription: $ogDescription, ogImage: $ogImage)';
}


}

/// @nodoc
abstract mixin class $SeoConfigCopyWith<$Res>  {
  factory $SeoConfigCopyWith(SeoConfig value, $Res Function(SeoConfig) _then) = _$SeoConfigCopyWithImpl;
@useResult
$Res call({
 SeoMetaRobot? metaRobot, SeoMetaKeyValue? metaKeyValue, SeoMetaNameContent? metaNameContent, SeoMetaPropertyContent? metaPropertyContent, SeoMetaTwitter? metaTwitter, String? author, String? description, List<String>? keywords, String? viewport, String? httpEquiv, String? facebookAppID, String? ogTitle, String? ogDescription, String? ogImage
});


$SeoMetaRobotCopyWith<$Res>? get metaRobot;$SeoMetaKeyValueCopyWith<$Res>? get metaKeyValue;$SeoMetaNameContentCopyWith<$Res>? get metaNameContent;$SeoMetaPropertyContentCopyWith<$Res>? get metaPropertyContent;$SeoMetaTwitterCopyWith<$Res>? get metaTwitter;

}
/// @nodoc
class _$SeoConfigCopyWithImpl<$Res>
    implements $SeoConfigCopyWith<$Res> {
  _$SeoConfigCopyWithImpl(this._self, this._then);

  final SeoConfig _self;
  final $Res Function(SeoConfig) _then;

/// Create a copy of SeoConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? metaRobot = freezed,Object? metaKeyValue = freezed,Object? metaNameContent = freezed,Object? metaPropertyContent = freezed,Object? metaTwitter = freezed,Object? author = freezed,Object? description = freezed,Object? keywords = freezed,Object? viewport = freezed,Object? httpEquiv = freezed,Object? facebookAppID = freezed,Object? ogTitle = freezed,Object? ogDescription = freezed,Object? ogImage = freezed,}) {
  return _then(_self.copyWith(
metaRobot: freezed == metaRobot ? _self.metaRobot : metaRobot // ignore: cast_nullable_to_non_nullable
as SeoMetaRobot?,metaKeyValue: freezed == metaKeyValue ? _self.metaKeyValue : metaKeyValue // ignore: cast_nullable_to_non_nullable
as SeoMetaKeyValue?,metaNameContent: freezed == metaNameContent ? _self.metaNameContent : metaNameContent // ignore: cast_nullable_to_non_nullable
as SeoMetaNameContent?,metaPropertyContent: freezed == metaPropertyContent ? _self.metaPropertyContent : metaPropertyContent // ignore: cast_nullable_to_non_nullable
as SeoMetaPropertyContent?,metaTwitter: freezed == metaTwitter ? _self.metaTwitter : metaTwitter // ignore: cast_nullable_to_non_nullable
as SeoMetaTwitter?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,keywords: freezed == keywords ? _self.keywords : keywords // ignore: cast_nullable_to_non_nullable
as List<String>?,viewport: freezed == viewport ? _self.viewport : viewport // ignore: cast_nullable_to_non_nullable
as String?,httpEquiv: freezed == httpEquiv ? _self.httpEquiv : httpEquiv // ignore: cast_nullable_to_non_nullable
as String?,facebookAppID: freezed == facebookAppID ? _self.facebookAppID : facebookAppID // ignore: cast_nullable_to_non_nullable
as String?,ogTitle: freezed == ogTitle ? _self.ogTitle : ogTitle // ignore: cast_nullable_to_non_nullable
as String?,ogDescription: freezed == ogDescription ? _self.ogDescription : ogDescription // ignore: cast_nullable_to_non_nullable
as String?,ogImage: freezed == ogImage ? _self.ogImage : ogImage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of SeoConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeoMetaRobotCopyWith<$Res>? get metaRobot {
    if (_self.metaRobot == null) {
    return null;
  }

  return $SeoMetaRobotCopyWith<$Res>(_self.metaRobot!, (value) {
    return _then(_self.copyWith(metaRobot: value));
  });
}/// Create a copy of SeoConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeoMetaKeyValueCopyWith<$Res>? get metaKeyValue {
    if (_self.metaKeyValue == null) {
    return null;
  }

  return $SeoMetaKeyValueCopyWith<$Res>(_self.metaKeyValue!, (value) {
    return _then(_self.copyWith(metaKeyValue: value));
  });
}/// Create a copy of SeoConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeoMetaNameContentCopyWith<$Res>? get metaNameContent {
    if (_self.metaNameContent == null) {
    return null;
  }

  return $SeoMetaNameContentCopyWith<$Res>(_self.metaNameContent!, (value) {
    return _then(_self.copyWith(metaNameContent: value));
  });
}/// Create a copy of SeoConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeoMetaPropertyContentCopyWith<$Res>? get metaPropertyContent {
    if (_self.metaPropertyContent == null) {
    return null;
  }

  return $SeoMetaPropertyContentCopyWith<$Res>(_self.metaPropertyContent!, (value) {
    return _then(_self.copyWith(metaPropertyContent: value));
  });
}/// Create a copy of SeoConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeoMetaTwitterCopyWith<$Res>? get metaTwitter {
    if (_self.metaTwitter == null) {
    return null;
  }

  return $SeoMetaTwitterCopyWith<$Res>(_self.metaTwitter!, (value) {
    return _then(_self.copyWith(metaTwitter: value));
  });
}
}


/// Adds pattern-matching-related methods to [SeoConfig].
extension SeoConfigPatterns on SeoConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeoConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeoConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeoConfig value)  $default,){
final _that = this;
switch (_that) {
case _SeoConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeoConfig value)?  $default,){
final _that = this;
switch (_that) {
case _SeoConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SeoMetaRobot? metaRobot,  SeoMetaKeyValue? metaKeyValue,  SeoMetaNameContent? metaNameContent,  SeoMetaPropertyContent? metaPropertyContent,  SeoMetaTwitter? metaTwitter,  String? author,  String? description,  List<String>? keywords,  String? viewport,  String? httpEquiv,  String? facebookAppID,  String? ogTitle,  String? ogDescription,  String? ogImage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeoConfig() when $default != null:
return $default(_that.metaRobot,_that.metaKeyValue,_that.metaNameContent,_that.metaPropertyContent,_that.metaTwitter,_that.author,_that.description,_that.keywords,_that.viewport,_that.httpEquiv,_that.facebookAppID,_that.ogTitle,_that.ogDescription,_that.ogImage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SeoMetaRobot? metaRobot,  SeoMetaKeyValue? metaKeyValue,  SeoMetaNameContent? metaNameContent,  SeoMetaPropertyContent? metaPropertyContent,  SeoMetaTwitter? metaTwitter,  String? author,  String? description,  List<String>? keywords,  String? viewport,  String? httpEquiv,  String? facebookAppID,  String? ogTitle,  String? ogDescription,  String? ogImage)  $default,) {final _that = this;
switch (_that) {
case _SeoConfig():
return $default(_that.metaRobot,_that.metaKeyValue,_that.metaNameContent,_that.metaPropertyContent,_that.metaTwitter,_that.author,_that.description,_that.keywords,_that.viewport,_that.httpEquiv,_that.facebookAppID,_that.ogTitle,_that.ogDescription,_that.ogImage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SeoMetaRobot? metaRobot,  SeoMetaKeyValue? metaKeyValue,  SeoMetaNameContent? metaNameContent,  SeoMetaPropertyContent? metaPropertyContent,  SeoMetaTwitter? metaTwitter,  String? author,  String? description,  List<String>? keywords,  String? viewport,  String? httpEquiv,  String? facebookAppID,  String? ogTitle,  String? ogDescription,  String? ogImage)?  $default,) {final _that = this;
switch (_that) {
case _SeoConfig() when $default != null:
return $default(_that.metaRobot,_that.metaKeyValue,_that.metaNameContent,_that.metaPropertyContent,_that.metaTwitter,_that.author,_that.description,_that.keywords,_that.viewport,_that.httpEquiv,_that.facebookAppID,_that.ogTitle,_that.ogDescription,_that.ogImage);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _SeoConfig extends SeoConfig {
  const _SeoConfig({this.metaRobot, this.metaKeyValue, this.metaNameContent, this.metaPropertyContent, this.metaTwitter, this.author, this.description, final  List<String>? keywords, this.viewport, this.httpEquiv, this.facebookAppID, this.ogTitle, this.ogDescription, this.ogImage}): _keywords = keywords,super._();
  factory _SeoConfig.fromJson(Map<String, dynamic> json) => _$SeoConfigFromJson(json);

@override final  SeoMetaRobot? metaRobot;
@override final  SeoMetaKeyValue? metaKeyValue;
@override final  SeoMetaNameContent? metaNameContent;
@override final  SeoMetaPropertyContent? metaPropertyContent;
@override final  SeoMetaTwitter? metaTwitter;
@override final  String? author;
@override final  String? description;
 final  List<String>? _keywords;
@override List<String>? get keywords {
  final value = _keywords;
  if (value == null) return null;
  if (_keywords is EqualUnmodifiableListView) return _keywords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? viewport;
@override final  String? httpEquiv;
@override final  String? facebookAppID;
@override final  String? ogTitle;
@override final  String? ogDescription;
@override final  String? ogImage;

/// Create a copy of SeoConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeoConfigCopyWith<_SeoConfig> get copyWith => __$SeoConfigCopyWithImpl<_SeoConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeoConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeoConfig&&(identical(other.metaRobot, metaRobot) || other.metaRobot == metaRobot)&&(identical(other.metaKeyValue, metaKeyValue) || other.metaKeyValue == metaKeyValue)&&(identical(other.metaNameContent, metaNameContent) || other.metaNameContent == metaNameContent)&&(identical(other.metaPropertyContent, metaPropertyContent) || other.metaPropertyContent == metaPropertyContent)&&(identical(other.metaTwitter, metaTwitter) || other.metaTwitter == metaTwitter)&&(identical(other.author, author) || other.author == author)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._keywords, _keywords)&&(identical(other.viewport, viewport) || other.viewport == viewport)&&(identical(other.httpEquiv, httpEquiv) || other.httpEquiv == httpEquiv)&&(identical(other.facebookAppID, facebookAppID) || other.facebookAppID == facebookAppID)&&(identical(other.ogTitle, ogTitle) || other.ogTitle == ogTitle)&&(identical(other.ogDescription, ogDescription) || other.ogDescription == ogDescription)&&(identical(other.ogImage, ogImage) || other.ogImage == ogImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,metaRobot,metaKeyValue,metaNameContent,metaPropertyContent,metaTwitter,author,description,const DeepCollectionEquality().hash(_keywords),viewport,httpEquiv,facebookAppID,ogTitle,ogDescription,ogImage);

@override
String toString() {
  return 'SeoConfig(metaRobot: $metaRobot, metaKeyValue: $metaKeyValue, metaNameContent: $metaNameContent, metaPropertyContent: $metaPropertyContent, metaTwitter: $metaTwitter, author: $author, description: $description, keywords: $keywords, viewport: $viewport, httpEquiv: $httpEquiv, facebookAppID: $facebookAppID, ogTitle: $ogTitle, ogDescription: $ogDescription, ogImage: $ogImage)';
}


}

/// @nodoc
abstract mixin class _$SeoConfigCopyWith<$Res> implements $SeoConfigCopyWith<$Res> {
  factory _$SeoConfigCopyWith(_SeoConfig value, $Res Function(_SeoConfig) _then) = __$SeoConfigCopyWithImpl;
@override @useResult
$Res call({
 SeoMetaRobot? metaRobot, SeoMetaKeyValue? metaKeyValue, SeoMetaNameContent? metaNameContent, SeoMetaPropertyContent? metaPropertyContent, SeoMetaTwitter? metaTwitter, String? author, String? description, List<String>? keywords, String? viewport, String? httpEquiv, String? facebookAppID, String? ogTitle, String? ogDescription, String? ogImage
});


@override $SeoMetaRobotCopyWith<$Res>? get metaRobot;@override $SeoMetaKeyValueCopyWith<$Res>? get metaKeyValue;@override $SeoMetaNameContentCopyWith<$Res>? get metaNameContent;@override $SeoMetaPropertyContentCopyWith<$Res>? get metaPropertyContent;@override $SeoMetaTwitterCopyWith<$Res>? get metaTwitter;

}
/// @nodoc
class __$SeoConfigCopyWithImpl<$Res>
    implements _$SeoConfigCopyWith<$Res> {
  __$SeoConfigCopyWithImpl(this._self, this._then);

  final _SeoConfig _self;
  final $Res Function(_SeoConfig) _then;

/// Create a copy of SeoConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? metaRobot = freezed,Object? metaKeyValue = freezed,Object? metaNameContent = freezed,Object? metaPropertyContent = freezed,Object? metaTwitter = freezed,Object? author = freezed,Object? description = freezed,Object? keywords = freezed,Object? viewport = freezed,Object? httpEquiv = freezed,Object? facebookAppID = freezed,Object? ogTitle = freezed,Object? ogDescription = freezed,Object? ogImage = freezed,}) {
  return _then(_SeoConfig(
metaRobot: freezed == metaRobot ? _self.metaRobot : metaRobot // ignore: cast_nullable_to_non_nullable
as SeoMetaRobot?,metaKeyValue: freezed == metaKeyValue ? _self.metaKeyValue : metaKeyValue // ignore: cast_nullable_to_non_nullable
as SeoMetaKeyValue?,metaNameContent: freezed == metaNameContent ? _self.metaNameContent : metaNameContent // ignore: cast_nullable_to_non_nullable
as SeoMetaNameContent?,metaPropertyContent: freezed == metaPropertyContent ? _self.metaPropertyContent : metaPropertyContent // ignore: cast_nullable_to_non_nullable
as SeoMetaPropertyContent?,metaTwitter: freezed == metaTwitter ? _self.metaTwitter : metaTwitter // ignore: cast_nullable_to_non_nullable
as SeoMetaTwitter?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,keywords: freezed == keywords ? _self._keywords : keywords // ignore: cast_nullable_to_non_nullable
as List<String>?,viewport: freezed == viewport ? _self.viewport : viewport // ignore: cast_nullable_to_non_nullable
as String?,httpEquiv: freezed == httpEquiv ? _self.httpEquiv : httpEquiv // ignore: cast_nullable_to_non_nullable
as String?,facebookAppID: freezed == facebookAppID ? _self.facebookAppID : facebookAppID // ignore: cast_nullable_to_non_nullable
as String?,ogTitle: freezed == ogTitle ? _self.ogTitle : ogTitle // ignore: cast_nullable_to_non_nullable
as String?,ogDescription: freezed == ogDescription ? _self.ogDescription : ogDescription // ignore: cast_nullable_to_non_nullable
as String?,ogImage: freezed == ogImage ? _self.ogImage : ogImage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of SeoConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeoMetaRobotCopyWith<$Res>? get metaRobot {
    if (_self.metaRobot == null) {
    return null;
  }

  return $SeoMetaRobotCopyWith<$Res>(_self.metaRobot!, (value) {
    return _then(_self.copyWith(metaRobot: value));
  });
}/// Create a copy of SeoConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeoMetaKeyValueCopyWith<$Res>? get metaKeyValue {
    if (_self.metaKeyValue == null) {
    return null;
  }

  return $SeoMetaKeyValueCopyWith<$Res>(_self.metaKeyValue!, (value) {
    return _then(_self.copyWith(metaKeyValue: value));
  });
}/// Create a copy of SeoConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeoMetaNameContentCopyWith<$Res>? get metaNameContent {
    if (_self.metaNameContent == null) {
    return null;
  }

  return $SeoMetaNameContentCopyWith<$Res>(_self.metaNameContent!, (value) {
    return _then(_self.copyWith(metaNameContent: value));
  });
}/// Create a copy of SeoConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeoMetaPropertyContentCopyWith<$Res>? get metaPropertyContent {
    if (_self.metaPropertyContent == null) {
    return null;
  }

  return $SeoMetaPropertyContentCopyWith<$Res>(_self.metaPropertyContent!, (value) {
    return _then(_self.copyWith(metaPropertyContent: value));
  });
}/// Create a copy of SeoConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeoMetaTwitterCopyWith<$Res>? get metaTwitter {
    if (_self.metaTwitter == null) {
    return null;
  }

  return $SeoMetaTwitterCopyWith<$Res>(_self.metaTwitter!, (value) {
    return _then(_self.copyWith(metaTwitter: value));
  });
}
}

// dart format on
