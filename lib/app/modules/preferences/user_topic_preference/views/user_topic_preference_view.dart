import 'package:curiocity/app/common/dimens/dimens.dart';
import 'package:curiocity/app/common/theme/colors.dart';
import 'package:curiocity/app/common/utils/show_toast.dart';
import 'package:curiocity/app/data/model/topics_response.dart';
import 'package:curiocity/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_widget/outlined_button.dart';
import '../controllers/user_topic_preference_controller.dart';

class UserTopicPreferenceView extends GetView<UserTopicPreferenceController> {
  const UserTopicPreferenceView({super.key});

  static final Color chipBackgroundColor = colorPrimary.withOpacity(1.0);

  @override
  Widget build(BuildContext context) {
    if (Get.arguments != null) {
      controller.selectedCategories.value =
          Get.arguments as RxList<CurioCategory>;
      for (var cat in controller.selectedCategories) {
        controller.topics.addAll(cat.topics ?? []);
      }
    }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(mediumSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: largeSize),
              _buildHeader(),
              const SizedBox(height: mediumSize),
              _buildSubHeader(),
              const SizedBox(height: largeSize),
              Expanded(child: _buildTopicsGrid()),
              OutlinedButtonWidget(
                onClick: () {
                  if (controller.selectedTopics.length < 3) {
                    showToast("Please select at least 3 topics");
                  } else {
                    Get.toNamed(Routes.PREFERENCE_NOTIFICATION);
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
    return const Text(
      "What is most important to you?",
      style: AppTextStyles.headerStyle,
    );
  }

  Widget _buildSubHeader() {
    return const Text(
      "Select 3 or more to continue",
      style: AppTextStyles.subHeaderStyle,
    );
  }

  Widget _buildTopicsGrid() {
    return SingleChildScrollView(
      child: Obx(
        () => Wrap(
          spacing: 5,
          runSpacing: 5,
          children:
              controller.topics.map((topic) => _buildChip(topic)).toList(),
        ),
      ),
    );
  }

  Widget _buildChip(Topic topic) {
    final bool isSelected = controller.selectedTopics.contains(topic);

    return IntrinsicWidth(
      child: GestureDetector(
        onTap: () {
          isSelected
              ? controller.selectedTopics.remove(topic)
              : controller.selectedTopics.add(topic);
        },
        child: Chip(
          label: Text(
            topic.name ?? '',
            style: isSelected
                ? AppTextStyles.selectedChipTextStyle
                : AppTextStyles.chipTextStyle,
          ),
          backgroundColor: isSelected
              ? chipBackgroundColor
              : Theme.of(Get.context!).colorScheme.surface,
          side: BorderSide(
              color: Theme.of(Get.context!).colorScheme.inverseSurface,
              width: 0.5),
          padding: const EdgeInsets.symmetric(horizontal: 4),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(largeSize),
          ),
        ),
      ),
    );
  }
}
