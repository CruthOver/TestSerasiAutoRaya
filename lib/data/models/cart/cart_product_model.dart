import 'package:json_annotation/json_annotation.dart';
import 'package:test_serasi_raya/domain/entities/cart_product.dart';
part 'cart_product_model.g.dart';

@JsonSerializable()
class CartProductModel extends CartProduct {
  CartProductModel({
    int? productId,
    int? quantity,
  }) : super(
          productId: productId,
          quantity: quantity,
        );

  factory CartProductModel.fromJson(Map<String, dynamic> json) =>
      _$CartProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartProductModelToJson(this);
}
