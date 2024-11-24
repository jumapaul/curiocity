import 'package:curiocity/app/common/dimens/dimens.dart';
import 'package:curiocity/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../common_widget/outlined_button.dart';
import '../controllers/success_controller.dart';

class SuccessView extends GetView<SuccessController> {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppTextStyles.extraLargeVerticalSpacing,
              AppTextStyles.largeVerticalSpacing,
              const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 40,
              ),
              AppTextStyles.largeVerticalSpacing,
              Text(
                "Verification Link Sent",
                style: Get.textTheme.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              AppTextStyles.extraLargeVerticalSpacing,
              AppTextStyles.mediumVerticalSpacing,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Please use the link sent to your email to recover your account",
                  textAlign: TextAlign.center,
                  style: Get.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              AppTextStyles.largeVerticalSpacing,
              OutlinedButtonWidget(
                onClick: () {
                  Get.offAndToNamed(Routes.LOGIN_SCREEN);
                },
                name: "Login",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
