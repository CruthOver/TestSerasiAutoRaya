import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_serasi_raya/application/routes/app_pages.dart';
import 'package:test_serasi_raya/domain/entities/product.dart';
import 'package:test_serasi_raya/domain/usecases/total_cart_use_case.dart';

class SearchPageController extends GetxController {
  final TotalCartUseCase totalCartUseCase;
  var searchController = TextEditingController().obs;
  var products = <Product>[].obs;
  var searchResult = <Product>[].obs;
  var cartCount = 0.obs;

  SearchPageController({required this.totalCartUseCase});

  @override
  void onInit() {
    if (Get.arguments != null) {
      products.value = Get.arguments;
      searchResult.value = Get.arguments;
    }

    searchController.value.addListener(() {
      if (searchController.value.text.isNotEmpty) {
        searchProduct();
      } else {
        searchResult.value = products;
      }
    });
    getTotalCart();
    super.onInit();
  }

  void searchProduct() {
    searchResult.value = products.where((item) {
      return item.title!
          .toLowerCase()
          .contains(searchController.value.text.toLowerCase());
    }).toList();
  }

  void goToDetail(int productId) {
    Get.toNamed(Routes.product, arguments: productId);
  }

  void goToCart() {
    Get.toNamed(Routes.cart);
  }

  void getTotalCart() async {
    final totalCart = await totalCartUseCase.execute();
    cartCount.value = totalCart;
  }
}
