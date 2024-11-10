import 'package:curiocity/app/data/model/topics_response.dart';
import 'package:curiocity/app/data/providers/api_provider.dart';
import 'package:get/get.dart';

class UserCategoryPreferenceController extends GetxController {
  final ApiProvider apiProvider = Get.find<ApiProvider>();
  var topics = Rxn<TopicsResponse>();
  var selectedCategories = RxList<CurioCategory>();

  void getCategory() async {
    final topicsResponse = await apiProvider.getData<TopicsResponse>(
      'category',
      (json) => TopicsResponse.fromJson(json),
    );
    topics.value = topicsResponse;
  }

  @override
  void onInit() {
    getCategory();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
