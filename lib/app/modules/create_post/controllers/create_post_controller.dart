import 'dart:io';
import 'package:curiocity/app/data/model/topics_response.dart';
import 'package:curiocity/app/data/providers/api_provider.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostController extends GetxController {
  var image = Rxn<File>();
  final ImagePicker picker = ImagePicker();
  final ApiProvider apiProvider = Get.find<ApiProvider>();
  var topics = Rxn<TopicsResponse>();
  var selectedCategories = RxList<CurioCategory>();
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getCategory();  // Fetch categories when the controller is initialized
  }

  void getCategory() async {
    isLoading.value = true;
    try {
      final topicsResponse = await apiProvider.getData<TopicsResponse>(
        'category',
            (json) => TopicsResponse.fromJson(json),
      );
      topics.value = topicsResponse;
    } catch (e) {
      // Handle error (e.g., show a snackbar or log error)
      print('Error fetching categories: $e');
    } finally {
      isLoading.value = false;
    }
  }

}
