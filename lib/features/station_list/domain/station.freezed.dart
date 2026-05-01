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

 String get id; String get name; String get description; String get address; double get latitude; double get longitude; String get city; String get state; String get country; List<String> get connectorTypes; String get chargingSpeed; int get totalPorts; int get availablePorts; String get status; double get distanceKm; String get providerName; double get maxPowerKw; bool get isFavorite; bool get isPublic; String get accessType; int? get verifiedBy; String? get pricingInfo; String? get workingHours; List<String> get photos;
/// Create a copy of Station
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StationCopyWith<Station> get copyWith => _$StationCopyWithImpl<Station>(this as Station, _$identity);

  /// Serializes this Station to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Station&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.country, country) || other.country == country)&&const DeepCollectionEquality().equals(other.connectorTypes, connectorTypes)&&(identical(other.chargingSpeed, chargingSpeed) || other.chargingSpeed == chargingSpeed)&&(identical(other.totalPorts, totalPorts) || other.totalPorts == totalPorts)&&(identical(other.availablePorts, availablePorts) || other.availablePorts == availablePorts)&&(identical(other.status, status) || other.status == status)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.providerName, providerName) || other.providerName == providerName)&&(identical(other.maxPowerKw, maxPowerKw) || other.maxPowerKw == maxPowerKw)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.accessType, accessType) || other.accessType == accessType)&&(identical(other.verifiedBy, verifiedBy) || other.verifiedBy == verifiedBy)&&(identical(other.pricingInfo, pricingInfo) || other.pricingInfo == pricingInfo)&&(identical(other.workingHours, workingHours) || other.workingHours == workingHours)&&const DeepCollectionEquality().equals(other.photos, photos));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,description,address,latitude,longitude,city,state,country,const DeepCollectionEquality().hash(connectorTypes),chargingSpeed,totalPorts,availablePorts,status,distanceKm,providerName,maxPowerKw,isFavorite,isPublic,accessType,verifiedBy,pricingInfo,workingHours,const DeepCollectionEquality().hash(photos)]);

@override
String toString() {
  return 'Station(id: $id, name: $name, description: $description, address: $address, latitude: $latitude, longitude: $longitude, city: $city, state: $state, country: $country, connectorTypes: $connectorTypes, chargingSpeed: $chargingSpeed, totalPorts: $totalPorts, availablePorts: $availablePorts, status: $status, distanceKm: $distanceKm, providerName: $providerName, maxPowerKw: $maxPowerKw, isFavorite: $isFavorite, isPublic: $isPublic, accessType: $accessType, verifiedBy: $verifiedBy, pricingInfo: $pricingInfo, workingHours: $workingHours, photos: $photos)';
}


}

