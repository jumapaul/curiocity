import 'package:curiocity/app/common/dimens/dimens.dart';
import 'package:curiocity/app/modules/auth/login_screen/views/widget/InputTextFieldWidget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../common_widget/outlined_button.dart';
import '../controllers/setting_up_profile_controller.dart';

class SettingUpProfileView extends GetView<SettingUpProfileController> {
  const SettingUpProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppTextStyles.mediumVerticalSpacing,
              const Text(
                "Finish setting up your profile",
                style: AppTextStyles.headerStyle,
              ),
              AppTextStyles.mediumVerticalSpacing,
              _profileView(),
              AppTextStyles.mediumVerticalSpacing,
              InputTextFieldWidget(
                hintText: "Type username",
                editingController: controller.usernameEditController,
                labelText: "Username",
              ),
              AppTextStyles.mediumVerticalSpacing,
              InputTextFieldWidget(
                  inputType: TextInputType.phone,
                  hintText: "Enter mobile number",
                  editingController: controller.mobileNumberEditController,
                  labelText: "Mobile Number"),
              AppTextStyles.mediumVerticalSpacing,
              InputTextFieldWidget(
                  inputType: TextInputType.phone,
                  hintText: "Enter Date of Birth",
                  editingController: controller.mobileNumberEditController,
              ),
              AppTextStyles.mediumVerticalSpacing,

              InputTextFieldWidget(
                  hintText: "Write about yourself",
                  editingController: controller.personalBioEditController,
                  labelText: "Personal bio"),

              AppTextStyles.mediumVerticalSpacing,

              OutlinedButtonWidget(
                  onClick: (){
                    Get.toNamed(Routes.PREFERENCE_NOTIFICATION);
                  },
                  name: "Continue")

            ],
          ),
        ),
      ),
    ));
  }

  Widget _profileView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/profile.png",
          height: 100,
          width: 100,
        ),
        const Text(
          "John Doe",
          style: AppTextStyles.subHeaderStyle,
        ),
        const Text(
          "@John_Doe",
        ),
      ],
    );
  }
}
