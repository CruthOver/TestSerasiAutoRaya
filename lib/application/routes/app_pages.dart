import 'package:get/get.dart';
import 'package:test_serasi_raya/presentation/views/auth/login/binding/login_binding.dart';
import 'package:test_serasi_raya/presentation/views/auth/login/login_view.dart';
import 'package:test_serasi_raya/presentation/views/cart/binding/cart_binding.dart';
import 'package:test_serasi_raya/presentation/views/cart/cart_view.dart';
import 'package:test_serasi_raya/presentation/views/home/binding/home_binding.dart';
import 'package:test_serasi_raya/presentation/views/home/home_view.dart';
import 'package:test_serasi_raya/presentation/views/product/binding/product_binding.dart';
import 'package:test_serasi_raya/presentation/views/product/product_view.dart';
import 'package:test_serasi_raya/presentation/views/search/binding/search_binding.dart';
import 'package:test_serasi_raya/presentation/views/search/search_view.dart';
import 'package:test_serasi_raya/presentation/views/splash/binding/splash_binding.dart';
import 'package:test_serasi_raya/presentation/views/splash/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.product,
      page: () => const ProductView(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: _Paths.cart,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.search,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
  ];
}
