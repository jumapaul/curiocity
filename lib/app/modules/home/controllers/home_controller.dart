import 'dart:async';
import 'dart:io';

import 'package:curiocity/app/data/model/topics_response.dart';
import 'package:curiocity/app/data/model/user_model.dart';
import 'package:curiocity/app/data/model/user_profile_response.dart';
import 'package:curiocity/app/data/providers/api_provider.dart';
import 'package:curiocity/app/data/providers/shared_preferences.dart';
import 'package:flutter/material.dart';
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
  final user = Rxn<User>();
  final userProfile = Rxn<UserProfileResponse>();
  final ScrollController scrollController = ScrollController();

  // For managing posts and pagination
  var posts = RxList<Map<String, dynamic>>(); // Store parsed posts
  bool _isLoadingPosts = false;
  int _currentPage = 1;
  final int _limit = 10;
  bool _hasMorePosts = true;

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
    fetchPosts();
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

  Future<void> fetchPosts() async {
    if (_isLoadingPosts || !_hasMorePosts) return;

    _isLoadingPosts = true;

    try {
      final response = await apiProvider.getData<Map<String, dynamic>>(
        'posts/stream?page=$_currentPage&limit=$_limit',
        (json) => json,
      );
      print(response);

      if (response['success'] == true) {
        final List<dynamic> newPosts = response['data'];
        if (newPosts.isNotEmpty) {
          posts.addAll(newPosts.cast<Map<String, dynamic>>());
          _currentPage++;
        } else {
          _hasMorePosts = false;
        }
      } else {
        Get.snackbar('Error', response['message'] ?? 'Failed to fetch posts');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred while fetching posts: $e');
    } finally {
      _isLoadingPosts = false;
    }
  }

  void setupScrollController() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent * 0.8) {
        fetchPosts();
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
}
