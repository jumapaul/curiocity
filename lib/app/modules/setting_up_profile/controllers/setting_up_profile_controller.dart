import 'dart:convert';
import 'dart:io';

import 'package:curiocity/app/common/utils/show_message.dart';
import 'package:curiocity/app/data/model/update_user_profile_request.dart';
import 'package:curiocity/app/data/model/user_model.dart';
import 'package:curiocity/app/data/providers/api_provider.dart';
import 'package:curiocity/app/data/providers/shared_preferences.dart';
import 'package:curiocity/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class SettingUpProfileController extends GetxController {
  TextEditingController usernameEditController = TextEditingController();
  TextEditingController dateOfBirthEditController = TextEditingController();
  TextEditingController personalBioEditController = TextEditingController();
  TextEditingController phoneEditController = TextEditingController();
  final ApiProvider apiProvider = Get.find<ApiProvider>();
  final user = Rxn<User>();
  var image = Rxn<File>();
  final ImagePicker picker = ImagePicker();
  var isLoading = false.obs;
  var imageUrl = "".obs;
  var arguments = Rxn<Map<String, dynamic>>();

  void updateUserProfile(UpdateUserProfileRequest request) async {
    isLoading.value = true;
    var payload = {
      "email": request.email,
      "name": request.name,
      "dateOfBirth": request.dateOfBirth,
      "location": null,
      "interests": request.interests,
      "subInterests": request.subInterests,
      "push_notification": request.pushNotification,
      "email_notification": request.emailNotification,
      "personalized_content": request.personalizedContent,
      "bio": request.bio,
      "gender": null,
      "profile_image": request.profileImage,
      "phone": request.phone,
      "address": null,
      "city": null,
      "country": null
    };
    var token = await SharedPreferenceHelper.getToken() ?? '';
    print(token);
    var response = await http.patch(
        Uri.parse("https://dev-api.curiocitie.com/api/v1/users"),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json"
        },
        body: jsonEncode(payload));
    if (response.statusCode == 200) {
      showMessage("User profile updated successfully", MessageType.Success);
      Get.offAndToNamed(Routes.HOME);
    } else {
      showMessage(
          "An error occurred while updating user profile", MessageType.Error);
    }
    isLoading.value = false;
  }

  void getUser() async {
    user.value = await SharedPreferenceHelper.getUser();
    usernameEditController.text = user.value?.name ?? '';
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
        await uploadFile(image.value?.path ?? '');
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
        await uploadFile(image.value?.path ?? '');
      }
    } catch (e) {
      print('Error taking photo: $e');
    }
  }

  @override
  void onInit() {
    getUser();
    getOptions();
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

  getOptions() async {
    var result = await SharedPreferenceHelper.getString("category");
    print(result);
  }

  Future<void> uploadFile(String path) async {
    try {
      // Prepare the request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://dev-api.curiocitie.com/api/v1/media/upload'),
      );

      // Add the file to the request
      request.files.add(
        await http.MultipartFile.fromPath('image', path),
      );

      // Send the request
      http.StreamedResponse response = await request.send();

      // Check the status code
      if (response.statusCode == 201) {
        // Parse the response body
        var responseData = await response.stream.bytesToString();
        var data = jsonDecode(responseData);

        // Check for the `url` key in `data`
        if (data != null &&
            data['data'] != null &&
            data['data']['url'] != null) {
          imageUrl.value = data['data']['url'];
          print('Uploaded Successfully: $imageUrl');
          showMessage("Upload successfully", MessageType.Success);
        } else {
          throw Exception('Invalid response format: Missing URL');
        }
      } else {
        // Handle non-201 status codes
        var errorMessage =
            'Failed to upload: ${response.reasonPhrase} (Status Code: ${response.statusCode})';
        print(errorMessage);
        showMessage("Error occurred while uploading image", MessageType.Error);
      }
    } catch (e) {
      // Catch and log errors
      print('Error: $e');
      showMessage("Error occurred while uploading image", MessageType.Error);
    }
  }
}
