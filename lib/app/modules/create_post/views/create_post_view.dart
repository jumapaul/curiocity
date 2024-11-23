import 'package:curiocity/app/data/model/topics_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:get/get.dart';
import 'package:multi_select_search/multi_select_search.dart';
import '../controllers/create_post_controller.dart';

class CreatePostView extends GetView<CreatePostController> {
  const CreatePostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
        centerTitle: true,
      ),
      body: Obx(
        () => Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              MultiSelectContainer(
                itemsDecoration: MultiSelectDecorations(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:
                          Get.theme.colorScheme.inverseSurface.withOpacity(.5),
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  selectedDecoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [Color(0xFFFBB80E), Color(0xFFFBB80E)]),
                    border: Border.all(
                      color:
                          Get.theme.colorScheme.inverseSurface.withOpacity(.5),
                      width: 0.3,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  disabledDecoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.grey[500]!),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                prefix: MultiSelectPrefix(
                    selectedPrefix: const Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                    disabledPrefix: const Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Icon(
                        Icons.do_disturb_alt_sharp,
                        size: 14,
                      ),
                    )),
                items: controller.topics.value?.data
                        ?.map((topic) =>
                            MultiSelectCard(value: topic, label: topic.name))
                        .toList() ??
                    [],
                onChange: (allSelectedItems, selectedItem) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectTag extends StatelessWidget {
  const SelectTag({
    super.key,
    required this.label,
    required this.onDeleted,
    required this.index,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;
  final Color darkAlias6 = const Color.fromRGBO(36, 37, 51, 0.06);

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: darkAlias6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text(label),
      deleteIcon: const Icon(
        Icons.close,
        size: 18,
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}
