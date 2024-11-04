import 'package:curiocity/app/common/dimens/dimens.dart';
import 'package:curiocity/app/modules/auth/login_screen/views/widget/InputTextFieldWidget.dart';
import 'package:curiocity/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/sign_up_screen_controller.dart';
import 'package:curiocity/app/modules/auth/login_screen/views/login_screen_view.dart';
import 'package:curiocity/app/modules/auth/login_screen/views/widget/sign_in_and_up_row.dart';
import 'package:curiocity/app/common/widget/outlined_button.dart';

class SignUpScreenView extends GetView<SignUpScreenController> {
  const SignUpScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignUpScreenController>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(mediumSize),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: mediumSize),
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    "assets/images/curio.png",
                    width: 180,
                    height: 108,
                  ),
                ),
                const SizedBox(height: mediumSize),
                const Text(
                  "Sign up",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: largeSize),
                ),
                const SizedBox(height: mediumSize),
                const Text(
                  "Create an account to get started",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: mediumSize),
                ),
                const SizedBox(height: mediumSize),
                InputTextFieldWidget(
                  hintText: "Input Full Name",
                  labelText: "Fullname",
                  editingController: controller.fullNameController,
                ),
                const SizedBox(height: mediumSize),
                InputTextFieldWidget(
                  hintText: "Input Email Address",
                  labelText: "Email address",
                  editingController: controller.emailAddressController,
                ),
                const SizedBox(height: mediumSize),
                PasswordTextFieldWidget(
                  hintText: "Input Password",
                  labelText: "Password",
                  passwordTextEditController: controller.passwordController,
                ),
                const SizedBox(height: mediumSize),
                PasswordTextFieldWidget(
                  hintText: "Confirm Password",
                  labelText: "Confirm password",
                  passwordTextEditController:
                      controller.confirmPasswordController,
                ),
                const SizedBox(height: mediumSize),
                SignInAndUpRow(
                  desc: "By signing up you agree to our",
                  action: "Terms and conditions",
                  onClick: () {
                    // Handle terms and conditions click
                  },
                ),
                const SizedBox(height: largeSize),
                OutlinedButtonWidget(
                  onClick: () => Get.toNamed(Routes.VERIFY_EMAIL_SCREEN),
                  name: 'Sign Up',
                ),
                const SizedBox(height: mediumSize),
                SignInAndUpRow(
                  desc: "Already a member?",
                  action: "Login",
                  onClick: () {
                    Get.to(() => const LoginScreenView());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
