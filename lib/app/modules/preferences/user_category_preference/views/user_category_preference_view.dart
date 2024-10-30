import 'package:curiocity/app/common/dimens/dimens.dart';
import 'package:curiocity/app/common/theme/colors.dart';
import 'package:curiocity/app/common/widget/outlined_button.dart';
import 'package:curiocity/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/user_category_preference_controller.dart';

class UserCategoryPreferenceView
    extends GetView<UserCategoryPreferenceController> {
  const UserCategoryPreferenceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(mediumSize),
          child: Column(
            children: [
              const SizedBox(height: largeSize),
              const Text(
                "Personalise your experience",
                style: TextStyle(
                  fontSize: extraLargeSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: mediumSize),
              _buildHeader(),
              const SizedBox(height: largeSize),
              Expanded(
                child: _buildCategoryList(),
              ),
              OutlinedButtonWidget(
                onClick: () {
                  Get.toNamed(Routes.USER_TOPIC_PREFERENCE);
                },
                name: "Continue",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "What are you curious about?",
          style: TextStyle(
            fontSize: normalSize,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "Select all",
          style: TextStyle(
            fontSize: normalSize,
            fontWeight: FontWeight.w500,
            color: colorPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryList() {
    return ListView.builder(
      itemCount: controller.categories.length,
      itemBuilder: (context, index) {
        var category = controller.categories[index];
        return _buildCategoryTile(category);
      },
    );
  }

  Widget _buildCategoryTile(category) {
    return Container(
      width: Get.width,
      margin: const EdgeInsets.only(bottom: 8),
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: Get.theme.brightness == Brightness.dark
              ? Colors.white70
              : Colors.black87,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(mediumSize),
      ),
      child: ListTile(
        leading: Icon(category.icon),
        title: Text(category.title),
        trailing: Checkbox(
          value: category.selected,
          onChanged: (checked) {
            // Handle checkbox state change
            category.selected = checked ?? false;
            // Call your controller's method to update state if needed
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(mediumSize),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: smallSize,
        ),
      ),
    );
  }
}
