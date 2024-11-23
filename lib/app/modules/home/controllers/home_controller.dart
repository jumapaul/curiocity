import 'dart:io';

import 'package:curiocity/app/data/model/topics_response.dart';
import 'package:curiocity/app/data/providers/api_provider.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  var image = Rxn<File>();
  final ImagePicker picker = ImagePicker();
  final ApiProvider apiProvider = Get.find<ApiProvider>();
  var topics = Rxn<TopicsResponse>();
  var selectedCategories = RxList<CurioCategory>();
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getCategory();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getCategory() async {
    isLoading.value = true;
    final topicsResponse = await apiProvider.getData<TopicsResponse>(
      'category',
      (json) => TopicsResponse.fromJson(json),
    );
    topics.value = topicsResponse;
    isLoading.value = false;
  }

  Future<void> pickImage() async {
    try {
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
      );

      if (pickedFile != null) {
        image.value = File(pickedFile.path);
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> takePhoto() async {
    try {
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1800,
        maxHeight: 1800,
      );

      if (pickedFile != null) {
        image.value = File(pickedFile.path);
      }
    } catch (e) {
      print('Error taking photo: $e');
    }
  }
}
