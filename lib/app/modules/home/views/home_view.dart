import 'package:curiocity/app/common/dimens/dimens.dart';
import 'package:curiocity/app/common/theme/colors.dart';
import 'package:curiocity/app/modules/home/pages/inbox_page.dart';
import 'package:curiocity/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import '../controllers/home_controller.dart';
import '../pages/bookmarks_page.dart';
import '../pages/explore_page.dart';
import '../pages/for_you_page.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.brightness == Brightness.dark
          ? Get.theme.colorScheme.surface
          : Colors.white,
      appBar: AppBar(
        title: Image.asset("assets/images/logo.png"),
        iconTheme: const IconThemeData(color: Color(0xFFFBB80E), size: 30),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.SEARCH);
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
          _notificationBadge(),
          Container(
            width: 10,
          )
        ],
        elevation: 0,
      ),
      body: Obx(
        () => IndexedStack(
          index: controller.selectedIndex.value,
          children: [
            ForYouPage(
              controller: controller,
            ),
            ExplorePage(
              controller: controller,
            ),
            InboxPage(
              controller: controller,
            ),
            BookmarksPage(
              controller: controller,
            )
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: _buildNavigationDestinations(),
          elevation: 10,
          backgroundColor:
              Get.theme.colorScheme.inverseSurface.withOpacity(.025),
          indicatorColor: Get.theme.colorScheme.inverseSurface.withOpacity(.1),
        ),
      ),
      drawer: Drawer(
        elevation: 0,
        backgroundColor: Get.theme.brightness == Brightness.dark
            ? Get.theme.colorScheme.surface
            : Colors.white,
        child: Column(
          children: [
            _profileView(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: _buildDrawerItems(),
              ),
            ),
            _buildLogoutSection(),
          ],
        ),
      ),
    );
  }

  Widget _notificationBadge() {
    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: 0, end: 3),
      badgeAnimation: const badges.BadgeAnimation.slide(
        disappearanceFadeAnimationDuration: Duration(milliseconds: 200),
        curve: Curves.easeInCubic,
      ),
      showBadge: true,
      badgeStyle: const badges.BadgeStyle(
        badgeColor: Colors.orange,
      ),
      badgeContent: const Text(
        "",
      ),
      child: IconButton(
        icon: const Icon(
          Icons.notifications,
          color: Colors.blueGrey,
        ),
        onPressed: () {
          controller.fetchPosts();
        },
      ),
    );
  }

  List<NavigationDestination> _buildNavigationDestinations() {
    return [
      _buildNavigationDestination('assets/images/you.png', 'For You'),
      _buildNavigationDestination('assets/images/explore.png', 'Explore'),
      const NavigationDestination(
        icon: Icon(Icons.messenger_outline_outlined),
        selectedIcon:
            Icon(Icons.messenger_outline_outlined, color: Colors.orange),
        label: 'Conversations',
      ),
      _buildNavigationDestination('assets/images/bookmark.png', 'Bookmarks'),
    ];
  }

  NavigationDestination _buildNavigationDestination(
      String iconPath, String label) {
    return NavigationDestination(
      icon: Image.asset(
        iconPath,
        height: 24,
        width: 24,
        color: Colors.grey,
      ),
      selectedIcon: Image.asset(
        iconPath,
        height: 24,
        width: 24,
        color: Colors.orange,
      ),
      label: label,
    );
  }

  List<Widget> _buildDrawerItems() {
    return [
      _buildListTile(Icons.account_circle, 'Profile Settings', () {
        Get.back();
        // Navigate to profile settings
      }),
      _buildListTile(Icons.account_box, 'My Account', () {
        // Handle my account
      }),
      _buildListTile(Icons.business, 'My Businesses', () {
        // Handle my businesses
      }),
      _buildListTile(Icons.security, 'Privacy & Security', () {
        // Handle privacy & security settings
      }),
      _buildListTile(Icons.help_outline, 'FAQS', () {
        // Handle FAQs
      }),
    ];
  }

  ListTile _buildListTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  Widget _buildLogoutSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          const Divider(),
          _buildListTile(Icons.logout, 'Logout', () {
            // Handle logout
            Get.back();
            // Add logout logic
          }),
        ],
      ),
    );
  }

  Widget _profileView() {
    return Obx(
      () => SafeArea(
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ClipOval(
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[200], // Optional background color
                      ),
                      child: controller.image.value != null
                          ? Image.file(
                              controller.image.value!,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover, // Add fit property
                            )
                          : controller.userProfile.value?.data
                                      ?.profilePictureUrl?.isNotEmpty ==
                                  true
                              ? Image.network(
                                  controller.userProfile.value?.data
                                          ?.profilePictureUrl ??
                                      '',
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  "assets/images/profile.png",
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover, // Add fit property
                                ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: showImagePickerOptions,
                      child: const CircleAvatar(
                        radius: 14,
                        backgroundColor: colorPrimary,
                        child: Icon(
                          Icons.edit,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: smallSize),
              Text(
                controller.userProfile.value?.data?.name ?? '',
                style: AppTextStyles.subHeaderStyle,
              ),
              Text(
                controller.userProfile.value?.data?.email ?? '',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showImagePickerOptions() {
    showCupertinoModalPopup(
      context: Get.context!,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          message: const Text(
            'Select a photo source',
            style: TextStyle(fontSize: 14),
          ),
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                Get.back();
                controller.pickImage();
              },
              child: const Text('Photo Library'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Get.back();
                controller.takePhoto();
              },
              child: const Text('Camera'),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
        );
      },
    );
  }
}
