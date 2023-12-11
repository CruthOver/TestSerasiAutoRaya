part of 'app_pages.dart';

abstract class Routes {
  static const splash = _Paths.splash;
  static const login = _Paths.login;
  static const register = _Paths.register;
  static const forgotPassword = _Paths.forgotPassword;
  static const home = _Paths.home;
  static const product = _Paths.product;
  static const cart = _Paths.cart;
  static const search = _Paths.search;
}

abstract class _Paths {
  static const splash = '/';
  static const login = '/login';
  static const register = '/register';
  static const forgotPassword = '/forgot_password';
  static const home = '/home';
  static const product = '/product';
  static const cart = '/cart';
  static const search = '/search';
}
