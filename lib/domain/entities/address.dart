import 'package:json_annotation/json_annotation.dart';
import 'package:test_serasi_raya/data/models/user/location_model.dart';

class Address {
  @JsonKey(name: "street")
  String? street;
  @JsonKey(name: "city")
  String? city;
  @JsonKey(name: "number")
  int? number;
  @JsonKey(name: "zipcode")
  String? zipCode;
  @JsonKey(name: "geolocation")
  LocationModel? location;

  Address({this.city, this.street, this.number, this.zipCode, this.location});
}

class Location {
  @JsonKey(name: "lat")
  String? latitude;
  @JsonKey(name: "long")
  String? longitude;

  Location({this.latitude, this.longitude});
}
