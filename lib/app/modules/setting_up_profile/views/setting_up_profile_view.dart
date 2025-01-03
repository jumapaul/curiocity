import 'package:curiocity/app/common/dimens/dimens.dart';
import 'package:curiocity/app/common/theme/colors.dart';
import 'package:curiocity/app/data/model/update_user_profile_request.dart';
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
    if (Get.arguments != null) {
      controller.arguments.value = Get.arguments as Map<String, dynamic>;
      print("User--->${Get.arguments}");
    }
    print("User--->${controller.user.value?.toJson()}");
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
                      _buildPhoneField(),
                      AppTextStyles.extraSmallVerticalSpacing,
                      _buildInputField(
                        inputType: TextInputType.datetime,
                        hintText: "Enter Date of Birth",
                        labelText: "Date of birth",
                        isDateField: true,
                        controller: controller.dateOfBirthEditController,
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
                  onTap: showImagePickerOptions,
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
          Text(
            controller.user.value?.name ?? '',
            style: AppTextStyles.subHeaderStyle,
          ),
          Text(
            controller.user.value?.email ?? '',
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
            child: TextFormField(
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
        hintStyle: TextStyle(
            fontSize: 14,
            color: Get.theme.colorScheme.inverseSurface.withOpacity(.7)),
        labelStyle: TextStyle(
            fontSize: 14,
            color: Get.theme.colorScheme.inverseSurface.withOpacity(.7)),
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
        controller.phoneEditController.text = phone.completeNumber;
        print(phone.completeNumber);
      },
      style: const TextStyle(
        fontSize: 14,
      ),
    );
  }

  Widget _buildContinueButton() {
    return Obx(
      () => OutlinedButtonWidget(
        onClick: () {
          var request = UpdateUserProfileRequest(
            email: controller.user.value?.email,
            name: controller.usernameEditController.text,
            dateOfBirth: controller.dateOfBirthEditController.text,
            interests: controller.arguments.value?["categories"].split("#"),
            subInterests: controller.arguments.value?["topics"].split("#"),
            pushNotification: controller.arguments.value?['notification'],
            emailNotification: controller.arguments.value?['email'],
            personalizedContent: controller.arguments.value?['personalize'],
            bio: controller.personalBioEditController.text,
            phone: controller.phoneEditController.text,
            profileImage: controller.imageUrl.value,
            address: '',
            city: '',
            country: '',
            location: '',
          );
          controller.updateUserProfile(request);
        },
        name: "Continue",
        child: controller.isLoading.value
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : null,
      ),
    );
  }

  void showImagePickerOptions() {
    showCupertinoModalPopup(
      context: Get.context!,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          message: const Text(
            'Select a photo source',
            style: TextStyle(fontSize: 14),
          ),
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                Get.back();
                controller.pickImage();
              },
              child: const Text('Photo Library'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Get.back();
                controller.takePhoto();
              },
              child: const Text('Camera'),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
        );
      },
    );
  }
}
