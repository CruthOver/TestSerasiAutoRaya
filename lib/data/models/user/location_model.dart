import 'package:json_annotation/json_annotation.dart';
import 'package:test_serasi_raya/domain/entities/address.dart';
part 'location_model.g.dart';

@JsonSerializable()
class LocationModel extends Location {
  LocationModel({
    String? latitude,
    String? longitude,
  }) : super(
          latitude: latitude,
          longitude: longitude,
        );

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
