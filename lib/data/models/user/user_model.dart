import 'package:json_annotation/json_annotation.dart';
import 'package:test_serasi_raya/data/models/user/address_model.dart';
import 'package:test_serasi_raya/data/models/user/user_data_model.dart';
import 'package:test_serasi_raya/domain/entities/user.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User {
  UserModel({
    int? id,
    String? username,
    String? email,
    String? phoneNumber,
    UserDataModel? userData,
    AddressModel? address,
  }) : super(
          id: id,
          username: username,
          email: email,
          phoneNumber: phoneNumber,
          userData: userData,
          address: address,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
