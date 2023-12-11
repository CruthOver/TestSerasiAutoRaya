import 'package:test_serasi_raya/data/local/providers/cart_provider.dart';
import 'package:test_serasi_raya/data/models/cart/cart_model.dart';
import 'package:test_serasi_raya/domain/entities/cart.dart';
import 'package:test_serasi_raya/domain/repositories/cart_repository.dart';

class CartRepositoryImpl extends CartRepository {
  @override
  Future<int> addToCart(CartModel cartModel) async {
    CartProvider provider = CartProvider();

    Cart? cart = await provider.getProductCart(cartModel.productId!);
    if (cart != null) {
      cartModel.quantity = cart.quantity! + cartModel.quantity!;
      return provider.updateCart(cartModel);
    }
    return provider.addCart(cartModel);
  }

  @override
  Future<List<Cart>> getUserCart() {
    CartProvider provider = CartProvider();
    return provider.getAllCart();
  }

  @override
  Future<int> updateCart(CartModel cartModel) {
    CartProvider provider = CartProvider();
    return provider.updateCart(cartModel);
  }

  @override
  Future<bool> deleteCart(int productId) {
    CartProvider provider = CartProvider();
    return provider.deleteCart(productId);
  }

  @override
  Future<bool> clearCart() {
    CartProvider provider = CartProvider();
    return provider.deleteAllCart();
  }

  @override
  Future<int> getTotalCart() {
    CartProvider provider = CartProvider();
    return provider.getTotalCart();
  }
}
