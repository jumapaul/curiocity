import 'package:curiocity/app/common/dimens/dimens.dart';
import 'package:curiocity/app/common/theme/colors.dart';
import 'package:curiocity/app/common/widget/outlined_button.dart';
import 'package:curiocity/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_topic_preference_controller.dart';

class UserTopicPreferenceView extends GetView<UserTopicPreferenceController> {
  const UserTopicPreferenceView({super.key});

  static const headerStyle = TextStyle(
    fontSize: extraLargeSize,
    fontWeight: FontWeight.bold,
  );

  static const subHeaderStyle = TextStyle(
    fontSize: normalSize,
    fontWeight: FontWeight.w500,
  );

  static var chipTextStyle = TextStyle(
    fontSize: 14,
    color: Get.theme.brightness == Brightness.dark
        ? Colors.white70
        : Colors.white70,
  );
  static final chipBackgroundColor = colorPrimary.withOpacity(1.0);
  static final chipBorderColor = Colors.black87.withOpacity(0.3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(mediumSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: largeSize),
              const Text("What is most important to you?", style: headerStyle),
              const SizedBox(height: mediumSize),
              buildSubHeader(),
              const SizedBox(height: largeSize),
              Expanded(child: buildTopicsGrid()),
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

  Widget buildSubHeader() {
    return const Text("Select 5 or more to continue", style: subHeaderStyle);
  }

  Widget buildTopicsGrid() {
    return SingleChildScrollView(
      child: Wrap(
        spacing: 5,
        runSpacing: 5,
        children: List.generate(
          controller.topics.length,
          (index) => IntrinsicWidth(
            child: Chip(
              label: Text(
                controller.topics[index],
                style: chipTextStyle,
              ),
              backgroundColor: chipBackgroundColor,
              side: BorderSide(color: chipBorderColor),
              padding: const EdgeInsets.symmetric(horizontal: 2),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  largeSize,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
