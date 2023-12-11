import 'package:get/get.dart';
import 'package:test_serasi_raya/data/repositories/auth_repository_impl.dart';
import 'package:test_serasi_raya/domain/usecases/signin_use_case.dart';
import 'package:test_serasi_raya/domain/usecases/fetch_user_use_case.dart';
import 'package:test_serasi_raya/presentation/views/auth/login/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthRepositoryImpl(), fenix: true);
    Get.lazyPut(() => LoginController(
        fetchSignInUseCase: Get.find<FetchSignInUseCase>(),
        fetchUserUseCase: Get.find<FetchUserUseCase>()));
  }
}
