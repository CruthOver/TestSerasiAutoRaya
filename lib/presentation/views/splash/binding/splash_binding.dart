import 'package:get/get.dart';
import 'package:test_serasi_raya/presentation/views/splash/controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
