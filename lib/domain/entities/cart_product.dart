import 'package:json_annotation/json_annotation.dart';

class CartProduct {
  @JsonKey(name: "productId")
  int? productId;
  @JsonKey(name: "quantity")
  int? quantity;

  CartProduct({this.productId, this.quantity});
}
