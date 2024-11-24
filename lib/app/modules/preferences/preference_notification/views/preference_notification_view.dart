import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_pages.dart';
import '../../../common_widget/outlined_button.dart';
import '../controllers/preference_notification_controller.dart';

class PreferenceNotificationView
    extends GetView<PreferenceNotificationController> {
  const PreferenceNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    if (Get.arguments != null) {
      controller.arguments["categories"] = Get.arguments["categories"];
      controller.arguments["topics"] = Get.arguments["topics"];
    }
    final List<Map<String, String>> permissions = [
      {
        "key": "notification",
        "title": "Allow notifications",
        "subTitle":
            "Receive notifications for activities, offers and promotions",
      },
      {
        "key": "email",
        "title": "Receive emails",
        "subTitle": "Receive notifications for offers and promotions",
      },
      {
        "key": "personalize",
        "title": "Personalized content",
        "subTitle": "Let us use your data to personalize your content",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Back'),
        centerTitle: false,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Preferences",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text("Adjust your preferences"),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final permission = permissions[index];
                  return NotificationPermissions(
                    key: ValueKey(permission["key"]),
                    title: permission["title"]!,
                    subTitle: permission["subTitle"]!,
                    preferenceKey: permission["key"]!,
                    controller: controller,
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemCount: permissions.length,
              ),
            ),
            OutlinedButtonWidget(
              onClick: () {
                Get.toNamed(Routes.SETTING_UP_PROFILE, arguments: {
                  "categories": controller.arguments['categories'],
                  "topics": controller.arguments['topics'],
                  "notification": controller.preferences['notification'],
                  "email": controller.preferences['email'],
                  "personalize": controller.preferences['personalize'],
                });
              },
              name: "Continue",
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class NotificationPermissions extends StatelessWidget {
  final String title;
  final String subTitle;
  final String preferenceKey;
  final PreferenceNotificationController controller;

  const NotificationPermissions({
    super.key,
    required this.title,
    required this.subTitle,
    required this.preferenceKey,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Get the current state from the controller
      final isSelected = controller.preferences[preferenceKey] ?? false;

      return ListTile(
        title: Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
        subtitle: Text(
          subTitle,
          style: const TextStyle(fontSize: 12),
        ),
        trailing: Switch(
          activeTrackColor: const Color(0xFFFBB80E),
          inactiveTrackColor: Colors.grey.shade300,
          inactiveThumbColor: Colors.white,
          activeColor: Colors.white,
          value: isSelected,
          onChanged: (value) {
            controller.preferences[preferenceKey] = value;
          },
        ),
      );
    });
  }
}
