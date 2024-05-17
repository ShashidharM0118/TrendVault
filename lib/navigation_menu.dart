import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/screens/home/home.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode? TColors.black: Colors.white,
          indicatorColor: darkMode? TColors.white.withOpacity(0.1): TColors.black.withOpacity(0.1),
          destinations: [
            const NavigationDestination(
                icon: Icon(Iconsax.home), label: 'Home'),
            const NavigationDestination(
                icon: Icon(Iconsax.shop), label: 'Shop'),
            const NavigationDestination(
                icon: Icon(Iconsax.heart), label: 'Heart'),
            const NavigationDestination(
                icon: Icon(Iconsax.user), label: 'User'),
          ],
        ),
      ),
      body: Obx(()=> controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs; //it retains selected index;

  final screens = [
    const HomeScreen(),
    Container(),
    Container(
      color: Colors.blue,
    ),
    Container()
  ];
}
