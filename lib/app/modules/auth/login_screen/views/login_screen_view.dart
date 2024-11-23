import 'package:curiocity/app/common/dimens/dimens.dart';
import 'package:curiocity/app/modules/auth/login_screen/views/widget/InputTextFieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:curiocity/app/common/theme/colors.dart';
import 'package:curiocity/app/modules/auth/login_screen/views/widget/sign_in_and_up_row.dart';
import 'package:curiocity/app/routes/app_pages.dart';
import 'package:lottie/lottie.dart';
import '../../../common_widget/outlined_button.dart';
import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var buttonState = controller.status;
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(mediumSize),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: extraLargeSize),
                  Lottie.asset(
                    'assets/images/logo.json',
                    backgroundLoading: true,
                    animate: true
                  ),
                  const SizedBox(height: mediumSize),
                  const Text(
                    "Welcome!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: largeSize),
                  ),
                  const SizedBox(height: extraLargeSize),
                  InputTextFieldWidget(
                    hintText: 'Email Address',
                    labelText: "Email address",
                    errorText: controller.emailErrorMessage?.value,
                    editingController: controller.emailAddressController,
                  ),
                  const SizedBox(height: mediumSize),
                  PasswordTextFieldWidget(
                    hintText: "Password",
                    labelText: "Password",
                    errorText: controller.passwordErrorMessage?.value,
                    passwordTextEditController: controller.passwordController,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.RESET_EMAIL_SCREEN);
                        },
                        child: const Text(
                          "Forgot password?",
                          style: TextStyle(color: colorPrimary, fontSize: 12),
                        ),
                      )),
                  OutlinedButtonWidget(
                    onClick: () {
                      controller.signIn();
                    },
                    name: buttonState.isLoading ? null : "Continue",
                    child: buttonState.isLoading
                        ? const SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : null,
                  ),
                  const SizedBox(height: mediumSize),
                  SignInAndUpRow(
                    desc: 'Not a member? ',
                    action: "Sign Up",
                    onClick: () {
                      Get.toNamed(Routes.SIGN_UP_SCREEN);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
