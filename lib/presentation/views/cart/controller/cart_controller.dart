import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_serasi_raya/data/models/cart/cart_model.dart';
import 'package:test_serasi_raya/domain/entities/cart.dart';
import 'package:test_serasi_raya/domain/entities/user.dart';
import 'package:test_serasi_raya/domain/usecases/delete_all_cart_use_case.dart';
import 'package:test_serasi_raya/domain/usecases/delete_cart_use_case.dart';
import 'package:test_serasi_raya/domain/usecases/fetch_user_cart_use_case.dart';
import 'package:test_serasi_raya/domain/usecases/update_cart_use_case.dart';
import 'package:test_serasi_raya/presentation/shared/snackbar.dart';

class CartController extends GetxController {
  CartController({
    required this.fetchUserCartUseCase,
    required this.updateCartUserCase,
    required this.deleteCartUseCase,
    required this.deleteAllCartUseCase,
  });
  final FetchUserCartUseCase fetchUserCartUseCase;
  final UpdateCartUserCase updateCartUserCase;
  final DeleteCartUseCase deleteCartUseCase;
  final DeleteAllCartUseCase deleteAllCartUseCase;

  var user = User().obs;
  var isLoading = false.obs;
  var carts = <Cart>[].obs;

  @override
  void onInit() async {
    await fetchUserCart();
    super.onInit();
  }

  Future<void> fetchUserCart() async {
    final data = await fetchUserCartUseCase
        .execute()
        .whenComplete(() => isLoading.toggle());
    carts.value = data;
  }

  void increaseQuantity(int index) async {
    carts[index].quantity = carts[index].quantity! + 1;
    carts.refresh();
    CartModel cartModel = CartModel(
      date: DateTime.now().millisecondsSinceEpoch,
      productPrice: carts[index].productPrice,
      productTitle: carts[index].productTitle,
      productImage: carts[index].productImage,
      quantity: carts[index].quantity!,
      productId: carts[index].productId,
    );

    await updateCartUserCase.execute(cartModel);
  }

  void decreaseQuantity(int index) async {
    if (carts[index].quantity! > 1) {
      carts[index].quantity = carts[index].quantity! - 1;
      carts.refresh();
      CartModel cartModel = CartModel(
        date: DateTime.now().millisecondsSinceEpoch,
        productPrice: carts[index].productPrice,
        productTitle: carts[index].productTitle,
        productImage: carts[index].productImage,
        quantity: carts[index].quantity!,
        productId: carts[index].productId,
      );

      await updateCartUserCase.execute(cartModel);
    }
  }

  Future<void> deleteCart(int index) async {
    final response = await deleteCartUseCase.execute(carts[index].productId!);
    if (response) {
      carts.removeAt(index);
      showSnackBar(Get.context!,
          message: "Product has been remove",
          icon: const Icon(
            Icons.check_circle_outline,
            color: Colors.white,
            size: 18.0,
          ),
          backgroundColor: Colors.cyan);
    } else {
      showSnackBar(Get.context!,
          message: "Product failed to remove",
          icon: const Icon(
            Icons.warning_amber,
            color: Colors.white,
            size: 18.0,
          ),
          backgroundColor: Colors.redAccent);
    }
  }

  Future<void> deleteAllCart() async {
    final response = await deleteAllCartUseCase.execute();
    if (response) {
      showSnackBar(Get.context!,
          message: "All Product has been remove",
          icon: const Icon(
            Icons.check_circle_outline,
            color: Colors.white,
            size: 18.0,
          ),
          backgroundColor: Colors.cyan);
      carts.clear();
    } else {
      showSnackBar(Get.context!,
          message: "All Product failed to remove",
          icon: const Icon(
            Icons.warning_amber,
            color: Colors.white,
            size: 18.0,
          ),
          backgroundColor: Colors.redAccent);
    }
  }
}
