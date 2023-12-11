import 'package:get/get.dart';
import 'package:test_serasi_raya/domain/usecases/add_cart_use_case.dart';
import 'package:test_serasi_raya/domain/usecases/fetch_single_product_use_case.dart';
import 'package:test_serasi_raya/domain/usecases/total_cart_use_case.dart';
import 'package:test_serasi_raya/presentation/views/product/controller/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductController(
        fetchSingleProductUseCase: Get.find<FetchSingleProductUseCase>(),
        addCartUserCase: Get.find<AddCartUserCase>(),
        totalCartUseCase: Get.find<TotalCartUseCase>()));
  }
}
