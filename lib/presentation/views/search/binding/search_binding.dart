import 'package:get/get.dart';
import 'package:test_serasi_raya/domain/usecases/total_cart_use_case.dart';
import 'package:test_serasi_raya/presentation/views/search/controller/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>
        SearchPageController(totalCartUseCase: Get.find<TotalCartUseCase>()));
  }
}
