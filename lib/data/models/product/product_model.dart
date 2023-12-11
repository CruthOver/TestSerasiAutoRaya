import 'package:json_annotation/json_annotation.dart';
import 'package:test_serasi_raya/data/models/product/rating_model.dart';
import 'package:test_serasi_raya/domain/entities/product.dart';
part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends Product {
  ProductModel({
    int? id,
    String? title,
    String? description,
    String? image,
    double? price,
    String? category,
    RatingModel? rating,
  }) : super(
          id: id,
          title: title,
          description: description,
          image: image,
          price: price,
          category: category,
          rating: rating,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
