import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchViewController extends GetxController {
  var searchController = TextEditingController();
  var activeFilters = "All".obs;
  var isLoading = false.obs;
  var searchResults = RxList();

  var selectedFilter = "All".obs; // Default filter

  void handleFilterChange(String filter) {
    // TODO: Implement filter change logic
    if (filter == "Near Me") {
      // Fetch nearby results
    } else {
      // Fetch all results
    }
  }

  @override
  void onInit() {
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

  void handleSearch(String value){

  }
}
