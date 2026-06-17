// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'openai_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatGPT {

 bool get enableChat; dynamic get supabaseAnonKey; dynamic get supabaseUrl; bool get enableSubscription; bool get enableInputKey; dynamic get revenueAppleApiKey; dynamic get revenueGoogleApiKey; List<String> get revenueProductsIos; List<String> get revenueProductsAndroid;
/// Create a copy of ChatGPT
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatGPTCopyWith<ChatGPT> get copyWith => _$ChatGPTCopyWithImpl<ChatGPT>(this as ChatGPT, _$identity);

  /// Serializes this ChatGPT to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatGPT&&(identical(other.enableChat, enableChat) || other.enableChat == enableChat)&&const DeepCollectionEquality().equals(other.supabaseAnonKey, supabaseAnonKey)&&const DeepCollectionEquality().equals(other.supabaseUrl, supabaseUrl)&&(identical(other.enableSubscription, enableSubscription) || other.enableSubscription == enableSubscription)&&(identical(other.enableInputKey, enableInputKey) || other.enableInputKey == enableInputKey)&&const DeepCollectionEquality().equals(other.revenueAppleApiKey, revenueAppleApiKey)&&const DeepCollectionEquality().equals(other.revenueGoogleApiKey, revenueGoogleApiKey)&&const DeepCollectionEquality().equals(other.revenueProductsIos, revenueProductsIos)&&const DeepCollectionEquality().equals(other.revenueProductsAndroid, revenueProductsAndroid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enableChat,const DeepCollectionEquality().hash(supabaseAnonKey),const DeepCollectionEquality().hash(supabaseUrl),enableSubscription,enableInputKey,const DeepCollectionEquality().hash(revenueAppleApiKey),const DeepCollectionEquality().hash(revenueGoogleApiKey),const DeepCollectionEquality().hash(revenueProductsIos),const DeepCollectionEquality().hash(revenueProductsAndroid));

@override
String toString() {
  return 'ChatGPT(enableChat: $enableChat, supabaseAnonKey: $supabaseAnonKey, supabaseUrl: $supabaseUrl, enableSubscription: $enableSubscription, enableInputKey: $enableInputKey, revenueAppleApiKey: $revenueAppleApiKey, revenueGoogleApiKey: $revenueGoogleApiKey, revenueProductsIos: $revenueProductsIos, revenueProductsAndroid: $revenueProductsAndroid)';
}


}

