import 'package:curiocity/app/common/dimens/dimens.dart';
import 'package:curiocity/app/common/theme/colors.dart';
import 'package:curiocity/app/common/utils/show_toast.dart';
import 'package:curiocity/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../common_widget/outlined_button.dart';
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
                  if (controller.selectedCategories.isEmpty) {
                    showToast("Please select at least one category");
                  } else {
                    Get.toNamed(
                      Routes.USER_TOPIC_PREFERENCE,
                      arguments: controller.selectedCategories,
                    );
                  }
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
    const TextStyle headerStyle = TextStyle(
      fontSize: normalSize,
      fontWeight: FontWeight.w500,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "What are you curious about?",
          style: headerStyle,
        ),
        Obx(
          () => controller.isLoading.value
              ? Container()
              : GestureDetector(
                  onTap: () {
                    if (controller.selectedCategories.length ==
                        (controller.topics.value?.data?.length ?? 0)) {
                      controller.selectedCategories.clear();
                    } else {
                      controller.selectedCategories
                        ..clear()
                        ..addAll(controller.topics.value?.data ?? []);
                    }
                  },
                  child: Text(
                    "Select all",
                    style: headerStyle.copyWith(color: colorPrimary),
                  ),
                ),
        ),
      ],
    );
  }

  Widget _buildCategoryList() {
    return Obx(
      () => ListView.builder(
        itemCount: controller.topics.value?.data?.length ?? 0,
        itemBuilder: (context, index) {
          var category = controller.topics.value?.data?[index];
          return controller.isLoading.value
              ? _buildShimmerPlaceholder()
              : _buildCategoryTile(category);
        },
      ),
    );
  }

  Widget _buildShimmerPlaceholder() {
    return SizedBox(
      height: Get.height,
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          );
        },
      ),
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
              : Colors.black26,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(mediumSize),
      ),
      child: Obx(
        () => ListTile(
          title: Text(category.name),
          trailing: Checkbox(
            checkColor: Colors.white,
            fillColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return Colors.orange;
              }
              return Theme.of(Get.context!).colorScheme.surface;
            }),
            value: controller.selectedCategories.contains(category),
            onChanged: (checked) {
              if (controller.selectedCategories.contains(category)) {
                controller.selectedCategories.remove(category);
              } else {
                controller.selectedCategories.add(category);
              }
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(mediumSize),
              side: const BorderSide(
                width: 1.0, // Border width
              ),
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: smallSize,
          ),
        ),
      ),
    );
  }
}
