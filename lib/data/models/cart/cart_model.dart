import 'package:json_annotation/json_annotation.dart';
import 'package:test_serasi_raya/data/models/cart/cart_product_model.dart';
import 'package:test_serasi_raya/data/models/product/rating_model.dart';
import 'package:test_serasi_raya/domain/entities/cart.dart';
part 'cart_model.g.dart';

@JsonSerializable()
class CartModel extends Cart {
  CartModel({
    int? productId,
    int? quantity,
    int? date,
    String? productTitle,
    String? productImage,
    double? productPrice,
  }) : super(
          id: productId,
          quantity: quantity,
          date: date,
          productTitle: productTitle,
          productId: productId,
          productImage: productImage,
          productPrice: productPrice,
        );

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
