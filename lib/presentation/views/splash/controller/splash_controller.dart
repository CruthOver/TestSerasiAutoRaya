import 'package:get/get.dart';
import 'package:test_serasi_raya/application/app/session.dart';
import 'package:test_serasi_raya/application/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(
      const Duration(seconds: 3),
      () async {
        bool isLogged = await Session.isLogged;
        if (isLogged) {
          Get.offNamed(Routes.home);
        } else {
          Get.offNamed(Routes.login);
        }
      },
    );
    super.onInit();
  }
}
