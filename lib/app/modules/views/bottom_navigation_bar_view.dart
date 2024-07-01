import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../controllers/bottom_navigation_bar_controller.dart';

class BottomNavigationBarView extends GetView<BottomNavigationBarController> {
  const BottomNavigationBarView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);

    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      body: Obx(
        () => Center(
          child: controller.bottomtab[controller.selectIndex],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: controller.notifier.getBgColor,
          currentIndex: controller.selectIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: const Color(0xFF0165FC),
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            controller.selectIndex = value;
          },
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/home.png",
                height: Get.height / 50,
                color: controller.selectIndex == 0
                    ? const Color(0xFF0165FC)
                    : Colors.grey,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/location-pin.png",
                height: Get.height / 50,
                color: controller.selectIndex == 1
                    ? const Color(0xFF0165FC)
                    : Colors.grey,
              ),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/calendar.png",
                height: Get.height / 50,
                color: controller.selectIndex == 2
                    ? const Color(0xFF0165FC)
                    : Colors.grey,
              ),
              label: 'Bookings',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/chatIcon.png",
                height: Get.height / 50,
                color: controller.selectIndex == 3
                    ? const Color(0xFF0165FC)
                    : Colors.grey,
              ),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/user.png",
                height: Get.height / 50,
                color: controller.selectIndex == 4
                    ? const Color(0xFF0165FC)
                    : Colors.grey,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
