import 'package:curiocity/app/common/dimens/dimens.dart';
import 'package:curiocity/app/modules/auth/login_screen/views/widget/InputTextFieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:curiocity/app/common/theme/colors.dart';
import 'package:curiocity/app/modules/auth/login_screen/views/widget/sign_in_and_up_row.dart';
import 'package:curiocity/app/common/widget/outlined_button.dart';
import 'package:curiocity/app/routes/app_pages.dart';
import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(mediumSize),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: extraLargeSize),
                SvgPicture.asset("assets/images/login_vector.svg"),
                const SizedBox(height: mediumSize),
                Image.asset("assets/images/curio.png"),
                const SizedBox(height: mediumSize),
                const Text(
                  "Welcome!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: mediumSize),
                ),
                const SizedBox(height: mediumSize),
                InputTextFieldWidget(
                  hintText: 'Email Address',
                  labelText: "Email address",
                  editingController: controller.emailAddressController,
                ),
                const SizedBox(height: mediumSize),
                PasswordTextFieldWidget(
                  hintText: "Password",
                  labelText: "Password",
                  passwordTextEditController: controller.passwordController,
                ),
                const SizedBox(height: mediumSize),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => Get.toNamed(Routes.FORGOT_PASSWORD),
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(color: colorPrimary),
                    ),
                  ),
                ),
                const SizedBox(height: mediumSize),
                OutlinedButtonWidget(
                  onClick: () {
                    Get.toNamed(Routes.USER_CATEGORY_PREFERENCE);
                  },
                  name: "Continue",
                ),
                const SizedBox(height: mediumSize),
                SignInAndUpRow(
                  desc: 'Not a member?',
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
  }
}
