import 'package:json_annotation/json_annotation.dart';
import 'package:test_serasi_raya/domain/entities/userdata.dart';
part 'user_data_model.g.dart';

@JsonSerializable()
class UserDataModel extends UserData {
  UserDataModel({
    String? firstName,
    String? lastName,
  }) : super(
          firstName: firstName,
          lastName: lastName,
        );

  factory UserDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataModelToJson(this);
}
