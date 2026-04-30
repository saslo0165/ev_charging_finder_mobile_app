// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'station.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Station {

 String get id; String get name; String get address; double get latitude; double get longitude; double get distanceKm; int get availableConnectors; int get totalConnectors; double get maxPowerKw; String get providerName; bool get isFavorite; bool get isWorking;
/// Create a copy of Station
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StationCopyWith<Station> get copyWith => _$StationCopyWithImpl<Station>(this as Station, _$identity);

  /// Serializes this Station to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Station&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.availableConnectors, availableConnectors) || other.availableConnectors == availableConnectors)&&(identical(other.totalConnectors, totalConnectors) || other.totalConnectors == totalConnectors)&&(identical(other.maxPowerKw, maxPowerKw) || other.maxPowerKw == maxPowerKw)&&(identical(other.providerName, providerName) || other.providerName == providerName)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.isWorking, isWorking) || other.isWorking == isWorking));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,address,latitude,longitude,distanceKm,availableConnectors,totalConnectors,maxPowerKw,providerName,isFavorite,isWorking);

@override
String toString() {
  return 'Station(id: $id, name: $name, address: $address, latitude: $latitude, longitude: $longitude, distanceKm: $distanceKm, availableConnectors: $availableConnectors, totalConnectors: $totalConnectors, maxPowerKw: $maxPowerKw, providerName: $providerName, isFavorite: $isFavorite, isWorking: $isWorking)';
}


}

/// @nodoc
abstract mixin class $StationCopyWith<$Res>  {
  factory $StationCopyWith(Station value, $Res Function(Station) _then) = _$StationCopyWithImpl;
@useResult
$Res call({
 String id, String name, String address, double latitude, double longitude, double distanceKm, int availableConnectors, int totalConnectors, double maxPowerKw, String providerName, bool isFavorite, bool isWorking
});




}
/// @nodoc
class _$StationCopyWithImpl<$Res>
    implements $StationCopyWith<$Res> {
  _$StationCopyWithImpl(this._self, this._then);

  final Station _self;
  final $Res Function(Station) _then;

/// Create a copy of Station
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? address = null,Object? latitude = null,Object? longitude = null,Object? distanceKm = null,Object? availableConnectors = null,Object? totalConnectors = null,Object? maxPowerKw = null,Object? providerName = null,Object? isFavorite = null,Object? isWorking = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,distanceKm: null == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double,availableConnectors: null == availableConnectors ? _self.availableConnectors : availableConnectors // ignore: cast_nullable_to_non_nullable
as int,totalConnectors: null == totalConnectors ? _self.totalConnectors : totalConnectors // ignore: cast_nullable_to_non_nullable
as int,maxPowerKw: null == maxPowerKw ? _self.maxPowerKw : maxPowerKw // ignore: cast_nullable_to_non_nullable
as double,providerName: null == providerName ? _self.providerName : providerName // ignore: cast_nullable_to_non_nullable
as String,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,isWorking: null == isWorking ? _self.isWorking : isWorking // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Station].
extension StationPatterns on Station {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Station value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Station() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Station value)  $default,){
final _that = this;
switch (_that) {
case _Station():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Station value)?  $default,){
final _that = this;
switch (_that) {
case _Station() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String address,  double latitude,  double longitude,  double distanceKm,  int availableConnectors,  int totalConnectors,  double maxPowerKw,  String providerName,  bool isFavorite,  bool isWorking)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Station() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.latitude,_that.longitude,_that.distanceKm,_that.availableConnectors,_that.totalConnectors,_that.maxPowerKw,_that.providerName,_that.isFavorite,_that.isWorking);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String address,  double latitude,  double longitude,  double distanceKm,  int availableConnectors,  int totalConnectors,  double maxPowerKw,  String providerName,  bool isFavorite,  bool isWorking)  $default,) {final _that = this;
switch (_that) {
case _Station():
return $default(_that.id,_that.name,_that.address,_that.latitude,_that.longitude,_that.distanceKm,_that.availableConnectors,_that.totalConnectors,_that.maxPowerKw,_that.providerName,_that.isFavorite,_that.isWorking);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String address,  double latitude,  double longitude,  double distanceKm,  int availableConnectors,  int totalConnectors,  double maxPowerKw,  String providerName,  bool isFavorite,  bool isWorking)?  $default,) {final _that = this;
switch (_that) {
case _Station() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.latitude,_that.longitude,_that.distanceKm,_that.availableConnectors,_that.totalConnectors,_that.maxPowerKw,_that.providerName,_that.isFavorite,_that.isWorking);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Station implements Station {
  const _Station({required this.id, required this.name, required this.address, required this.latitude, required this.longitude, required this.distanceKm, required this.availableConnectors, required this.totalConnectors, required this.maxPowerKw, required this.providerName, this.isFavorite = false, this.isWorking = true});
  factory _Station.fromJson(Map<String, dynamic> json) => _$StationFromJson(json);

@override final  String id;
@override final  String name;
@override final  String address;
@override final  double latitude;
@override final  double longitude;
@override final  double distanceKm;
@override final  int availableConnectors;
@override final  int totalConnectors;
@override final  double maxPowerKw;
@override final  String providerName;
@override@JsonKey() final  bool isFavorite;
@override@JsonKey() final  bool isWorking;

/// Create a copy of Station
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StationCopyWith<_Station> get copyWith => __$StationCopyWithImpl<_Station>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Station&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.availableConnectors, availableConnectors) || other.availableConnectors == availableConnectors)&&(identical(other.totalConnectors, totalConnectors) || other.totalConnectors == totalConnectors)&&(identical(other.maxPowerKw, maxPowerKw) || other.maxPowerKw == maxPowerKw)&&(identical(other.providerName, providerName) || other.providerName == providerName)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.isWorking, isWorking) || other.isWorking == isWorking));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,address,latitude,longitude,distanceKm,availableConnectors,totalConnectors,maxPowerKw,providerName,isFavorite,isWorking);

