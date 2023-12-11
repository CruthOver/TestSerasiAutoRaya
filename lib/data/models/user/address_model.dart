import 'package:json_annotation/json_annotation.dart';
import 'package:test_serasi_raya/data/models/user/location_model.dart';
import 'package:test_serasi_raya/domain/entities/address.dart';
part 'address_model.g.dart';

@JsonSerializable()
class AddressModel extends Address {
  AddressModel({
    String? city,
    String? street,
    int? number,
    String? zipCode,
    LocationModel? location,
  }) : super(
            city: city,
            street: street,
            number: number,
            zipCode: zipCode,
            location: location);

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
