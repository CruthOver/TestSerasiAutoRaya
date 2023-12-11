import 'package:json_annotation/json_annotation.dart';

class Cart {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "product_id")
  int? productId;
  @JsonKey(name: "date")
  int? date;
  @JsonKey(name: "product_title")
  String? productTitle;
  @JsonKey(name: "product_image")
  String? productImage;
  @JsonKey(name: "product_price")
  double? productPrice;
  @JsonKey(name: "quantity")
  int? quantity;

  Cart(
      {this.id,
      this.productId,
      this.date,
      this.productTitle,
      this.productImage,
      this.productPrice,
      this.quantity});
}
