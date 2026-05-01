// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'station_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StationModel {

 int get id; String get name; String get description; String get address; String get city; String get state; String get country; double get latitude; double get longitude;@JsonKey(name: 'connector_types') List<String> get connectorTypes;@JsonKey(name: 'charging_speed') String get chargingSpeed;@JsonKey(name: 'total_ports') int get totalPorts;@JsonKey(name: 'available_ports') int get availablePorts;@JsonKey(name: 'is_public') bool get isPublic;@JsonKey(name: 'access_type') String get accessType;@JsonKey(name: 'verified_by') int? get verifiedBy; String get status;@JsonKey(name: 'pricing_info') String? get pricingInfo;@JsonKey(name: 'working_hours') String? get workingHours; List<String> get photos;
/// Create a copy of StationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StationModelCopyWith<StationModel> get copyWith => _$StationModelCopyWithImpl<StationModel>(this as StationModel, _$identity);

  /// Serializes this StationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.country, country) || other.country == country)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&const DeepCollectionEquality().equals(other.connectorTypes, connectorTypes)&&(identical(other.chargingSpeed, chargingSpeed) || other.chargingSpeed == chargingSpeed)&&(identical(other.totalPorts, totalPorts) || other.totalPorts == totalPorts)&&(identical(other.availablePorts, availablePorts) || other.availablePorts == availablePorts)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.accessType, accessType) || other.accessType == accessType)&&(identical(other.verifiedBy, verifiedBy) || other.verifiedBy == verifiedBy)&&(identical(other.status, status) || other.status == status)&&(identical(other.pricingInfo, pricingInfo) || other.pricingInfo == pricingInfo)&&(identical(other.workingHours, workingHours) || other.workingHours == workingHours)&&const DeepCollectionEquality().equals(other.photos, photos));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,description,address,city,state,country,latitude,longitude,const DeepCollectionEquality().hash(connectorTypes),chargingSpeed,totalPorts,availablePorts,isPublic,accessType,verifiedBy,status,pricingInfo,workingHours,const DeepCollectionEquality().hash(photos)]);

@override
String toString() {
  return 'StationModel(id: $id, name: $name, description: $description, address: $address, city: $city, state: $state, country: $country, latitude: $latitude, longitude: $longitude, connectorTypes: $connectorTypes, chargingSpeed: $chargingSpeed, totalPorts: $totalPorts, availablePorts: $availablePorts, isPublic: $isPublic, accessType: $accessType, verifiedBy: $verifiedBy, status: $status, pricingInfo: $pricingInfo, workingHours: $workingHours, photos: $photos)';
}


}

