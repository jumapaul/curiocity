import 'package:curiocity/app/common/dimens/dimens.dart';
import 'package:curiocity/app/common/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../controllers/home_controller.dart';

class BookmarksPage extends StatelessWidget {
  final HomeController controller;

  const BookmarksPage({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final Color chipBackgroundColor = colorPrimary.withOpacity(1.0);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextStyles.mediumVerticalSpacing,
          Container(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              "Posts",
              style: Get.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          AppTextStyles.mediumVerticalSpacing,
          Expanded(
            child: ListView.builder(
              itemCount: 1,
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
                      Container(
                        width: Get.width,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "assets/images/post.png",
                            ),
                          ),
                        ),
                      ),
                      AppTextStyles.mediumVerticalSpacing,
                      _buildActionRow()
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfoRow(Color chipBackgroundColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 20,
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "John Doe",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text(
                  "15 hours ago",
                  style: TextStyle(fontSize: 12),
                ),
                AppTextStyles.extraSmallVerticalSpacing,
                _buildCategoryChip(chipBackgroundColor),
              ],
            ),
          ],
        ),
        Icon(
          Icons.more_horiz_outlined,
          color: Get.theme.colorScheme.inverseSurface.withOpacity(.6),
        )
      ],
    );
  }

  Widget _buildCategoryChip(Color backgroundColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.orange,
        border: Border.all(
          color: const Color(0xFFFBB80E), // Border color
          width: 1.0, // Border width
        ),
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: const Text(
        "Lifestyle",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildActionRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.arrow_upward_sharp,
                color: Get.theme.colorScheme.inverseSurface.withOpacity(.6)),
            const SizedBox(width: 4),
            Text(
              "59.6 K",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Get.theme.colorScheme.inverseSurface.withOpacity(.7),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: _showBottomSheet,
          child: Row(
            children: [
              Icon(Icons.message_outlined,
                  color: Get.theme.colorScheme.inverseSurface.withOpacity(.6)),
              const SizedBox(width: 4),
              Text(
                "1230",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Get.theme.colorScheme.inverseSurface.withOpacity(.7),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.block_flipped,
              color: Get.theme.colorScheme.inverseSurface.withOpacity(.6),
            ),
            const SizedBox(width: 10),
            Icon(Icons.share,
                color: Get.theme.colorScheme.inverseSurface.withOpacity(.6)),
          ],
        ),
      ],
    );
  }

  void _showBottomSheet() {
    showMaterialModalBottomSheet(
      context: Get.context!,
      expand: false,
      builder: (context) => SizedBox(
        height: Get.height * 0.6,
        child: Scaffold(
          body: Column(
            children: [
              AppTextStyles.mediumVerticalSpacing,
              Expanded(
                child: ListView.builder(
                  itemCount: 20,
                  padding: const EdgeInsets.all(0),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const CircleAvatar(
                        radius: 20,
                      ),
                      title: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Paul Odhiambo",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "2 days ago",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                      subtitle: const Text("This is a test comment"),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context)
                      .viewInsets
                      .bottom, // This makes it rise with keyboard
                ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                  decoration: BoxDecoration(
                    color: Get.theme.brightness == Brightness.dark
                        ? Get.theme.colorScheme.surface
                        : Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Get.theme.brightness == Brightness.dark
                                    ? Get.theme.colorScheme.onSurface
                                        .withOpacity(.5)
                                    : Colors.grey[200],
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Add a comment...',
                                  hintStyle: TextStyle(
                                      color:
                                          Get.theme.colorScheme.inverseSurface),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFFFBB80E),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: () {
                                // Add your send logic here
                              },
                              icon: const Icon(
                                Icons.send,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
