// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'station_search_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StationSearchResponse {

 int get total; int get page; int get pageSize; List<Station> get stations;
/// Create a copy of StationSearchResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StationSearchResponseCopyWith<StationSearchResponse> get copyWith => _$StationSearchResponseCopyWithImpl<StationSearchResponse>(this as StationSearchResponse, _$identity);

  /// Serializes this StationSearchResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StationSearchResponse&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&const DeepCollectionEquality().equals(other.stations, stations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,page,pageSize,const DeepCollectionEquality().hash(stations));

@override
String toString() {
  return 'StationSearchResponse(total: $total, page: $page, pageSize: $pageSize, stations: $stations)';
}


}

/// @nodoc
abstract mixin class $StationSearchResponseCopyWith<$Res>  {
  factory $StationSearchResponseCopyWith(StationSearchResponse value, $Res Function(StationSearchResponse) _then) = _$StationSearchResponseCopyWithImpl;
@useResult
$Res call({
 int total, int page, int pageSize, List<Station> stations
});




}
/// @nodoc
class _$StationSearchResponseCopyWithImpl<$Res>
    implements $StationSearchResponseCopyWith<$Res> {
  _$StationSearchResponseCopyWithImpl(this._self, this._then);

  final StationSearchResponse _self;
  final $Res Function(StationSearchResponse) _then;

/// Create a copy of StationSearchResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? page = null,Object? pageSize = null,Object? stations = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,stations: null == stations ? _self.stations : stations // ignore: cast_nullable_to_non_nullable
as List<Station>,
  ));
}

}


/// Adds pattern-matching-related methods to [StationSearchResponse].
extension StationSearchResponsePatterns on StationSearchResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StationSearchResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StationSearchResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StationSearchResponse value)  $default,){
final _that = this;
switch (_that) {
case _StationSearchResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StationSearchResponse value)?  $default,){
final _that = this;
switch (_that) {
case _StationSearchResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  int page,  int pageSize,  List<Station> stations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StationSearchResponse() when $default != null:
return $default(_that.total,_that.page,_that.pageSize,_that.stations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  int page,  int pageSize,  List<Station> stations)  $default,) {final _that = this;
switch (_that) {
case _StationSearchResponse():
return $default(_that.total,_that.page,_that.pageSize,_that.stations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  int page,  int pageSize,  List<Station> stations)?  $default,) {final _that = this;
switch (_that) {
case _StationSearchResponse() when $default != null:
return $default(_that.total,_that.page,_that.pageSize,_that.stations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StationSearchResponse implements StationSearchResponse {
  const _StationSearchResponse({required this.total, required this.page, required this.pageSize, required final  List<Station> stations}): _stations = stations;
  factory _StationSearchResponse.fromJson(Map<String, dynamic> json) => _$StationSearchResponseFromJson(json);

@override final  int total;
@override final  int page;
@override final  int pageSize;
 final  List<Station> _stations;
@override List<Station> get stations {
  if (_stations is EqualUnmodifiableListView) return _stations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stations);
}


/// Create a copy of StationSearchResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StationSearchResponseCopyWith<_StationSearchResponse> get copyWith => __$StationSearchResponseCopyWithImpl<_StationSearchResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StationSearchResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StationSearchResponse&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&const DeepCollectionEquality().equals(other._stations, _stations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,page,pageSize,const DeepCollectionEquality().hash(_stations));

@override
String toString() {
  return 'StationSearchResponse(total: $total, page: $page, pageSize: $pageSize, stations: $stations)';
}


}

/// @nodoc
abstract mixin class _$StationSearchResponseCopyWith<$Res> implements $StationSearchResponseCopyWith<$Res> {
  factory _$StationSearchResponseCopyWith(_StationSearchResponse value, $Res Function(_StationSearchResponse) _then) = __$StationSearchResponseCopyWithImpl;
@override @useResult
$Res call({
 int total, int page, int pageSize, List<Station> stations
});




}
/// @nodoc
class __$StationSearchResponseCopyWithImpl<$Res>
    implements _$StationSearchResponseCopyWith<$Res> {
  __$StationSearchResponseCopyWithImpl(this._self, this._then);

  final _StationSearchResponse _self;
  final $Res Function(_StationSearchResponse) _then;

/// Create a copy of StationSearchResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? page = null,Object? pageSize = null,Object? stations = null,}) {
  return _then(_StationSearchResponse(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,stations: null == stations ? _self._stations : stations // ignore: cast_nullable_to_non_nullable
as List<Station>,
  ));
}


}

// dart format on
