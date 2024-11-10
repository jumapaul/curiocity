import 'package:curiocity/app/common/dimens/dimens.dart';
import 'package:curiocity/app/common/theme/colors.dart';
import 'package:curiocity/app/modules/auth/login_screen/views/widget/InputTextFieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../routes/app_pages.dart';
import '../../common_widget/outlined_button.dart';
import '../controllers/setting_up_profile_controller.dart';

class SettingUpProfileView extends GetView<SettingUpProfileController> {
  const SettingUpProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
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
                      AppTextStyles.largeVerticalSpacing,
                      _buildInputField(
                        hintText: "Type Name",
                        controller: controller.usernameEditController,
                        labelText: "Name",
                      ),
                      AppTextStyles.mediumVerticalSpacing,
                      _buildInputField(
                        hintText: "Type Username",
                        controller: controller.usernameEditController,
                        labelText: "Username",
                      ),
                      AppTextStyles.mediumVerticalSpacing,
                      _buildPhoneField(),
                      AppTextStyles.extraSmallVerticalSpacing,
                      _buildInputField(
                        inputType: TextInputType.datetime,
                        hintText: "Enter Date of Birth",
                        labelText: "Date of birth",
                        controller: controller.mobileNumberEditController,
                      ),
                      AppTextStyles.mediumVerticalSpacing,
                      _buildInputField(
                        hintText: "Write about yourself",
                        controller: controller.personalBioEditController,
                        labelText: "Personal bio",
                      ),
                    ],
                  ),
                ),
              ),
              _buildContinueButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Image.asset(
              "assets/images/profile.png",
              height: 100,
              width: 100,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                radius: 14,
                backgroundColor: colorPrimary,
                child: Icon(
                  Icons.edit,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: smallSize),
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

  Widget _buildInputField({
    required String hintText,
    required TextEditingController controller,
    required String labelText,
    TextInputType inputType = TextInputType.text,
  }) {
    return InputTextFieldWidget(
      hintText: hintText,
      editingController: controller,
      labelText: labelText,
      inputType: inputType,
    );
  }

  Widget _buildPhoneField() {
    return IntlPhoneField(
      decoration: InputDecoration(
        labelText: 'Phone Number',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(Get.context!).colorScheme.inverseSurface,
            width: 1,
          ),
        ),
      ),
      initialCountryCode: 'KE',
      onChanged: (phone) {
        print(phone.completeNumber);
      },
    );
  }

  Widget _buildContinueButton() {
    return OutlinedButtonWidget(
      onClick: () {
        Get.toNamed(Routes.PREFERENCE_NOTIFICATION);
      },
      name: "Continue",
    );
  }
}
