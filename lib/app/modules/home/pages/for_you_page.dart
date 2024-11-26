import 'package:curiocity/app/common/dimens/dimens.dart';
import 'package:curiocity/app/common/theme/colors.dart';
import 'package:curiocity/app/data/model/comments_response.dart';
import 'package:curiocity/app/data/model/posts_response.dart';
import 'package:curiocity/app/modules/home/controllers/home_controller.dart';
import 'package:curiocity/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:parsed_readmore/parsed_readmore.dart';
import 'package:timeago/timeago.dart' as timeago;

class ForYouPage extends StatelessWidget {
  final HomeController controller;

  const ForYouPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final Color chipBackgroundColor = colorPrimary.withOpacity(1.0);
    return Scaffold(
      body: Column(
        children: [
          AppTextStyles.mediumVerticalSpacing,
          Container(
            height: 30,
            margin: const EdgeInsets.only(left: 10),
            child: Obx(
              () => ListView.builder(
                itemCount: controller.topics.value?.data?.length ?? 0,
                itemBuilder: (context, index) {
                  var category = controller.topics.value?.data?[index];
                  return GestureDetector(
                    onTap: () {
                      if (controller.selectedCategories.contains(category)) {
                        controller.selectedCategories.remove(category);
                      } else {
                        controller.selectedCategories.add(category!);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: Obx(
                        () => Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color:
                                controller.selectedCategories.contains(category)
                                    ? const Color(0xFFFBB80E)
                                    : Get.theme.brightness == Brightness.dark
                                        ? Get.theme.colorScheme.surface
                                        : Colors.white,
                            border: Border.all(
                              color: Theme.of(Get.context!)
                                  .colorScheme
                                  .inverseSurface
                                  .withOpacity(.3),
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(largeSize),
                          ),
                          alignment: Alignment.center,
                          // Center text vertically and horizontally
                          child: IntrinsicWidth(
                            child: Text(
                              category?.name ?? "",
                              style: TextStyle(
                                color: controller.selectedCategories
                                        .contains(category)
                                    ? Colors.white
                                    : Get.theme.colorScheme.inverseSurface,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          AppTextStyles.mediumVerticalSpacing,
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.posts.value?.data?.length ?? 0,
                itemBuilder: (context, index) {
                  var post = controller.posts.value?.data?[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildUserInfoRow(chipBackgroundColor, post),
                        AppTextStyles.smallVerticalSpacing,
                        ParsedReadMore(post?.description ?? '-'),
                        AppTextStyles.smallVerticalSpacing,
                        post?.postMedias?.isNotEmpty == true
                            ? Container(
                                width: Get.width,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      post?.postMedias?.first.url ?? "",
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                        AppTextStyles.mediumVerticalSpacing,
                        _buildActionRow(post)
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFBB80E),
        onPressed: () {
          Get.toNamed(Routes.CREATE_POST);
        },
        child: Icon(
          Icons.edit,
          color: Get.theme.colorScheme.surface,
        ),
      ),
    );
  }

  Widget _buildUserInfoRow(Color chipBackgroundColor, Data? post) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            post?.user?.profilePictureUrl == null
                ? const CircleAvatar(
                    radius: 20,
                  )
                : CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        NetworkImage(post?.user?.profilePictureUrl ?? ''),
                  ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post?.user?.name ?? '',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  timeago.format(DateTime.parse(post?.createdAt ?? '')),
                  style: const TextStyle(fontSize: 12),
                ),
                AppTextStyles.extraSmallVerticalSpacing,
                _buildCategoryChip(chipBackgroundColor, post),
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

  Widget _buildCategoryChip(Color backgroundColor, Data? post) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 120, // Adjust based on your design needs
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.orange,
        border: Border.all(
          color: const Color(0xFFFBB80E), // Border color
          width: 1.0, // Border width
        ),
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Text(
        _truncateText(post?.categories?.firstOrNull ?? "", 15),
        style: const TextStyle(
          color: Colors.white,
          overflow: TextOverflow.ellipsis,
        ),
        maxLines: 1,
      ),
    );
  }

  /// Truncates text to a maximum length with ellipsis
  String _truncateText(String text, int maxLength) {
    if (text.length > maxLength) {
      return '${text.substring(0, maxLength)}…';
    }
    return text;
  }

  Widget _buildActionRow(Data? post) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () => controller.upVote(post?.id ?? ""),
              icon: Icon(
                Icons.arrow_upward_sharp,
                color: Get.theme.colorScheme.inverseSurface.withOpacity(.6),
              ),
            ),
            const SizedBox(width: 4),
            Text(
              '${post?.upVotes}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Get.theme.colorScheme.inverseSurface.withOpacity(.7),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () => _showBottomSheet(post?.id ?? ""),
          child: Row(
            children: [
              Icon(Icons.message_outlined,
                  color: Get.theme.colorScheme.inverseSurface.withOpacity(.6)),
              const SizedBox(width: 4),
              Text(
                "${post?.comments}",
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
            IconButton(
              onPressed: () => controller.bookMark(post?.id ?? ''),
              icon: Image.asset(
                'assets/images/bookmark.png',
                color:
                    post?.bookmarks?.contains(controller.user.value?.id) == true
                        ? const Color(0xFFFBB80E)
                        : Get.theme.colorScheme.inverseSurface,
              ),
            ),
            const SizedBox(width: 4),
            IconButton(
              onPressed: () => print(""),
              icon: Icon(
                Icons.share,
                color: Get.theme.colorScheme.inverseSurface.withOpacity(.6),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _showBottomSheet(String id) {
    controller.comments.value = CommentsResponse();
    controller.getComments(id);
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
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.posts.value?.data?.length ?? 0,
                    padding: const EdgeInsets.all(0),
                    itemBuilder: (context, index) {
                      var comment = controller.comments.value?.data?[index];
                      return ListTile(
                        leading: const CircleAvatar(
                          radius: 20,
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              comment?.user?.name ?? '',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Text(
                              "2 days ago",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                        subtitle: Text(comment?.content ?? ''),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border),
                        ),
                      );
                    },
                  ),
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
