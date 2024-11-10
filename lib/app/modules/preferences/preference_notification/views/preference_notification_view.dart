import 'package:curiocity/app/common/dimens/dimens.dart';
import 'package:curiocity/app/common/theme/colors.dart';
import 'package:curiocity/app/modules/preferences/preference_notification/model/permissions.dart';
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
    List<Permissions> permissions = [
      Permissions(
          title: "Allow notifications",
          subTitle:
              "Receive notifications for activities, offers and promotions"),
      Permissions(
          title: "Receive emails",
          subTitle: "Receive notifications for offers and promotions"),
      Permissions(
          title: "Personalized content",
          subTitle: "Let us use your data to personalize your content ")
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
              style: AppTextStyles.headerStyle,
            ),
            AppTextStyles.smallVerticalSpacing,
            const Text("Adjust your preferences"),
            AppTextStyles.largeVerticalSpacing,
            Flexible(
              flex: 8,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    var singlePermission = permissions[index];

                    return NotificationPermissions(
                      title: singlePermission.title,
                      subTitle: singlePermission.subTitle,
                    );
                  },
                  separatorBuilder: (context, child) {
                    return AppTextStyles.largeVerticalSpacing;
                  },
                  itemCount: permissions.length),
            ),
            const Spacer(),
            OutlinedButtonWidget(
                onClick: () {
                  Get.toNamed(Routes.SETTING_UP_PROFILE);
                },
                name: "Continue")
          ],
        ),
      ),
    );
  }
}

class NotificationPermissions extends StatefulWidget {
  final String title;
  final String subTitle;

  const NotificationPermissions(
      {super.key, required this.title, required this.subTitle});

  @override
  State<NotificationPermissions> createState() =>
      _NotificationPermissionsState();
}

class _NotificationPermissionsState extends State<NotificationPermissions> {
  bool isSelected = false;

  void toggleSwitch(bool value) {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(widget.subTitle),
      trailing: Switch(
          trackOutlineColor: MaterialStateProperty.resolveWith(
              (final Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return null;
            }
            return Colors.grey.shade300;
          }),
          activeTrackColor: colorPrimary,
          inactiveTrackColor: Colors.grey.shade300,
          inactiveThumbColor: Colors.white,
          activeColor: Colors.white,
          value: isSelected,
          onChanged: toggleSwitch),
    );
  }
}
