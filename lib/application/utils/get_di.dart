import 'package:get/get.dart';
import 'package:test_serasi_raya/data/repositories/auth_repository_impl.dart';
import 'package:test_serasi_raya/data/repositories/cart_repository_impl.dart';
import 'package:test_serasi_raya/data/repositories/category_repository_impl.dart';
import 'package:test_serasi_raya/data/repositories/product_repository_impl.dart';
import 'package:test_serasi_raya/domain/usecases/add_cart_use_case.dart';
import 'package:test_serasi_raya/domain/usecases/delete_all_cart_use_case.dart';
import 'package:test_serasi_raya/domain/usecases/delete_cart_use_case.dart';
import 'package:test_serasi_raya/domain/usecases/fetch_category_use_case.dart';
import 'package:test_serasi_raya/domain/usecases/fetch_product_use_case.dart';
import 'package:test_serasi_raya/domain/usecases/fetch_user_cart_use_case.dart';
import 'package:test_serasi_raya/domain/usecases/signin_use_case.dart';
import 'package:test_serasi_raya/domain/usecases/fetch_single_product_use_case.dart';
import 'package:test_serasi_raya/domain/usecases/fetch_user_use_case.dart';
import 'package:test_serasi_raya/domain/usecases/total_cart_use_case.dart';
import 'package:test_serasi_raya/domain/usecases/update_cart_use_case.dart';

class Dependency {
  static init() {
    Get.lazyPut(() => CategoryRepositoryImpl(), fenix: true);
    Get.lazyPut(() => ProductRepositoryImpl(), fenix: true);
    Get.lazyPut(() => AuthRepositoryImpl(), fenix: true);
    Get.lazyPut(() => CartRepositoryImpl(), fenix: true);

    Get.lazyPut(() => FetchCategoryUseCase(Get.find<CategoryRepositoryImpl>()),
        fenix: true);
    Get.lazyPut(() => FetchProductUseCase(Get.find<ProductRepositoryImpl>()),
        fenix: true);
    Get.lazyPut(
        () => FetchSingleProductUseCase(Get.find<ProductRepositoryImpl>()),
        fenix: true);
    Get.lazyPut(() => FetchSignInUseCase(Get.find<AuthRepositoryImpl>()),
        fenix: true);
    Get.lazyPut(() => FetchUserUseCase(Get.find<AuthRepositoryImpl>()),
        fenix: true);
    Get.lazyPut(() => FetchUserCartUseCase(Get.find<CartRepositoryImpl>()),
        fenix: true);
    Get.lazyPut(() => AddCartUserCase(Get.find<CartRepositoryImpl>()),
        fenix: true);
    Get.lazyPut(() => UpdateCartUserCase(Get.find<CartRepositoryImpl>()),
        fenix: true);
    Get.lazyPut(() => DeleteCartUseCase(Get.find<CartRepositoryImpl>()),
        fenix: true);
    Get.lazyPut(() => DeleteAllCartUseCase(Get.find<CartRepositoryImpl>()),
        fenix: true);
    Get.lazyPut(() => TotalCartUseCase(Get.find<CartRepositoryImpl>()),
        fenix: true);
  }
}
