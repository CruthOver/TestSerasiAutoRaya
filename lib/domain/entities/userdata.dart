import 'package:json_annotation/json_annotation.dart';

class UserData {
  @JsonKey(name: "firstname")
  String? firstName;
  @JsonKey(name: "lastname")
  String? lastName;

  UserData({this.firstName, this.lastName});
}
