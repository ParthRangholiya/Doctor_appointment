import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/buttons.dart';
import '../../../../widgets/custombutton.dart';
import '../../../routes/app_pages.dart';
import '../../controllers/chat/consultation_screen_controller.dart';

class ConsultationScreenView extends GetView<ConsultationScreenController> {
  const ConsultationScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      appBar: AppBar(
        backgroundColor: controller.notifier.getBgColor,
        leading: MyBackButtons(context),
      ),
      bottomNavigationBar: Container(
        height: Get.height / 10,
        padding: EdgeInsets.symmetric(
          horizontal: Get.width / 20,
          vertical: Get.height / 55,
        ),
        decoration: BoxDecoration(
          color: controller.notifier.getBgColor,
          border: Border(
            top: BorderSide(
              color: controller.notifier.getfillborder,
            ),
            left: BorderSide(
              color: controller.notifier.getfillborder,
            ),
            right: BorderSide(
              color: controller.notifier.getfillborder,
            ),
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Get.width / 25),
            topRight: Radius.circular(Get.width / 25),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: Get.width / 2.3,
              height: Get.height / 17,
              child: CustomButton(
                text: "Back to Home",
                onPressed: () => Get.offAllNamed(Routes.BOTTOM_NAVIGATION_BAR),
                color: const Color(0xFFC8DCFA),
                textcolor: const Color(0xff0165FC),
                radius: BorderRadius.circular(Get.width / 10),
              ),
            ),
            SizedBox(
              width: Get.width / 2.3,
              height: Get.height / 17,
              child: CustomButton(
                text: "Add Review",
                onPressed: () => Get.toNamed(Routes.HOSPITAL_REVIEW_SCREEN),
                color: const Color(0xFF0165FC),
                textcolor: Colors.white,
                radius: BorderRadius.circular(Get.width / 10),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width / 25,
          vertical: Get.height / 30,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: Get.height / 6,
                height: Get.height / 6,
                decoration: const BoxDecoration(
                  color: Color(0xFF0165FC),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/images/clock.svg",
                    color: Colors.white,
                    height: Get.height / 20,
                  ),
                ),
              ),
              SizedBox(height: Get.height / 40),
              Text(
                "The Consultation Session has ended",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: controller.notifier.text,
                  fontSize: Get.height / 35,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: Get.height / 80),
              Text(
                "Recording have been saved in activity",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: Get.height / 60,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Get.height / 50),
                child: Divider(color: controller.notifier.getfillborder),
              ),
              Stack(
                children: [
                  Container(
                    height: Get.height / 8,
                    width: Get.height / 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: controller.notifier.getimagBgColor,
                      image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/doctor.jpg",
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: Get.height / 80,
                    child: SvgPicture.asset(
                      "assets/images/shieldtrustIcon.svg",
                      height: Get.height / 40,
                      color: const Color(0xff0165FC),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height / 50),
              Text(
                "Dr. Jonny Wilson",
                style: TextStyle(
                  fontSize: Get.height / 45,
                  fontWeight: FontWeight.w500,
                  color: controller.notifier.text,
                ),
              ),
              Text(
                "Dentist",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: Get.height / 55,
                ),
              ),
              SizedBox(height: Get.height / 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/location-pin.png",
                    color: const Color(0xff0165FC),
                    height: Get.height / 55,
                  ),
                  Text(
                    " New York, United Stats ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: Get.height / 55,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
