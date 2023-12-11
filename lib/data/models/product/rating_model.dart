import 'package:json_annotation/json_annotation.dart';
import 'package:test_serasi_raya/domain/entities/rating.dart';

part 'rating_model.g.dart';

@JsonSerializable()
class RatingModel extends Rating {
  RatingModel({
    double? rate,
    int? count,
  }) : super(
          rate: rate,
          count: count,
        );

  factory RatingModel.fromJson(Map<String, dynamic> json) =>
      _$RatingModelFromJson(json);
  Map<String, dynamic> toJson() => _$RatingModelToJson(this);
}