/// @nodoc
abstract mixin class $StationModelCopyWith<$Res>  {
  factory $StationModelCopyWith(StationModel value, $Res Function(StationModel) _then) = _$StationModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String description, String address, String city, String state, String country, double latitude, double longitude,@JsonKey(name: 'connector_types') List<String> connectorTypes,@JsonKey(name: 'charging_speed') String chargingSpeed,@JsonKey(name: 'total_ports') int totalPorts,@JsonKey(name: 'available_ports') int availablePorts,@JsonKey(name: 'is_public') bool isPublic,@JsonKey(name: 'access_type') String accessType,@JsonKey(name: 'verified_by') int? verifiedBy, String status,@JsonKey(name: 'pricing_info') String? pricingInfo,@JsonKey(name: 'working_hours') String? workingHours, List<String> photos
});




}
/// @nodoc
class _$StationModelCopyWithImpl<$Res>
    implements $StationModelCopyWith<$Res> {
  _$StationModelCopyWithImpl(this._self, this._then);

  final StationModel _self;
  final $Res Function(StationModel) _then;

/// Create a copy of StationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? address = null,Object? city = null,Object? state = null,Object? country = null,Object? latitude = null,Object? longitude = null,Object? connectorTypes = null,Object? chargingSpeed = null,Object? totalPorts = null,Object? availablePorts = null,Object? isPublic = null,Object? accessType = null,Object? verifiedBy = freezed,Object? status = null,Object? pricingInfo = freezed,Object? workingHours = freezed,Object? photos = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,connectorTypes: null == connectorTypes ? _self.connectorTypes : connectorTypes // ignore: cast_nullable_to_non_nullable
as List<String>,chargingSpeed: null == chargingSpeed ? _self.chargingSpeed : chargingSpeed // ignore: cast_nullable_to_non_nullable
as String,totalPorts: null == totalPorts ? _self.totalPorts : totalPorts // ignore: cast_nullable_to_non_nullable
as int,availablePorts: null == availablePorts ? _self.availablePorts : availablePorts // ignore: cast_nullable_to_non_nullable
as int,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,accessType: null == accessType ? _self.accessType : accessType // ignore: cast_nullable_to_non_nullable
as String,verifiedBy: freezed == verifiedBy ? _self.verifiedBy : verifiedBy // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,pricingInfo: freezed == pricingInfo ? _self.pricingInfo : pricingInfo // ignore: cast_nullable_to_non_nullable
as String?,workingHours: freezed == workingHours ? _self.workingHours : workingHours // ignore: cast_nullable_to_non_nullable
as String?,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [StationModel].
extension StationModelPatterns on StationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StationModel value)  $default,){
final _that = this;
switch (_that) {
case _StationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StationModel value)?  $default,){
final _that = this;
switch (_that) {
case _StationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String description,  String address,  String city,  String state,  String country,  double latitude,  double longitude, @JsonKey(name: 'connector_types')  List<String> connectorTypes, @JsonKey(name: 'charging_speed')  String chargingSpeed, @JsonKey(name: 'total_ports')  int totalPorts, @JsonKey(name: 'available_ports')  int availablePorts, @JsonKey(name: 'is_public')  bool isPublic, @JsonKey(name: 'access_type')  String accessType, @JsonKey(name: 'verified_by')  int? verifiedBy,  String status, @JsonKey(name: 'pricing_info')  String? pricingInfo, @JsonKey(name: 'working_hours')  String? workingHours,  List<String> photos)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StationModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.address,_that.city,_that.state,_that.country,_that.latitude,_that.longitude,_that.connectorTypes,_that.chargingSpeed,_that.totalPorts,_that.availablePorts,_that.isPublic,_that.accessType,_that.verifiedBy,_that.status,_that.pricingInfo,_that.workingHours,_that.photos);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String description,  String address,  String city,  String state,  String country,  double latitude,  double longitude, @JsonKey(name: 'connector_types')  List<String> connectorTypes, @JsonKey(name: 'charging_speed')  String chargingSpeed, @JsonKey(name: 'total_ports')  int totalPorts, @JsonKey(name: 'available_ports')  int availablePorts, @JsonKey(name: 'is_public')  bool isPublic, @JsonKey(name: 'access_type')  String accessType, @JsonKey(name: 'verified_by')  int? verifiedBy,  String status, @JsonKey(name: 'pricing_info')  String? pricingInfo, @JsonKey(name: 'working_hours')  String? workingHours,  List<String> photos)  $default,) {final _that = this;
switch (_that) {
case _StationModel():
return $default(_that.id,_that.name,_that.description,_that.address,_that.city,_that.state,_that.country,_that.latitude,_that.longitude,_that.connectorTypes,_that.chargingSpeed,_that.totalPorts,_that.availablePorts,_that.isPublic,_that.accessType,_that.verifiedBy,_that.status,_that.pricingInfo,_that.workingHours,_that.photos);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String description,  String address,  String city,  String state,  String country,  double latitude,  double longitude, @JsonKey(name: 'connector_types')  List<String> connectorTypes, @JsonKey(name: 'charging_speed')  String chargingSpeed, @JsonKey(name: 'total_ports')  int totalPorts, @JsonKey(name: 'available_ports')  int availablePorts, @JsonKey(name: 'is_public')  bool isPublic, @JsonKey(name: 'access_type')  String accessType, @JsonKey(name: 'verified_by')  int? verifiedBy,  String status, @JsonKey(name: 'pricing_info')  String? pricingInfo, @JsonKey(name: 'working_hours')  String? workingHours,  List<String> photos)?  $default,) {final _that = this;
switch (_that) {
case _StationModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.address,_that.city,_that.state,_that.country,_that.latitude,_that.longitude,_that.connectorTypes,_that.chargingSpeed,_that.totalPorts,_that.availablePorts,_that.isPublic,_that.accessType,_that.verifiedBy,_that.status,_that.pricingInfo,_that.workingHours,_that.photos);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StationModel extends StationModel {
  const _StationModel({required this.id, required this.name, required this.description, required this.address, required this.city, required this.state, required this.country, required this.latitude, required this.longitude, @JsonKey(name: 'connector_types') required final  List<String> connectorTypes, @JsonKey(name: 'charging_speed') required this.chargingSpeed, @JsonKey(name: 'total_ports') required this.totalPorts, @JsonKey(name: 'available_ports') required this.availablePorts, @JsonKey(name: 'is_public') required this.isPublic, @JsonKey(name: 'access_type') required this.accessType, @JsonKey(name: 'verified_by') this.verifiedBy, required this.status, @JsonKey(name: 'pricing_info') this.pricingInfo, @JsonKey(name: 'working_hours') this.workingHours, required final  List<String> photos}): _connectorTypes = connectorTypes,_photos = photos,super._();
  factory _StationModel.fromJson(Map<String, dynamic> json) => _$StationModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  String description;
@override final  String address;
@override final  String city;
@override final  String state;
@override final  String country;
@override final  double latitude;
@override final  double longitude;
 final  List<String> _connectorTypes;
@override@JsonKey(name: 'connector_types') List<String> get connectorTypes {
  if (_connectorTypes is EqualUnmodifiableListView) return _connectorTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_connectorTypes);
}

@override@JsonKey(name: 'charging_speed') final  String chargingSpeed;
@override@JsonKey(name: 'total_ports') final  int totalPorts;
@override@JsonKey(name: 'available_ports') final  int availablePorts;
@override@JsonKey(name: 'is_public') final  bool isPublic;
@override@JsonKey(name: 'access_type') final  String accessType;
@override@JsonKey(name: 'verified_by') final  int? verifiedBy;
@override final  String status;
@override@JsonKey(name: 'pricing_info') final  String? pricingInfo;
@override@JsonKey(name: 'working_hours') final  String? workingHours;
 final  List<String> _photos;
@override List<String> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}


