import 'package:doctor_appointment/app/routes/app_pages.dart';
import 'package:doctor_appointment/widgets/buttons.dart';
import 'package:doctor_appointment/widgets/bottombar_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../controllers/home/location_done_controller.dart';

class LocationDoneView extends GetView<LocationDoneController> {
  const LocationDoneView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);

    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      appBar: AppBar(
        backgroundColor: controller.notifier.getBgColor,
        leading: MyBackButtons(context),
      ),
      bottomNavigationBar: MyBottomBar(
        context,
        "OK",
        () {
          Get.offAllNamed(Routes.BOTTOM_NAVIGATION_BAR);
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width / 25,
          vertical: Get.height / 30,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/check-circle.png",
                color: const Color(0xFF0165FC),
                height: Get.height / 7,
              ),
              SizedBox(height: Get.height / 20),
              Text(
                "You Have Arrived!",
                style: TextStyle(
                  color: controller.notifier.text,
                  fontSize: Get.height / 35,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: Get.height / 80),
              Text(
                "You have arrived at the Hospital location",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: Get.height / 60,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
