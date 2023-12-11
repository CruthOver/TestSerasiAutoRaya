import 'package:get/get.dart';
import 'package:test_serasi_raya/domain/usecases/fetch_category_use_case.dart';
import 'package:test_serasi_raya/domain/usecases/fetch_product_use_case.dart';
import 'package:test_serasi_raya/domain/usecases/total_cart_use_case.dart';
import 'package:test_serasi_raya/presentation/views/home/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(
        fetchCategoryUseCase: Get.find<FetchCategoryUseCase>(),
        fetchProductUseCase: Get.find<FetchProductUseCase>(),
        totalCartUseCase: Get.find<TotalCartUseCase>()));
  }
}
