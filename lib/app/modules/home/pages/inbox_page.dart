import 'package:curiocity/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InboxPage extends StatelessWidget {
  final HomeController controller;

  const InboxPage({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
              indicatorColor: const Color(0xFFFBB80E),
              labelColor: const Color(0xFFFBB80E),
              unselectedLabelColor:
                  Get.theme.colorScheme.inverseSurface.withOpacity(.7),
              labelStyle: const TextStyle(fontSize: 12),
              unselectedLabelStyle: const TextStyle(fontSize: 12),
              tabs: const [
                Tab(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.message,
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Messages',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Tab(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.group,
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Friends List',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Tab(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.forum,
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Communities',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: const [
                  MessagesScreen(),
                  FriendsScreen(),
                  CommunitiesScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Messages',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Friends',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class CommunitiesScreen extends StatelessWidget {
  const CommunitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Communities',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