/// @nodoc
abstract mixin class $StationCopyWith<$Res>  {
  factory $StationCopyWith(Station value, $Res Function(Station) _then) = _$StationCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, String address, double latitude, double longitude, String city, String state, String country, List<String> connectorTypes, String chargingSpeed, int totalPorts, int availablePorts, String status, double distanceKm, String providerName, double maxPowerKw, bool isFavorite, bool isPublic, String accessType, int? verifiedBy, String? pricingInfo, String? workingHours, List<String> photos
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? address = null,Object? latitude = null,Object? longitude = null,Object? city = null,Object? state = null,Object? country = null,Object? connectorTypes = null,Object? chargingSpeed = null,Object? totalPorts = null,Object? availablePorts = null,Object? status = null,Object? distanceKm = null,Object? providerName = null,Object? maxPowerKw = null,Object? isFavorite = null,Object? isPublic = null,Object? accessType = null,Object? verifiedBy = freezed,Object? pricingInfo = freezed,Object? workingHours = freezed,Object? photos = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,connectorTypes: null == connectorTypes ? _self.connectorTypes : connectorTypes // ignore: cast_nullable_to_non_nullable
as List<String>,chargingSpeed: null == chargingSpeed ? _self.chargingSpeed : chargingSpeed // ignore: cast_nullable_to_non_nullable
as String,totalPorts: null == totalPorts ? _self.totalPorts : totalPorts // ignore: cast_nullable_to_non_nullable
as int,availablePorts: null == availablePorts ? _self.availablePorts : availablePorts // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,distanceKm: null == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double,providerName: null == providerName ? _self.providerName : providerName // ignore: cast_nullable_to_non_nullable
as String,maxPowerKw: null == maxPowerKw ? _self.maxPowerKw : maxPowerKw // ignore: cast_nullable_to_non_nullable
as double,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,accessType: null == accessType ? _self.accessType : accessType // ignore: cast_nullable_to_non_nullable
as String,verifiedBy: freezed == verifiedBy ? _self.verifiedBy : verifiedBy // ignore: cast_nullable_to_non_nullable
as int?,pricingInfo: freezed == pricingInfo ? _self.pricingInfo : pricingInfo // ignore: cast_nullable_to_non_nullable
as String?,workingHours: freezed == workingHours ? _self.workingHours : workingHours // ignore: cast_nullable_to_non_nullable
as String?,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String address,  double latitude,  double longitude,  String city,  String state,  String country,  List<String> connectorTypes,  String chargingSpeed,  int totalPorts,  int availablePorts,  String status,  double distanceKm,  String providerName,  double maxPowerKw,  bool isFavorite,  bool isPublic,  String accessType,  int? verifiedBy,  String? pricingInfo,  String? workingHours,  List<String> photos)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Station() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.address,_that.latitude,_that.longitude,_that.city,_that.state,_that.country,_that.connectorTypes,_that.chargingSpeed,_that.totalPorts,_that.availablePorts,_that.status,_that.distanceKm,_that.providerName,_that.maxPowerKw,_that.isFavorite,_that.isPublic,_that.accessType,_that.verifiedBy,_that.pricingInfo,_that.workingHours,_that.photos);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String address,  double latitude,  double longitude,  String city,  String state,  String country,  List<String> connectorTypes,  String chargingSpeed,  int totalPorts,  int availablePorts,  String status,  double distanceKm,  String providerName,  double maxPowerKw,  bool isFavorite,  bool isPublic,  String accessType,  int? verifiedBy,  String? pricingInfo,  String? workingHours,  List<String> photos)  $default,) {final _that = this;
switch (_that) {
case _Station():
return $default(_that.id,_that.name,_that.description,_that.address,_that.latitude,_that.longitude,_that.city,_that.state,_that.country,_that.connectorTypes,_that.chargingSpeed,_that.totalPorts,_that.availablePorts,_that.status,_that.distanceKm,_that.providerName,_that.maxPowerKw,_that.isFavorite,_that.isPublic,_that.accessType,_that.verifiedBy,_that.pricingInfo,_that.workingHours,_that.photos);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  String address,  double latitude,  double longitude,  String city,  String state,  String country,  List<String> connectorTypes,  String chargingSpeed,  int totalPorts,  int availablePorts,  String status,  double distanceKm,  String providerName,  double maxPowerKw,  bool isFavorite,  bool isPublic,  String accessType,  int? verifiedBy,  String? pricingInfo,  String? workingHours,  List<String> photos)?  $default,) {final _that = this;
switch (_that) {
case _Station() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.address,_that.latitude,_that.longitude,_that.city,_that.state,_that.country,_that.connectorTypes,_that.chargingSpeed,_that.totalPorts,_that.availablePorts,_that.status,_that.distanceKm,_that.providerName,_that.maxPowerKw,_that.isFavorite,_that.isPublic,_that.accessType,_that.verifiedBy,_that.pricingInfo,_that.workingHours,_that.photos);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Station implements Station {
  const _Station({required this.id, required this.name, this.description = '', required this.address, required this.latitude, required this.longitude, required this.city, required this.state, required this.country, required final  List<String> connectorTypes, required this.chargingSpeed, required this.totalPorts, required this.availablePorts, required this.status, required this.distanceKm, required this.providerName, required this.maxPowerKw, this.isFavorite = false, this.isPublic = true, this.accessType = 'public', this.verifiedBy, this.pricingInfo, this.workingHours, final  List<String> photos = const []}): _connectorTypes = connectorTypes,_photos = photos;
  factory _Station.fromJson(Map<String, dynamic> json) => _$StationFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey() final  String description;
@override final  String address;
@override final  double latitude;
@override final  double longitude;
@override final  String city;
@override final  String state;
@override final  String country;
 final  List<String> _connectorTypes;
@override List<String> get connectorTypes {
  if (_connectorTypes is EqualUnmodifiableListView) return _connectorTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_connectorTypes);
}

@override final  String chargingSpeed;
@override final  int totalPorts;
@override final  int availablePorts;
@override final  String status;
@override final  double distanceKm;
@override final  String providerName;
@override final  double maxPowerKw;
@override@JsonKey() final  bool isFavorite;
@override@JsonKey() final  bool isPublic;
@override@JsonKey() final  String accessType;
@override final  int? verifiedBy;
@override final  String? pricingInfo;
@override final  String? workingHours;
 final  List<String> _photos;
@override@JsonKey() List<String> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Station&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.country, country) || other.country == country)&&const DeepCollectionEquality().equals(other._connectorTypes, _connectorTypes)&&(identical(other.chargingSpeed, chargingSpeed) || other.chargingSpeed == chargingSpeed)&&(identical(other.totalPorts, totalPorts) || other.totalPorts == totalPorts)&&(identical(other.availablePorts, availablePorts) || other.availablePorts == availablePorts)&&(identical(other.status, status) || other.status == status)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.providerName, providerName) || other.providerName == providerName)&&(identical(other.maxPowerKw, maxPowerKw) || other.maxPowerKw == maxPowerKw)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.accessType, accessType) || other.accessType == accessType)&&(identical(other.verifiedBy, verifiedBy) || other.verifiedBy == verifiedBy)&&(identical(other.pricingInfo, pricingInfo) || other.pricingInfo == pricingInfo)&&(identical(other.workingHours, workingHours) || other.workingHours == workingHours)&&const DeepCollectionEquality().equals(other._photos, _photos));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,description,address,latitude,longitude,city,state,country,const DeepCollectionEquality().hash(_connectorTypes),chargingSpeed,totalPorts,availablePorts,status,distanceKm,providerName,maxPowerKw,isFavorite,isPublic,accessType,verifiedBy,pricingInfo,workingHours,const DeepCollectionEquality().hash(_photos)]);

