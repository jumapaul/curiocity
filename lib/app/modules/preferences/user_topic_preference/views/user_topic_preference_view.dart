import 'package:curiocity/app/common/dimens/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../controllers/user_topic_preference_controller.dart';

class UserTopicPreferenceView extends GetView<UserTopicPreferenceController> {
  const UserTopicPreferenceView({super.key});

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
              const Text(
                "What is most important to you?",
                style: TextStyle(
                  fontSize: extraLargeSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: mediumSize),
              _buildHeader(),
              const SizedBox(height: largeSize),
              _buildTopicGrid(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Text(
      "Select 5 or more to continue",
      style: TextStyle(
        fontSize: normalSize,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildTopicGrid() {
    return MasonryGridView.count(
      crossAxisCount: 3,
      itemCount: controller.topics.length,
      itemBuilder: (BuildContext context, int index) {
        final topic = controller.topics[index];
        return Chip(
          label: Text(topic),
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        );
      },
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
