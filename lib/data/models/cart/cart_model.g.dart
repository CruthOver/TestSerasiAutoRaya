// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      productId: json['product_id'] as int?,
      quantity: json['quantity'] as int?,
      date: json['date'] as int?,
      productTitle: json['product_title'] as String?,
      productImage: json['product_image'] as String?,
      productPrice: (json['product_price'] as num?)?.toDouble(),
    )..id = json['id'] as int?;

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'date': instance.date,
      'product_title': instance.productTitle,
      'product_image': instance.productImage,
      'product_price': instance.productPrice,
      'quantity': instance.quantity,
    };
