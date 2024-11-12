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
            title: const Text('ResetPassword'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
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
                AppTextStyles.mediumVerticalSpacing,
                OutlinedButtonWidget(
                  onClick: () {
                    controller.resetPassword();
                  },
                  name: controller.status.isLoading ? null : "Reset Password",
                  child: controller.status.isLoading
                      ? const SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : null,
                )
              ],
            ),
          ));
    });
  }
}