@override
String toString() {
  return 'Station(id: $id, name: $name, address: $address, latitude: $latitude, longitude: $longitude, distanceKm: $distanceKm, availableConnectors: $availableConnectors, totalConnectors: $totalConnectors, maxPowerKw: $maxPowerKw, providerName: $providerName, isFavorite: $isFavorite, isWorking: $isWorking)';
}


}

/// @nodoc
abstract mixin class _$StationCopyWith<$Res> implements $StationCopyWith<$Res> {
  factory _$StationCopyWith(_Station value, $Res Function(_Station) _then) = __$StationCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String address, double latitude, double longitude, double distanceKm, int availableConnectors, int totalConnectors, double maxPowerKw, String providerName, bool isFavorite, bool isWorking
});




}
/// @nodoc
class __$StationCopyWithImpl<$Res>
    implements _$StationCopyWith<$Res> {
  __$StationCopyWithImpl(this._self, this._then);

  final _Station _self;
  final $Res Function(_Station) _then;

/// Create a copy of Station
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? address = null,Object? latitude = null,Object? longitude = null,Object? distanceKm = null,Object? availableConnectors = null,Object? totalConnectors = null,Object? maxPowerKw = null,Object? providerName = null,Object? isFavorite = null,Object? isWorking = null,}) {
  return _then(_Station(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,distanceKm: null == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double,availableConnectors: null == availableConnectors ? _self.availableConnectors : availableConnectors // ignore: cast_nullable_to_non_nullable
as int,totalConnectors: null == totalConnectors ? _self.totalConnectors : totalConnectors // ignore: cast_nullable_to_non_nullable
as int,maxPowerKw: null == maxPowerKw ? _self.maxPowerKw : maxPowerKw // ignore: cast_nullable_to_non_nullable
as double,providerName: null == providerName ? _self.providerName : providerName // ignore: cast_nullable_to_non_nullable
as String,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,isWorking: null == isWorking ? _self.isWorking : isWorking // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
