import 'package:doctor_appointment/app/routes/app_pages.dart';
import 'package:doctor_appointment/widgets/custombutton.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../controllers/welcome_screen_controller.dart';

class WelcomeScreenView extends GetView<WelcomeScreenController> {
  const WelcomeScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);

    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset("assets/images/welcome.png"),
          Container(
            width: Get.width,
            height: Get.height / 2.5,
            padding: EdgeInsets.symmetric(horizontal: Get.width / 20),
            decoration: BoxDecoration(
              color: controller.notifier.isDark
                  ? Colors.white12
                  : const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Get.height / 25),
                topRight: Radius.circular(Get.height / 25),
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(8, 0),
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.2),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Your ',
                    style: TextStyle(
                      fontSize: Get.height / 30,
                      color: controller.notifier.text,
                      fontWeight: FontWeight.w600,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Ultimate Doctor',
                        style: TextStyle(
                          fontSize: Get.height / 30,
                          color: const Color(0xFF0165FC),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Appointment Booking App",
                  style: TextStyle(
                    fontSize: Get.height / 30,
                    color: controller.notifier.text,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: Get.height / 50),
                Text(
                  "Book appointments effortlessly and manage your health journey.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Get.height / 55,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: Get.height / 50),
                SizedBox(
                  width: Get.width,
                  height: Get.height / 18,
                  child: CustomButton(
                    text: "Let's Get Started",
                    radius: BorderRadius.circular(Get.height / 10),
                    onPressed: () {
                      Get.toNamed(Routes.ONBOARDING_SCREEN);
                    },
                    color: const Color(0xFF0165FC),
                    textcolor: const Color(0xFFFFFFFF),
                  ),
                ),
                SizedBox(height: Get.height / 30),
                RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(
                      fontSize: Get.height / 50,
                      color: controller.notifier.text,
                      fontWeight: FontWeight.w400,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign In',
                        style: TextStyle(
                          fontSize: Get.height / 50,
                          color: const Color(0xFF0165FC),
                          decorationThickness: 2,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(Routes.SIGN_IN);
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
