import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_serasi_raya/application/app/session.dart';
import 'package:test_serasi_raya/application/routes/app_pages.dart';
import 'package:test_serasi_raya/domain/entities/user.dart';
import 'package:test_serasi_raya/domain/usecases/signin_use_case.dart';
import 'package:test_serasi_raya/domain/usecases/fetch_user_use_case.dart';

class LoginController extends GetxController {
  final FetchSignInUseCase fetchSignInUseCase;
  final FetchUserUseCase fetchUserUseCase;

  LoginController(
      {required this.fetchSignInUseCase, required this.fetchUserUseCase});
  final usernameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  var isShowPassword = false.obs;
  var formKey = GlobalKey<FormState>().obs;
  var isLoading = false.obs;
  var users = <User>[].obs;
  var userData = User().obs;

  @override
  void onInit() async {
    await fetchUsers();
    super.onInit();
  }

  Future<void> login() async {
    if (!formKey.value.currentState!.validate()) {
      return;
    }
    isLoading.toggle();
    Map<String, dynamic> data = {
      "username": usernameController.value.text.trim(),
      "password": passwordController.value.text.trim(),
    };
    final response = await fetchSignInUseCase
        .execute(data)
        .whenComplete(() => isLoading.toggle());
    if (response.success!) {
      Session.setUserToken(token: response.data!['token']);
      userData.value = users.singleWhere((element) =>
          element.username!.toLowerCase() ==
          usernameController.value.text.toLowerCase());

      if (userData.value.id != null) {
        Session.setUserSessions(userData: userData.value);
      }
      Get.offAllNamed(Routes.home);
    }
  }

  Future<void> fetchUsers() async {
    final response = await fetchUserUseCase.execute();

    if (response.success != null && response.success!) {
      users.value = response.data!;
    }
  }

  void goToRegister() {
    showSnackBar("Under Maintenance");
  }

  void goToForgotPassword() {
    showSnackBar("Under Maintenance");
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      showCloseIcon: true,
      elevation: 5,
    ));
  }

  void showHidePassword() {
    isShowPassword.toggle();
  }
}
