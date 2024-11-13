import 'package:curiocity/app/common/dimens/dimens.dart';
import 'package:curiocity/app/common/theme/colors.dart';
import 'package:curiocity/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForYouPage extends StatelessWidget {
  final HomeController controller;

  const ForYouPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final Color chipBackgroundColor = colorPrimary.withOpacity(1.0);

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 10, // Replace with actual item count
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildUserInfoRow(chipBackgroundColor),
                    AppTextStyles.smallVerticalSpacing,
                    const Text(
                      "Having a great day with my amazing client all the way from New York",
                    ),
                    AppTextStyles.smallVerticalSpacing,
                    Image.asset(
                      "assets/images/post.png",
                      width: Get.width,
                    ),
                    AppTextStyles.smallVerticalSpacing,
                    _buildActionRow()
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildUserInfoRow(Color chipBackgroundColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("John Doe"),
                const Text("15 hours ago"),
                _buildCategoryChip(chipBackgroundColor),
              ],
            ),
          ],
        ),
        const Icon(Icons.more_horiz_outlined)
      ],
    );
  }

  Widget _buildCategoryChip(Color backgroundColor) {
    return Chip(
      label: const Text(
        "Lifestyle",
        style: AppTextStyles.selectedChipTextStyle,
      ),
      backgroundColor: backgroundColor,
      side: BorderSide(
        color: Theme.of(Get.context!).colorScheme.inverseSurface,
        width: 0.5,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(largeSize),
      ),
    );
  }

  Widget _buildActionRow() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.arrow_upward_sharp),
            SizedBox(width: 4),
            Text("59.6 K"),
            SizedBox(width: 4),
            Icon(Icons.arrow_downward_outlined),
          ],
        ),
        Row(
          children: [
            Icon(Icons.message_outlined),
            SizedBox(width: 4),
            Text("1230"),
          ],
        ),
        Row(
          children: [
            Icon(Icons.bookmark_add_outlined),
            SizedBox(width: 4),
            Icon(Icons.share),
          ],
        ),
      ],
    );
  }
}
