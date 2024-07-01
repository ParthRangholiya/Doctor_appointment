import 'package:doctor_appointment/app/routes/app_pages.dart';
import 'package:doctor_appointment/widgets/custombutton.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../controllers/location/loca_allow_permi_screen_controller.dart';

class LocaAllowPermiScreenView extends GetView<LocaAllowPermiScreenController> {
  const LocaAllowPermiScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);

    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Get.width / 30,
            vertical: Get.height / 35,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(Get.height / 15),
                decoration: BoxDecoration(
                  color: controller.notifier.getbluelightcolor,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  "assets/images/location-pin.png",
                  height: Get.height / 15,
                  color: const Color(0xFF0165FC),
                ),
              ),
              SizedBox(height: Get.height / 30),
              Text(
                "What is Your Location?",
                style: TextStyle(
                  fontSize: Get.height / 32,
                  fontWeight: FontWeight.w500,
                  color: controller.notifier.text,
                ),
              ),
              SizedBox(height: Get.height / 90),
              SizedBox(
                width: Get.width / 1.2,
                child: Text(
                  "We need to know your location in order to suggest nearby services.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: Get.height / 65,
                  ),
                ),
              ),
              SizedBox(height: Get.height / 30),
              SizedBox(
                width: Get.width,
                height: Get.height / 17,
                child: CustomButton(
                  text: "Allow Loction Access",
                  radius: BorderRadius.circular(Get.height / 10),
                  onPressed: () {},
                  color: const Color(0xFF0165FC),
                  textcolor: const Color(0xFFFFFFFF),
                ),
              ),
              SizedBox(height: Get.height / 30),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.ADD_MANU_LOCA_SCREEN);
                },
                child: Text(
                  "Enter Location Manually",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Get.height / 50,
                    color: const Color(0xFF0165FC),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
