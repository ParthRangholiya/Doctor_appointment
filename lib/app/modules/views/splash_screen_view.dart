import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);

    return Scaffold(
      backgroundColor: controller.notifier.isDark
          ? const Color(0xff030303)
          : const Color(0xFF0165FC),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/splashscreenlogo.png",
              color: controller.notifier.getblucolor,
            ),
            SizedBox(width: Get.width / 70),
            Text(
              "CareConnect",
              style: TextStyle(
                color: controller.notifier.getblucolor,
                fontWeight: FontWeight.w500,
                fontSize: Get.height / 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
