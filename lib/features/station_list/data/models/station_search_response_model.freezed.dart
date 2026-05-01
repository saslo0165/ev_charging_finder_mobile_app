// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'station_search_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StationSearchResponseModel {

 int get total; int get page;@JsonKey(name: 'page_size') int get pageSize; List<StationModel> get stations;
/// Create a copy of StationSearchResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StationSearchResponseModelCopyWith<StationSearchResponseModel> get copyWith => _$StationSearchResponseModelCopyWithImpl<StationSearchResponseModel>(this as StationSearchResponseModel, _$identity);

  /// Serializes this StationSearchResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StationSearchResponseModel&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&const DeepCollectionEquality().equals(other.stations, stations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,page,pageSize,const DeepCollectionEquality().hash(stations));

@override
String toString() {
  return 'StationSearchResponseModel(total: $total, page: $page, pageSize: $pageSize, stations: $stations)';
}


}

/// @nodoc
abstract mixin class $StationSearchResponseModelCopyWith<$Res>  {
  factory $StationSearchResponseModelCopyWith(StationSearchResponseModel value, $Res Function(StationSearchResponseModel) _then) = _$StationSearchResponseModelCopyWithImpl;
@useResult
$Res call({
 int total, int page,@JsonKey(name: 'page_size') int pageSize, List<StationModel> stations
});




}
/// @nodoc
class _$StationSearchResponseModelCopyWithImpl<$Res>
    implements $StationSearchResponseModelCopyWith<$Res> {
  _$StationSearchResponseModelCopyWithImpl(this._self, this._then);

  final StationSearchResponseModel _self;
  final $Res Function(StationSearchResponseModel) _then;

/// Create a copy of StationSearchResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? page = null,Object? pageSize = null,Object? stations = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,stations: null == stations ? _self.stations : stations // ignore: cast_nullable_to_non_nullable
as List<StationModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [StationSearchResponseModel].
extension StationSearchResponseModelPatterns on StationSearchResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StationSearchResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StationSearchResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StationSearchResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _StationSearchResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StationSearchResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _StationSearchResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  int page, @JsonKey(name: 'page_size')  int pageSize,  List<StationModel> stations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StationSearchResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  int page, @JsonKey(name: 'page_size')  int pageSize,  List<StationModel> stations)  $default,) {final _that = this;
switch (_that) {
case _StationSearchResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  int page, @JsonKey(name: 'page_size')  int pageSize,  List<StationModel> stations)?  $default,) {final _that = this;
switch (_that) {
case _StationSearchResponseModel() when $default != null:
return $default(_that.total,_that.page,_that.pageSize,_that.stations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StationSearchResponseModel extends StationSearchResponseModel {
  const _StationSearchResponseModel({required this.total, required this.page, @JsonKey(name: 'page_size') required this.pageSize, required final  List<StationModel> stations}): _stations = stations,super._();
  factory _StationSearchResponseModel.fromJson(Map<String, dynamic> json) => _$StationSearchResponseModelFromJson(json);

@override final  int total;
@override final  int page;
@override@JsonKey(name: 'page_size') final  int pageSize;
 final  List<StationModel> _stations;
@override List<StationModel> get stations {
  if (_stations is EqualUnmodifiableListView) return _stations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stations);
}


/// Create a copy of StationSearchResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StationSearchResponseModelCopyWith<_StationSearchResponseModel> get copyWith => __$StationSearchResponseModelCopyWithImpl<_StationSearchResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StationSearchResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StationSearchResponseModel&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&const DeepCollectionEquality().equals(other._stations, _stations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,page,pageSize,const DeepCollectionEquality().hash(_stations));

@override
String toString() {
  return 'StationSearchResponseModel(total: $total, page: $page, pageSize: $pageSize, stations: $stations)';
}


}

/// @nodoc
abstract mixin class _$StationSearchResponseModelCopyWith<$Res> implements $StationSearchResponseModelCopyWith<$Res> {
  factory _$StationSearchResponseModelCopyWith(_StationSearchResponseModel value, $Res Function(_StationSearchResponseModel) _then) = __$StationSearchResponseModelCopyWithImpl;
@override @useResult
$Res call({
 int total, int page,@JsonKey(name: 'page_size') int pageSize, List<StationModel> stations
});




}
/// @nodoc
class __$StationSearchResponseModelCopyWithImpl<$Res>
    implements _$StationSearchResponseModelCopyWith<$Res> {
  __$StationSearchResponseModelCopyWithImpl(this._self, this._then);

  final _StationSearchResponseModel _self;
  final $Res Function(_StationSearchResponseModel) _then;

/// Create a copy of StationSearchResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? page = null,Object? pageSize = null,Object? stations = null,}) {
  return _then(_StationSearchResponseModel(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,stations: null == stations ? _self._stations : stations // ignore: cast_nullable_to_non_nullable
as List<StationModel>,
  ));
}


}

// dart format on
