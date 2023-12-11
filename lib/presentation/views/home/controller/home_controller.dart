import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_serasi_raya/application/app/session.dart';
import 'package:test_serasi_raya/application/routes/app_pages.dart';
import 'package:test_serasi_raya/domain/entities/product.dart';
import 'package:test_serasi_raya/domain/usecases/fetch_category_use_case.dart';
import 'package:test_serasi_raya/domain/usecases/fetch_product_use_case.dart';
import 'package:test_serasi_raya/domain/usecases/total_cart_use_case.dart';

class HomeController extends GetxController {
  HomeController({
    required this.fetchCategoryUseCase,
    required this.fetchProductUseCase,
    required this.totalCartUseCase,
  });
  final FetchCategoryUseCase fetchCategoryUseCase;
  final FetchProductUseCase fetchProductUseCase;
  final TotalCartUseCase totalCartUseCase;

  var categories = <String>[].obs;
  var products = <Product>[].obs;
  var categorySelected = "".obs;
  var isLoadCategory = true.obs;
  var isLoadProduct = true.obs;
  var cartCount = 0.obs;

  @override
  void onInit() async {
    await fetchCategory();
    await fetchProduct();
    getTotalCart();
    super.onInit();
  }

  Future<void> fetchCategory() async {
    categories.add("All");
    final data = await fetchCategoryUseCase
        .execute()
        .whenComplete(() => isLoadCategory.toggle());
    categories.addAll(data.data ?? []);
    if (categories.isNotEmpty) {
      categorySelected.value = categories.first;
    }
  }

  Future<void> fetchProduct() async {
    final data = await fetchProductUseCase
        .execute(
            categorySelected.value == "All" ? null : categorySelected.value)
        .whenComplete(() => isLoadProduct.toggle());
    products.value = data.data ?? [];
  }

  void getTotalCart() async {
    final totalCart = await totalCartUseCase.execute();
    cartCount.value = totalCart;
  }

  void changeCategory(String categoryName) async {
    categorySelected.value = categoryName;
    isLoadProduct.value = true;
    await fetchProduct();
  }

  void goToDetail(productId) {
    Get.toNamed(Routes.product, arguments: productId)!.then((value) {
      getTotalCart();
    });
  }

  void goToSearchPage() {
    Get.toNamed(Routes.search, arguments: products);
  }

  void goToCart() {
    Get.toNamed(Routes.cart)!.then((value) {
      getTotalCart();
    });
  }
}
