import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchViewController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Get.theme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Curios'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              children: [
                // Search Input
                Expanded(
                  flex: 7,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color:
                          Get.theme.colorScheme.inverseSurface.withOpacity(.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: controller.searchController,
                      decoration: InputDecoration(
                        hintText: 'Search near me',
                        prefixIcon: const Icon(Icons.search),
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: theme.colorScheme.inverseSurface,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Get.theme.colorScheme.inverseSurface
                            .withOpacity(.01),
                      ),
                      onChanged: controller.handleSearch,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Filter Button with Dropdown
                Container(
                  height: 50,
                  width: 100,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color:
                        Get.theme.colorScheme.inverseSurface.withOpacity(.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.filter_list, size: 20),
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: Obx(() {
                            return DropdownButton<String>(
                              value: controller.selectedFilter.value,
                              icon: const SizedBox.shrink(),
                              dropdownColor: Colors.grey[100],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Colors.black,
                                  ),
                              items: const [
                                DropdownMenuItem(
                                  value: "All",
                                  child: Text("All"),
                                ),
                                DropdownMenuItem(
                                  value: "Near Me",
                                  child: Text("Near Me"),
                                ),
                              ],
                              onChanged: (value) {
                                if (value != null) {
                                  controller.selectedFilter.value = value;
                                  controller.handleFilterChange(value);
                                }
                              },
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            // Results Section
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (controller.searchResults.isEmpty) {
                  return const Center(child: Text('No results found'));
                } else {
                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: controller.searchResults.length,
                    itemBuilder: (context, index) {
                      final item = controller.searchResults[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          title: Text(item.title),
                          subtitle: Text(item.description),
                          leading: item.imageUrl != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.network(
                                    item.imageUrl!,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : null,
                          onTap: null,
                        ),
                      );
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
