import 'package:curiocity/app/common/dimens/dimens.dart';
import 'package:curiocity/app/modules/auth/login_screen/views/widget/InputTextFieldWidget.dart';
import 'package:curiocity/app/modules/common_widget/outlined_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Back'),
            centerTitle: false,
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: mediumSize,
                  ),
                  const Text(
                    "Verify",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: largeSize,
                    ),
                  ),
                  const SizedBox(
                    height: largeSize,
                  ),
                  const SizedBox(
                    height: largeSize,
                  ),
                  PasswordTextFieldWidget(
                      hintText: "Enter new password",
                      passwordTextEditController:
                          controller.passwordEditTextController,
                      labelText: "Password"),
                  AppTextStyles.mediumVerticalSpacing,
                  PasswordTextFieldWidget(
                      hintText: "Confirm password",
                      passwordTextEditController:
                          controller.confirmPasswordEditTextController,
                      labelText: "Confirm password"),
                  AppTextStyles.largeVerticalSpacing,
                  AppTextStyles.largeVerticalSpacing,
                  OutlinedButtonWidget(
                    onClick: () {
                      controller.resetPassword();
                    },
                    name: controller.status.isLoading ? null : "Reset Password",
                    child: controller.status.isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : null,
                  )
                ],
              ),
            ),
          ));
    });
  }
}