/// Create a copy of StationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StationModelCopyWith<_StationModel> get copyWith => __$StationModelCopyWithImpl<_StationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.country, country) || other.country == country)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&const DeepCollectionEquality().equals(other._connectorTypes, _connectorTypes)&&(identical(other.chargingSpeed, chargingSpeed) || other.chargingSpeed == chargingSpeed)&&(identical(other.totalPorts, totalPorts) || other.totalPorts == totalPorts)&&(identical(other.availablePorts, availablePorts) || other.availablePorts == availablePorts)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.accessType, accessType) || other.accessType == accessType)&&(identical(other.verifiedBy, verifiedBy) || other.verifiedBy == verifiedBy)&&(identical(other.status, status) || other.status == status)&&(identical(other.pricingInfo, pricingInfo) || other.pricingInfo == pricingInfo)&&(identical(other.workingHours, workingHours) || other.workingHours == workingHours)&&const DeepCollectionEquality().equals(other._photos, _photos));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,description,address,city,state,country,latitude,longitude,const DeepCollectionEquality().hash(_connectorTypes),chargingSpeed,totalPorts,availablePorts,isPublic,accessType,verifiedBy,status,pricingInfo,workingHours,const DeepCollectionEquality().hash(_photos)]);

@override
String toString() {
  return 'StationModel(id: $id, name: $name, description: $description, address: $address, city: $city, state: $state, country: $country, latitude: $latitude, longitude: $longitude, connectorTypes: $connectorTypes, chargingSpeed: $chargingSpeed, totalPorts: $totalPorts, availablePorts: $availablePorts, isPublic: $isPublic, accessType: $accessType, verifiedBy: $verifiedBy, status: $status, pricingInfo: $pricingInfo, workingHours: $workingHours, photos: $photos)';
}


}

/// @nodoc
abstract mixin class _$StationModelCopyWith<$Res> implements $StationModelCopyWith<$Res> {
  factory _$StationModelCopyWith(_StationModel value, $Res Function(_StationModel) _then) = __$StationModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String description, String address, String city, String state, String country, double latitude, double longitude,@JsonKey(name: 'connector_types') List<String> connectorTypes,@JsonKey(name: 'charging_speed') String chargingSpeed,@JsonKey(name: 'total_ports') int totalPorts,@JsonKey(name: 'available_ports') int availablePorts,@JsonKey(name: 'is_public') bool isPublic,@JsonKey(name: 'access_type') String accessType,@JsonKey(name: 'verified_by') int? verifiedBy, String status,@JsonKey(name: 'pricing_info') String? pricingInfo,@JsonKey(name: 'working_hours') String? workingHours, List<String> photos
});




}
/// @nodoc
class __$StationModelCopyWithImpl<$Res>
    implements _$StationModelCopyWith<$Res> {
  __$StationModelCopyWithImpl(this._self, this._then);

  final _StationModel _self;
  final $Res Function(_StationModel) _then;

/// Create a copy of StationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? address = null,Object? city = null,Object? state = null,Object? country = null,Object? latitude = null,Object? longitude = null,Object? connectorTypes = null,Object? chargingSpeed = null,Object? totalPorts = null,Object? availablePorts = null,Object? isPublic = null,Object? accessType = null,Object? verifiedBy = freezed,Object? status = null,Object? pricingInfo = freezed,Object? workingHours = freezed,Object? photos = null,}) {
  return _then(_StationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,connectorTypes: null == connectorTypes ? _self._connectorTypes : connectorTypes // ignore: cast_nullable_to_non_nullable
as List<String>,chargingSpeed: null == chargingSpeed ? _self.chargingSpeed : chargingSpeed // ignore: cast_nullable_to_non_nullable
as String,totalPorts: null == totalPorts ? _self.totalPorts : totalPorts // ignore: cast_nullable_to_non_nullable
as int,availablePorts: null == availablePorts ? _self.availablePorts : availablePorts // ignore: cast_nullable_to_non_nullable
as int,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,accessType: null == accessType ? _self.accessType : accessType // ignore: cast_nullable_to_non_nullable
as String,verifiedBy: freezed == verifiedBy ? _self.verifiedBy : verifiedBy // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,pricingInfo: freezed == pricingInfo ? _self.pricingInfo : pricingInfo // ignore: cast_nullable_to_non_nullable
as String?,workingHours: freezed == workingHours ? _self.workingHours : workingHours // ignore: cast_nullable_to_non_nullable
as String?,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
