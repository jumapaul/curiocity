import 'package:curiocity/app/common/dimens/dimens.dart';
import 'package:curiocity/app/modules/on_board_screen/views/on_board_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class ExplorePage extends StatelessWidget {
  final HomeController controller;

  const ExplorePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Explore",
                style: Get.textTheme.headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              AppTextStyles.smallVerticalSpacing,
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Color(0xFFFBB80E),
                  ),
                  AppTextStyles.smallHorizontalSpacing,
                  Text(
                    "Nairobi, CBD",
                    style: Get.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.w400),
                  )
                ],
              ),
              AppTextStyles.largeVerticalSpacing,
              Card(
                elevation: 0,
                color: const Color(0xFFd8effa),
                child: SizedBox(
                  width: Get.width,
                  height: 150,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 16),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Start your journey by Posting your First Curio",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                              AppTextStyles.extraSmallVerticalSpacing,
                              Text(
                                "Go to start activity to get started",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black87),
                              )
                            ],
                          ),
                        ),
                      ),
                      AppTextStyles.smallHorizontalSpacing,
                      Container(
                        width: Get.width * .4,
                        padding: const EdgeInsets.only(right: 16),
                        child: SvgPicture.asset("assets/images/explore.svg"),
                      ),
                    ],
                  ),
                ),
              ),
              AppTextStyles.mediumVerticalSpacing,
              const DotIndicator(
                totalPages: 3,
                currentPage: 0,
              ),
              AppTextStyles.mediumVerticalSpacing,
              AppTextStyles.mediumVerticalSpacing,
              Card(
                color: const Color(0xf1ffeac2),
                elevation: 0,
                child: SizedBox(
                  width: Get.width,
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.image,
                        size: 50,
                      ),
                      AppTextStyles.smallVerticalSpacing,
                      Text(
                        "Add Space",
                        style: Get.textTheme.titleMedium
                            ?.copyWith(color: Colors.black87),
                      )
                    ],
                  ),
                ),
              ),
              AppTextStyles.largeVerticalSpacing,
              Text(
                "Your Upcoming",
                style: Get.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              AppTextStyles.mediumVerticalSpacing,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Curios You joined",
                    style: Get.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Text("View All")
                ],
              ),
              AppTextStyles.mediumVerticalSpacing,
              Card(
                elevation: 0,
                color: Get.theme.colorScheme.inverseSurface.withOpacity(.05),
                child: SizedBox(
                  width: Get.width,
                  height: 170,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/images/post.png"),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            AppTextStyles.mediumHorizontalSpacing,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Farmers Market",
                                  style: Get.textTheme.titleSmall
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                AppTextStyles.smallVerticalSpacing,
                                const Row(
                                  children: [
                                    Icon(Icons.calendar_today_outlined),
                                    AppTextStyles.smallHorizontalSpacing,
                                    Text("20/11/2024")
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Get.theme.colorScheme.inverseSurface
                            .withOpacity(.1),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.person),
                                AppTextStyles.smallHorizontalSpacing,
                                Text("50 Members")
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined),
                                AppTextStyles.smallHorizontalSpacing,
                                Text("Ngong")
                              ],
                            ),
                            Row(
                              children: [
                                Text("View"),
                                AppTextStyles.smallHorizontalSpacing,
                                Icon(Icons.arrow_forward_ios),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              AppTextStyles.largeVerticalSpacing,
              Text(
                "Recommended",
                style: Get.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              AppTextStyles.mediumVerticalSpacing,
              Card(
                color: Get.theme.colorScheme.inverseSurface.withOpacity(.05),
                elevation: 0,
                child: SizedBox(
                  width: Get.width,
                  height: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextStyles.mediumVerticalSpacing,
                      Container(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          "Farmers Market",
                          style: Get.textTheme.titleSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      AppTextStyles.extraSmallVerticalSpacing,
                      Container(
                        padding: const EdgeInsets.only(left: 16),
                        child: const Text("2023-06-15"),
                      ),
                      AppTextStyles.extraSmallVerticalSpacing,
                      Container(
                        padding: const EdgeInsets.only(left: 16),
                        child: const Row(
                          children: [
                            Icon(Icons.location_on_outlined),
                            AppTextStyles.smallHorizontalSpacing,
                            Text("Nairobi, CBD")
                          ],
                        ),
                      ),
                      AppTextStyles.mediumVerticalSpacing,
                      Container(
                        width: Get.width,
                        height: 120,
                        color: const Color(0xf1ffeac2),
                        child: const Center(
                          child: Icon(
                            Icons.image,
                            size: 50,
                          ),
                        ),
                      ),
                      AppTextStyles.mediumVerticalSpacing,
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Card(
                              color: const Color(0xFFFBB80E),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 6),
                                child: const Text(
                                  "Learn More",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            Container(
                              width: 60,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Get.theme.colorScheme.inverseSurface
                                      .withOpacity(.4), // Border color
                                  width: 1, // Border width
                                ),
                                borderRadius:
                                    BorderRadius.circular(12), // Corner radius
                              ),
                              child: const Icon(Icons.bookmark_border),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AppTextStyles.mediumVerticalSpacing,
              const DotIndicator(
                totalPages: 3,
                currentPage: 0,
              ),
              AppTextStyles.largeVerticalSpacing,
              Text(
                "New Updates",
                style: Get.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              AppTextStyles.largeVerticalSpacing,
              SizedBox(
                width: Get.width,
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 20,
                        ),
                        AppTextStyles.smallHorizontalSpacing,
                        Text(
                          "CurioCity",
                          style: Get.textTheme.titleMedium,
                        )
                      ],
                    ),
                    AppTextStyles.mediumVerticalSpacing,
                    const Text("Coming soon, Features, Fixes, Updates etc"),
                    AppTextStyles.mediumVerticalSpacing,
                    Container(
                      width: Get.width,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/post.png"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              AppTextStyles.largeVerticalSpacing,
            ],
          ),
        ),
      ),
    );
  }
}
