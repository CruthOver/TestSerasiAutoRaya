import 'package:json_annotation/json_annotation.dart';
import 'package:test_serasi_raya/data/models/user/address_model.dart';
import 'package:test_serasi_raya/data/models/user/user_data_model.dart';

class User {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "username")
  String? username;
  @JsonKey(name: "phone")
  String? phoneNumber;
  @JsonKey(name: "name")
  UserDataModel? userData;
  @JsonKey(name: "address")
  AddressModel? address;

  User(
      {this.id,
      this.email,
      this.username,
      this.phoneNumber,
      this.userData,
      this.address});
}
