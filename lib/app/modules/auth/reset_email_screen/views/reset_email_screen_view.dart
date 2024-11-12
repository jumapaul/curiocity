import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../common/dimens/dimens.dart';
import '../../../../routes/app_pages.dart';
import '../../../common_widget/outlined_button.dart';
import '../../login_screen/views/widget/InputTextFieldWidget.dart';
import '../controllers/reset_email_screen_controller.dart';

class ResetEmailScreenView extends GetView<ResetEmailScreenController> {
  const ResetEmailScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Enter email address to change password"),
              AppTextStyles.largeVerticalSpacing,
              InputTextFieldWidget(
                  hintText: "Enter email",
                  labelText: "Email address",
                  editingController: controller.emailEditTextController),
              AppTextStyles.mediumVerticalSpacing,
              OutlinedButtonWidget(
                  onClick: () {
                    controller.sendResetOtp();
                  },
                  name: controller.resetOtpStatus.isLoading ? null : "Continue",
                  child: controller.resetOtpStatus.isLoading
                      ? const SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : null)
            ],
          ),
        ),
      );
    });
  }
}
