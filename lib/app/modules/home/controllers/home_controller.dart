import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:curiocity/app/common/utils/show_message.dart';
import 'package:curiocity/app/data/model/bookmark_response.dart';
import 'package:curiocity/app/data/model/comments_response.dart';
import 'package:curiocity/app/data/model/posts_response.dart';
import 'package:curiocity/app/data/model/topics_response.dart';
import 'package:curiocity/app/data/model/upvote_response.dart';
import 'package:curiocity/app/data/model/user_model.dart' as u;
import 'package:curiocity/app/data/model/user_profile_response.dart';
import 'package:curiocity/app/data/providers/api_provider.dart';
import 'package:curiocity/app/data/providers/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_client_sse/constants/sse_request_type_enum.dart';
import 'package:flutter_client_sse/flutter_client_sse.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  var image = Rxn<File>();
  final ImagePicker picker = ImagePicker();
  final ApiProvider apiProvider = Get.find<ApiProvider>();
  var topics = Rxn<TopicsResponse>();
  var selectedCategories = RxList<CurioCategory>();
  var isLoading = false.obs;
  final user = Rxn<u.User>();
  final userProfile = Rxn<UserProfileResponse>();
  final ScrollController scrollController = ScrollController();
  var posts = Rxn<PostsResponse>();
  var comments = Rxn<CommentsResponse>();

  @override
  void onInit() {
    setupScrollController();
    super.onInit();
  }

  @override
  void onReady() {
    getCategory();
    getUser();
    getUserProfile();
    getPost();
    super.onReady();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void getUserProfile() async {
    var response = await apiProvider.getData<UserProfileResponse>(
      "users/me",
      (data) => UserProfileResponse.fromJson(data),
    );
    userProfile.value = response;
  }

  void getUser() async {
    user.value = await SharedPreferenceHelper.getUser();
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

  void setupScrollController() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent * 0.8) {
        getPost();
      }
    });
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

  void getPost() {
    SSEClient.subscribeToSSE(
        method: SSERequestType.GET,
        url:
            'https://dev-api.curiocitie.com/api/v1/posts/stream?page=1&limit=30',
        header: {
          "Accept": "text/event-stream",
          "Cache-Control": "no-cache",
        }).listen(
      (event) {
        try {
          if (event.data != null || event.data?.isNotEmpty == true) {
            print('Id: ' + event.id!);
            print('Event: ' + event.event!);
            print('Data: ' + event.data!);
            posts.value = PostsResponse.fromJson(jsonDecode(event.data ?? ''));
          }
        } catch (e) {}
      },
    );
  }

  void getComments(String id) {
    SSEClient.subscribeToSSE(
        method: SSERequestType.GET,
        url: 'https://dev-api.curiocitie.com/api/v1/posts/comments/$id',
        header: {
          "Accept": "text/event-stream",
          "Cache-Control": "no-cache",
        }).listen(
      (event) {
        try {
          print("Comments=========>${event.data}");
          if (event.data != null || event.data?.isNotEmpty == true) {
            comments.value =
                CommentsResponse.fromJson(jsonDecode(event.data ?? ''));
          }
        } catch (e) {}
      },
    );
  }

  void bookMark(String postId) async {
    var payload = {"postId": postId};
    var response = await apiProvider.postData<dynamic>(
      "posts/bookmarks",
      jsonEncode(payload),
      (data) => BookmarkResponse.fromJson(data),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      showMessage("Post bookmarked", MessageType.Success);
    } else {
      showMessage(jsonDecode(response.body)["message"], MessageType.Success);
    }
  }

  void upVote(String postId) async {
    var payload = {"postId": postId, "isUpVote": true};
    var response = await apiProvider.postData<dynamic>(
      "posts/vote",
      jsonEncode(payload),
      (data) => UpvoteResponse.fromJson(data),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      showMessage(response.message, MessageType.Success);
    } else {
      showMessage(jsonDecode(response.body)["message"], MessageType.Success);
    }
  }
}
