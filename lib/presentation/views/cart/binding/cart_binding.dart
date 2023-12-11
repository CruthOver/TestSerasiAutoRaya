import 'package:get/get.dart';
import 'package:test_serasi_raya/domain/usecases/delete_all_cart_use_case.dart';
import 'package:test_serasi_raya/domain/usecases/delete_cart_use_case.dart';
import 'package:test_serasi_raya/domain/usecases/fetch_user_cart_use_case.dart';
import 'package:test_serasi_raya/domain/usecases/update_cart_use_case.dart';
import 'package:test_serasi_raya/presentation/views/cart/controller/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController(
        fetchUserCartUseCase: Get.find<FetchUserCartUseCase>(),
        updateCartUserCase: Get.find<UpdateCartUserCase>(),
        deleteAllCartUseCase: Get.find<DeleteAllCartUseCase>(),
        deleteCartUseCase: Get.find<DeleteCartUseCase>()));
  }
}
