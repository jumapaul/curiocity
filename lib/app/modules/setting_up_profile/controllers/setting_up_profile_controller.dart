import 'dart:convert';

import 'package:curiocity/app/data/model/update_user_profile_request.dart';
import 'package:curiocity/app/data/model/update_user_response.dart';
import 'package:curiocity/app/data/model/user_model.dart';
import 'package:curiocity/app/data/providers/api_provider.dart';
import 'package:curiocity/app/data/providers/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SettingUpProfileController extends GetxController {
  TextEditingController usernameEditController = TextEditingController();
  TextEditingController mobileNumberEditController = TextEditingController();
  TextEditingController personalBioEditController = TextEditingController();
  final ApiProvider apiProvider = Get.find<ApiProvider>();
  final user = Rxn<UserModel>();

  void updateUserProfile(UpdateUserProfileRequest request) async {
    var response = await apiProvider.postData<UpdateUserResponse>(
      "users/${user.value?.data?.user?.email}",
      jsonEncode(request),
      (json) => UpdateUserResponse.fromJson(json),
    );
    print(response.toJson());
  }

  void getUser() async {
    user.value = await SharedPreferenceHelper.getUser();
  }

  @override
  void onInit() {
    getUser();
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
