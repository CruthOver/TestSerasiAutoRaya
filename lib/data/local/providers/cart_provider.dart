import 'package:flutter/material.dart';
import 'package:test_serasi_raya/data/local/contracts/cart_contract.dart';
import 'package:test_serasi_raya/data/local/providers/base_provider.dart';
import 'package:test_serasi_raya/data/models/cart/cart_model.dart';
import 'package:test_serasi_raya/domain/entities/cart.dart';

class CartProvider {
  Future<int> addCart(CartModel cart) async {
    var db = await BaseProvider().database;

    return await db.insert(CartContract.tableName, cart.toJson());
  }

  Future<int> updateCart(CartModel cart) async {
    var db = await BaseProvider().database;
    int? id = cart.id;
    return await db.update(CartContract.tableName, cart.toJson(),
        where: 'id = ?', whereArgs: [id]);
  }

  Future<bool> deleteCart(int productId) async {
    if (productId != -1) {
      var db = await BaseProvider().database;

      try {
        await db.delete(CartContract.tableName,
            where: 'product_id = ?', whereArgs: [productId]);
        return true;
      } catch (error) {
        debugPrint("Error deleting $productId : ${error.toString()}");
        return false;
      }
    }
    return false;
  }

  Future<bool> deleteAllCart() async {
    var db = await BaseProvider().database;

    try {
      await db.delete(CartContract.tableName);
      return true;
    } catch (error) {
      debugPrint("Error deleting: ${error.toString()}");
      return false;
    }
  }

  Future<Cart?> getProductCart(int productId) async {
    var db = await BaseProvider().database;

    List<Map<String, dynamic>> data = await db.query(CartContract.tableName,
        where: "product_id = ?", whereArgs: [productId], orderBy: "id DESC");
    if (data.isNotEmpty) {
      return CartModel.fromJson(data[0]);
    }
    return null;
  }

  Future<List<Cart>> getAllCart() async {
    var db = await BaseProvider().database;

    List<Map<String, dynamic>> data =
        await db.query(CartContract.tableName, orderBy: "id DESC");
    return List.generate(
        data.length, (index) => CartModel.fromJson(data[index]));
  }

  Future<int> getTotalCart() async {
    var db = await BaseProvider().database;

    List<Map<String, dynamic>> data = await db.query(CartContract.tableName,
        orderBy: "id DESC", groupBy: CartContract.productId);
    return data.length;
  }
}