@override
String toString() {
  return 'Station(id: $id, name: $name, description: $description, address: $address, latitude: $latitude, longitude: $longitude, city: $city, state: $state, country: $country, connectorTypes: $connectorTypes, chargingSpeed: $chargingSpeed, totalPorts: $totalPorts, availablePorts: $availablePorts, status: $status, distanceKm: $distanceKm, providerName: $providerName, maxPowerKw: $maxPowerKw, isFavorite: $isFavorite, isPublic: $isPublic, accessType: $accessType, verifiedBy: $verifiedBy, pricingInfo: $pricingInfo, workingHours: $workingHours, photos: $photos)';
}


}

/// @nodoc
abstract mixin class _$StationCopyWith<$Res> implements $StationCopyWith<$Res> {
  factory _$StationCopyWith(_Station value, $Res Function(_Station) _then) = __$StationCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, String address, double latitude, double longitude, String city, String state, String country, List<String> connectorTypes, String chargingSpeed, int totalPorts, int availablePorts, String status, double distanceKm, String providerName, double maxPowerKw, bool isFavorite, bool isPublic, String accessType, int? verifiedBy, String? pricingInfo, String? workingHours, List<String> photos
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? address = null,Object? latitude = null,Object? longitude = null,Object? city = null,Object? state = null,Object? country = null,Object? connectorTypes = null,Object? chargingSpeed = null,Object? totalPorts = null,Object? availablePorts = null,Object? status = null,Object? distanceKm = null,Object? providerName = null,Object? maxPowerKw = null,Object? isFavorite = null,Object? isPublic = null,Object? accessType = null,Object? verifiedBy = freezed,Object? pricingInfo = freezed,Object? workingHours = freezed,Object? photos = null,}) {
  return _then(_Station(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,connectorTypes: null == connectorTypes ? _self._connectorTypes : connectorTypes // ignore: cast_nullable_to_non_nullable
as List<String>,chargingSpeed: null == chargingSpeed ? _self.chargingSpeed : chargingSpeed // ignore: cast_nullable_to_non_nullable
as String,totalPorts: null == totalPorts ? _self.totalPorts : totalPorts // ignore: cast_nullable_to_non_nullable
as int,availablePorts: null == availablePorts ? _self.availablePorts : availablePorts // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,distanceKm: null == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double,providerName: null == providerName ? _self.providerName : providerName // ignore: cast_nullable_to_non_nullable
as String,maxPowerKw: null == maxPowerKw ? _self.maxPowerKw : maxPowerKw // ignore: cast_nullable_to_non_nullable
as double,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,accessType: null == accessType ? _self.accessType : accessType // ignore: cast_nullable_to_non_nullable
as String,verifiedBy: freezed == verifiedBy ? _self.verifiedBy : verifiedBy // ignore: cast_nullable_to_non_nullable
as int?,pricingInfo: freezed == pricingInfo ? _self.pricingInfo : pricingInfo // ignore: cast_nullable_to_non_nullable
as String?,workingHours: freezed == workingHours ? _self.workingHours : workingHours // ignore: cast_nullable_to_non_nullable
as String?,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
