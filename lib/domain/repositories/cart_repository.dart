import 'package:test_serasi_raya/data/models/cart/cart_model.dart';
import 'package:test_serasi_raya/domain/entities/cart.dart';

abstract class CartRepository {
  Future<List<Cart>> getUserCart();
  Future<int> addToCart(CartModel cartModel);
  Future<int> updateCart(CartModel cartModel);
  Future<bool> deleteCart(int productId);
  Future<bool> clearCart();
  Future<int> getTotalCart();
}
