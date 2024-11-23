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
        appBar: AppBar(
          title: const Text("Back"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30, bottom: 30),
                child: const Icon(
                  Icons.lock_outline_rounded,
                  size: 50,
                ),
              ),
              Text(
                "Forgot Password?",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: Theme.of(Get.context!).colorScheme.inverseSurface),
              ),
              AppTextStyles.mediumVerticalSpacing,
              const Text(
                "Enter email address you used to register",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
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
