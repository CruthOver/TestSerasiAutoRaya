import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_serasi_raya/application/config/app_color.dart';
import 'package:test_serasi_raya/application/config/app_constant.dart';
import 'package:test_serasi_raya/presentation/shared/custom_textfield.dart';
import 'package:test_serasi_raya/presentation/views/auth/login/controller/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: controller.formKey.value,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 64.0, horizontal: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(ImageConstant.logo)),
                                ),
                              ),
                              Text(
                                App.appName,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      color: greenColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          Text(
                            App.appSlogan,
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: greyColor,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 64.0,
                    ),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomTextField(
                            controller: controller.usernameController.value,
                            label: Label.usernameLabel,
                            validator: (p0) {
                              if (p0!.isEmpty) {
                                return "Username cannot be empty";
                              }
                              return null;
                            },
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                            ),
                            textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          CustomTextField(
                            controller: controller.passwordController.value,
                            label: Label.passwordLabel,
                            prefixIcon: const Icon(Icons.lock),
                            validator: (p0) {
                              if (p0!.isEmpty) {
                                return "Password cannot be empty";
                              }
                              return null;
                            },
                            suffixIcon: IconButton(
                              onPressed: () => controller.showHidePassword(),
                              icon: controller.isShowPassword.value
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                            ),
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.visiblePassword,
                            obscureText: !controller.isShowPassword.value,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () => controller.goToForgotPassword(),
                                child: Text(
                                  Label.forgotPasswordLabel,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: greyColor,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 24.0,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () => controller.isLoading.value
                                  ? null
                                  : controller.login(),
                              child: controller.isLoading.value
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text(
                                      Label.loginLabel,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            fontSize: 16.0,
                                            color: Colors.white,
                                          ),
                                    ),
                            ),
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          RichText(
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                text: Label.registerMessageLabel,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: greyColor,
                                    ),
                              ),
                              TextSpan(
                                text: Label.signUpLabel,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    controller.goToRegister();
                                  },
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: greyColor,
                                    ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
