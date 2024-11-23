import 'package:curiocity/app/common/dimens/dimens.dart';
import 'package:curiocity/app/common/theme/colors.dart';
import 'package:curiocity/app/modules/auth/login_screen/views/widget/InputTextFieldWidget.dart';
import 'package:flutter/cupertino.dart';
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
                        isDateField: true,
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
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              ClipOval(
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[200], // Optional background color
                  ),
                  child: controller.image.value != null
                      ? Image.file(
                          controller.image.value!,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover, // Add fit property
                        )
                      : Image.asset(
                          "assets/images/profile.png",
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover, // Add fit property
                        ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: _showImagePickerOptions,
                  child: const CircleAvatar(
                    radius: 14,
                    backgroundColor: colorPrimary,
                    child: Icon(
                      Icons.edit,
                      size: 16,
                      color: Colors.white,
                    ),
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
      ),
    );
  }

  Widget _buildInputField({
    required String hintText,
    required TextEditingController controller,
    required String labelText,
    bool isDateField = false,
    TextInputType inputType = TextInputType.text,
  }) {
    return isDateField
        ? GestureDetector(
            onTap: () {
              _showDatePicker(Get.context!, controller);
            },
            child: TextField(
              keyboardType: TextInputType.datetime,
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                labelText: labelText,
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
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Get.theme.colorScheme.inverseSurface.withOpacity(.5),
                ),
                labelStyle: TextStyle(
                  fontSize: 14,
                  color: Get.theme.colorScheme.inverseSurface.withOpacity(.9),
                ),
              ),
              enabled: false,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          )
        : InputTextFieldWidget(
            hintText: hintText,
            editingController: controller,
            labelText: labelText,
            inputType: inputType,
          );
  }

  void _showDatePicker(BuildContext context, TextEditingController controller) {
    DateTime initialDateTime = controller.text.isNotEmpty
        ? DateTime.tryParse(controller.text) ?? DateTime.now()
        : DateTime.now();

    showDatePicker(
      context: context,
      initialDate: initialDateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate != null) {
        controller.text =
            '${pickedDate.toLocal()}'.split(' ')[0]; // Format as 'YYYY-MM-DD'
      }
    });
  }

  Widget _buildPhoneField() {
    return IntlPhoneField(
      decoration: InputDecoration(
        labelText: 'Phone Number',
        hintStyle: const TextStyle(fontSize: 14),
        labelStyle: const TextStyle(fontSize: 14),
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
      style: const TextStyle(
        fontSize: 14,
      ),
    );
  }

  Widget _buildContinueButton() {
    return OutlinedButtonWidget(
      onClick: () {
        Get.toNamed(Routes.HOME);
      },
      name: "Continue",
    );
  }

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: Get.context!,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  Get.back();
                  controller.pickImage();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  Get.back();
                  controller.takePhoto();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
