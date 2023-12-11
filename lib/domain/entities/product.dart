import 'package:json_annotation/json_annotation.dart';
import 'package:test_serasi_raya/data/models/product/rating_model.dart';

class Product {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'price')
  double? price;
  @JsonKey(name: 'category')
  String? category;
  @JsonKey(name: 'rating')
  RatingModel? rating;

  Product(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.price,
      this.category,
      this.rating});
}