/// @nodoc
abstract mixin class $ChatGPTCopyWith<$Res>  {
  factory $ChatGPTCopyWith(ChatGPT value, $Res Function(ChatGPT) _then) = _$ChatGPTCopyWithImpl;
@useResult
$Res call({
 bool enableChat, dynamic supabaseAnonKey, dynamic supabaseUrl, bool enableSubscription, bool enableInputKey, dynamic revenueAppleApiKey, dynamic revenueGoogleApiKey, List<String> revenueProductsIos, List<String> revenueProductsAndroid
});




}
/// @nodoc
class _$ChatGPTCopyWithImpl<$Res>
    implements $ChatGPTCopyWith<$Res> {
  _$ChatGPTCopyWithImpl(this._self, this._then);

  final ChatGPT _self;
  final $Res Function(ChatGPT) _then;

/// Create a copy of ChatGPT
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enableChat = null,Object? supabaseAnonKey = freezed,Object? supabaseUrl = freezed,Object? enableSubscription = null,Object? enableInputKey = null,Object? revenueAppleApiKey = freezed,Object? revenueGoogleApiKey = freezed,Object? revenueProductsIos = null,Object? revenueProductsAndroid = null,}) {
  return _then(_self.copyWith(
enableChat: null == enableChat ? _self.enableChat : enableChat // ignore: cast_nullable_to_non_nullable
as bool,supabaseAnonKey: freezed == supabaseAnonKey ? _self.supabaseAnonKey : supabaseAnonKey // ignore: cast_nullable_to_non_nullable
as dynamic,supabaseUrl: freezed == supabaseUrl ? _self.supabaseUrl : supabaseUrl // ignore: cast_nullable_to_non_nullable
as dynamic,enableSubscription: null == enableSubscription ? _self.enableSubscription : enableSubscription // ignore: cast_nullable_to_non_nullable
as bool,enableInputKey: null == enableInputKey ? _self.enableInputKey : enableInputKey // ignore: cast_nullable_to_non_nullable
as bool,revenueAppleApiKey: freezed == revenueAppleApiKey ? _self.revenueAppleApiKey : revenueAppleApiKey // ignore: cast_nullable_to_non_nullable
as dynamic,revenueGoogleApiKey: freezed == revenueGoogleApiKey ? _self.revenueGoogleApiKey : revenueGoogleApiKey // ignore: cast_nullable_to_non_nullable
as dynamic,revenueProductsIos: null == revenueProductsIos ? _self.revenueProductsIos : revenueProductsIos // ignore: cast_nullable_to_non_nullable
as List<String>,revenueProductsAndroid: null == revenueProductsAndroid ? _self.revenueProductsAndroid : revenueProductsAndroid // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatGPT].
extension ChatGPTPatterns on ChatGPT {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatGPT value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatGPT() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatGPT value)  $default,){
final _that = this;
switch (_that) {
case _ChatGPT():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatGPT value)?  $default,){
final _that = this;
switch (_that) {
case _ChatGPT() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool enableChat,  dynamic supabaseAnonKey,  dynamic supabaseUrl,  bool enableSubscription,  bool enableInputKey,  dynamic revenueAppleApiKey,  dynamic revenueGoogleApiKey,  List<String> revenueProductsIos,  List<String> revenueProductsAndroid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatGPT() when $default != null:
return $default(_that.enableChat,_that.supabaseAnonKey,_that.supabaseUrl,_that.enableSubscription,_that.enableInputKey,_that.revenueAppleApiKey,_that.revenueGoogleApiKey,_that.revenueProductsIos,_that.revenueProductsAndroid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool enableChat,  dynamic supabaseAnonKey,  dynamic supabaseUrl,  bool enableSubscription,  bool enableInputKey,  dynamic revenueAppleApiKey,  dynamic revenueGoogleApiKey,  List<String> revenueProductsIos,  List<String> revenueProductsAndroid)  $default,) {final _that = this;
switch (_that) {
case _ChatGPT():
return $default(_that.enableChat,_that.supabaseAnonKey,_that.supabaseUrl,_that.enableSubscription,_that.enableInputKey,_that.revenueAppleApiKey,_that.revenueGoogleApiKey,_that.revenueProductsIos,_that.revenueProductsAndroid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool enableChat,  dynamic supabaseAnonKey,  dynamic supabaseUrl,  bool enableSubscription,  bool enableInputKey,  dynamic revenueAppleApiKey,  dynamic revenueGoogleApiKey,  List<String> revenueProductsIos,  List<String> revenueProductsAndroid)?  $default,) {final _that = this;
switch (_that) {
case _ChatGPT() when $default != null:
return $default(_that.enableChat,_that.supabaseAnonKey,_that.supabaseUrl,_that.enableSubscription,_that.enableInputKey,_that.revenueAppleApiKey,_that.revenueGoogleApiKey,_that.revenueProductsIos,_that.revenueProductsAndroid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatGPT extends ChatGPT {
  const _ChatGPT({this.enableChat = false, this.supabaseAnonKey = '', this.supabaseUrl = '', this.enableSubscription = false, this.enableInputKey = false, this.revenueAppleApiKey = '', this.revenueGoogleApiKey = '', final  List<String> revenueProductsIos = const [], final  List<String> revenueProductsAndroid = const []}): _revenueProductsIos = revenueProductsIos,_revenueProductsAndroid = revenueProductsAndroid,super._();
  factory _ChatGPT.fromJson(Map<String, dynamic> json) => _$ChatGPTFromJson(json);

@override@JsonKey() final  bool enableChat;
@override@JsonKey() final  dynamic supabaseAnonKey;
@override@JsonKey() final  dynamic supabaseUrl;
@override@JsonKey() final  bool enableSubscription;
@override@JsonKey() final  bool enableInputKey;
@override@JsonKey() final  dynamic revenueAppleApiKey;
@override@JsonKey() final  dynamic revenueGoogleApiKey;
 final  List<String> _revenueProductsIos;
@override@JsonKey() List<String> get revenueProductsIos {
  if (_revenueProductsIos is EqualUnmodifiableListView) return _revenueProductsIos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_revenueProductsIos);
}

 final  List<String> _revenueProductsAndroid;
@override@JsonKey() List<String> get revenueProductsAndroid {
  if (_revenueProductsAndroid is EqualUnmodifiableListView) return _revenueProductsAndroid;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_revenueProductsAndroid);
}


/// Create a copy of ChatGPT
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatGPTCopyWith<_ChatGPT> get copyWith => __$ChatGPTCopyWithImpl<_ChatGPT>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatGPTToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatGPT&&(identical(other.enableChat, enableChat) || other.enableChat == enableChat)&&const DeepCollectionEquality().equals(other.supabaseAnonKey, supabaseAnonKey)&&const DeepCollectionEquality().equals(other.supabaseUrl, supabaseUrl)&&(identical(other.enableSubscription, enableSubscription) || other.enableSubscription == enableSubscription)&&(identical(other.enableInputKey, enableInputKey) || other.enableInputKey == enableInputKey)&&const DeepCollectionEquality().equals(other.revenueAppleApiKey, revenueAppleApiKey)&&const DeepCollectionEquality().equals(other.revenueGoogleApiKey, revenueGoogleApiKey)&&const DeepCollectionEquality().equals(other._revenueProductsIos, _revenueProductsIos)&&const DeepCollectionEquality().equals(other._revenueProductsAndroid, _revenueProductsAndroid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enableChat,const DeepCollectionEquality().hash(supabaseAnonKey),const DeepCollectionEquality().hash(supabaseUrl),enableSubscription,enableInputKey,const DeepCollectionEquality().hash(revenueAppleApiKey),const DeepCollectionEquality().hash(revenueGoogleApiKey),const DeepCollectionEquality().hash(_revenueProductsIos),const DeepCollectionEquality().hash(_revenueProductsAndroid));

@override
String toString() {
  return 'ChatGPT(enableChat: $enableChat, supabaseAnonKey: $supabaseAnonKey, supabaseUrl: $supabaseUrl, enableSubscription: $enableSubscription, enableInputKey: $enableInputKey, revenueAppleApiKey: $revenueAppleApiKey, revenueGoogleApiKey: $revenueGoogleApiKey, revenueProductsIos: $revenueProductsIos, revenueProductsAndroid: $revenueProductsAndroid)';
}


}

/// @nodoc
abstract mixin class _$ChatGPTCopyWith<$Res> implements $ChatGPTCopyWith<$Res> {
  factory _$ChatGPTCopyWith(_ChatGPT value, $Res Function(_ChatGPT) _then) = __$ChatGPTCopyWithImpl;
@override @useResult
$Res call({
 bool enableChat, dynamic supabaseAnonKey, dynamic supabaseUrl, bool enableSubscription, bool enableInputKey, dynamic revenueAppleApiKey, dynamic revenueGoogleApiKey, List<String> revenueProductsIos, List<String> revenueProductsAndroid
});




}
/// @nodoc
class __$ChatGPTCopyWithImpl<$Res>
    implements _$ChatGPTCopyWith<$Res> {
  __$ChatGPTCopyWithImpl(this._self, this._then);

  final _ChatGPT _self;
  final $Res Function(_ChatGPT) _then;

/// Create a copy of ChatGPT
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enableChat = null,Object? supabaseAnonKey = freezed,Object? supabaseUrl = freezed,Object? enableSubscription = null,Object? enableInputKey = null,Object? revenueAppleApiKey = freezed,Object? revenueGoogleApiKey = freezed,Object? revenueProductsIos = null,Object? revenueProductsAndroid = null,}) {
  return _then(_ChatGPT(
enableChat: null == enableChat ? _self.enableChat : enableChat // ignore: cast_nullable_to_non_nullable
as bool,supabaseAnonKey: freezed == supabaseAnonKey ? _self.supabaseAnonKey : supabaseAnonKey // ignore: cast_nullable_to_non_nullable
as dynamic,supabaseUrl: freezed == supabaseUrl ? _self.supabaseUrl : supabaseUrl // ignore: cast_nullable_to_non_nullable
as dynamic,enableSubscription: null == enableSubscription ? _self.enableSubscription : enableSubscription // ignore: cast_nullable_to_non_nullable
as bool,enableInputKey: null == enableInputKey ? _self.enableInputKey : enableInputKey // ignore: cast_nullable_to_non_nullable
as bool,revenueAppleApiKey: freezed == revenueAppleApiKey ? _self.revenueAppleApiKey : revenueAppleApiKey // ignore: cast_nullable_to_non_nullable
as dynamic,revenueGoogleApiKey: freezed == revenueGoogleApiKey ? _self.revenueGoogleApiKey : revenueGoogleApiKey // ignore: cast_nullable_to_non_nullable
as dynamic,revenueProductsIos: null == revenueProductsIos ? _self._revenueProductsIos : revenueProductsIos // ignore: cast_nullable_to_non_nullable
as List<String>,revenueProductsAndroid: null == revenueProductsAndroid ? _self._revenueProductsAndroid : revenueProductsAndroid // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
