import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenpulse/pages/analytics.dart';
import 'package:greenpulse/pages/home.dart';
import 'package:greenpulse/pages/profile.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 60,
          elevation: 40,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(CupertinoIcons.graph_circle),
              label: 'Analytics',
            ),
            NavigationDestination(
              icon: Icon(CupertinoIcons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
   const Homepage(),
   const Analytics(),
   const Profile()
  ];
}