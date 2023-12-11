import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_serasi_raya/data/models/cart/cart_model.dart';
import 'package:test_serasi_raya/domain/entities/product.dart';
import 'package:test_serasi_raya/domain/usecases/add_cart_use_case.dart';
import 'package:test_serasi_raya/domain/usecases/fetch_single_product_use_case.dart';
import 'package:test_serasi_raya/domain/usecases/total_cart_use_case.dart';
import 'package:test_serasi_raya/presentation/shared/snackbar.dart';

class ProductController extends GetxController {
  final FetchSingleProductUseCase fetchSingleProductUseCase;
  final TotalCartUseCase totalCartUseCase;
  final AddCartUserCase addCartUserCase;

  var productId = 0.obs;
  var product = Product().obs;
  var isLoading = true.obs;
  var isAddToCart = false.obs;
  var cartCount = 0.obs;

  ProductController(
      {required this.fetchSingleProductUseCase,
      required this.addCartUserCase,
      required this.totalCartUseCase});

  @override
  void onInit() async {
    if (Get.arguments != null) {
      productId.value = Get.arguments;
    }

    await fetchSingleProduct();
    getTotalCart();
    super.onInit();
  }

  Future<void> fetchSingleProduct() async {
    final response = await fetchSingleProductUseCase
        .execute(productId.value)
        .whenComplete(() => isLoading.toggle());
    product.value = response.data!;
  }

  Future<void> addToCart() async {
    isAddToCart.toggle();
    CartModel cartModel = CartModel(
      productId: product.value.id!,
      productImage: product.value.image!,
      productTitle: product.value.title!,
      quantity: 1,
      productPrice: product.value.price!,
      date: DateTime.now().millisecondsSinceEpoch,
    );
    final response = await addCartUserCase.execute(cartModel);
    if (response > 0) {
      getTotalCart();
      isAddToCart.toggle();
      showSnackBar(Get.context!,
          message: "Successfully Added to Cart",
          icon: const Icon(
            Icons.check_circle_outline,
            color: Colors.white,
            size: 18.0,
          ),
          backgroundColor: Colors.cyan);
    } else {
      isAddToCart.toggle();
      showSnackBar(
        Get.context!,
        message: "Failed Added to Cart",
        icon: const Icon(
          Icons.warning_amber,
          color: Colors.white,
          size: 18.0,
        ),
        backgroundColor: Colors.redAccent,
      );
    }
  }

  void getTotalCart() async {
    final totalCart = await totalCartUseCase.execute();
    cartCount.value = totalCart;
  }
}
