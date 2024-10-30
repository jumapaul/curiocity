import 'package:curiocity/app/common/dimens/dimens.dart';
import 'package:curiocity/app/common/widget/outlined_button.dart';
import 'package:curiocity/app/modules/auth/login_screen/views/widget/InputTextFieldWidget.dart';
import 'package:curiocity/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Back"),
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: mediumSize),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.orangeAccent,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: mediumSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: extraExtraLargeSize,
            ),
            const Icon(
              Icons.lock_open,
              size: extraExtraLargeSize,
            ),
            const SizedBox(
              height: extraExtraLargeSize,
            ),
            const Text(
              "Forgot Password",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: largeSize,
              ),
            ),
            const SizedBox(
              height: mediumSize,
            ),
            const Text(
              "We sent an email verification code to your email",
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: normalSize),
            ),
            const SizedBox(
              height: extraLargeSize,
            ),
            InputTextFieldWidget(
              hintText: "Type your email here",
              editingController: controller.emailController,
            ),
            const SizedBox(
              height: extraLargeSize,
            ),
            OutlinedButtonWidget(
              onClick: () {
                Get.toNamed(Routes.VERIFY_EMAIL_SCREEN);
              },
              name: "Continue",
            ),
            const SizedBox(
              height: mediumSize,
            ),
          ],
        ),
      ),
    );
  }
}
