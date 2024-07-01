import 'package:doctor_appointment/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controllers/onboarding_screen_controller.dart';

class OnboardingScreenView extends GetView<OnboardingScreenController> {
  const OnboardingScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);

    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Obx(
                  () => SizedBox(
                    child: controller.activePage != 2
                        ? TextButton(
                            onPressed: () => Get.toNamed(Routes.SIGN_IN),
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                color: const Color(0xff0165FC),
                                fontWeight: FontWeight.w400,
                                fontSize: Get.height / 35,
                              ),
                            ),
                          )
                        : Container(height: Get.height / 17),
                  ),
                ),
              ],
            ),
            Obx(
              () => SizedBox(
                height: Get.height / 2,
                width: Get.width,
                child: PageView.builder(
                  controller: controller.pageController,
                  itemCount: controller.image.length,
                  onPageChanged: (value) {
                    controller.onPageChnage(value);
                  },
                  itemBuilder: (context, index) {
                    return Image.asset(
                      controller.image[index],
                    );
                  },
                ),
              ),
            ),
            Obx(
              () => SizedBox(
                child: controller.activePage == 0
                    ? Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width / 50),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Discover ",
                            style: TextStyle(
                              fontSize: Get.height / 30,
                              color: controller.notifier.text,
                              fontWeight: FontWeight.w600,
                            ),
                            children: const <TextSpan>[
                              TextSpan(
                                text: 'Experienced Docotrs',
                                style: TextStyle(
                                  color: Color(0xFF0165FC),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : controller.activePage == 1
                        ? RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: "Effortless ",
                              style: TextStyle(
                                fontSize: Get.height / 30,
                                color: controller.notifier.text,
                                fontWeight: FontWeight.w600,
                              ),
                              children: const <TextSpan>[
                                TextSpan(
                                  text: 'Appointment ',
                                  style: TextStyle(
                                    color: Color(0xFF0165FC),
                                  ),
                                ),
                                TextSpan(
                                  text: 'Booking',
                                  style: TextStyle(),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(
                            width: Get.width / 1.5,
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "Learn About ",
                                style: TextStyle(
                                  fontSize: Get.height / 30,
                                  color: const Color(0xFF0165FC),
                                  fontWeight: FontWeight.w600,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Your ',
                                    style: TextStyle(
                                      color: controller.notifier.text,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: 'Docotrs',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
              ),
            ),
            SizedBox(height: Get.height / 30),
            SizedBox(
              width: Get.width / 1.3,
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: Get.height / 50,
                ),
              ),
            ),
            SizedBox(height: Get.height / 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => SizedBox(
                    child: controller.activePage != 0
                        ? GestureDetector(
                            onTap: controller.controllervaluedecrement,
                            child: Container(
                              height: Get.height / 15,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFF0165FC),
                                  width: 2,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Color(0xFF0165FC),
                              ),
                            ),
                          )
                        : Container(width: Get.width / 8.5),
                  ),
                ),
                SmoothPageIndicator(
                  controller: controller.pageController,
                  count: 3,
                  effect: ScrollingDotsEffect(
                    dotColor: controller.notifier.getbluelightcolor,
                    activeDotColor: const Color(0xFF0165FC),
                  ),
                ),
                GestureDetector(
                  onTap: controller.controllervalueincrement,
                  child: Container(
                    height: Get.height / 15,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0165FC),
                      border: Border.all(
                        color: const Color(0xFF0165FC),
                        width: 2,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
