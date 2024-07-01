import 'package:doctor_appointment/app/routes/app_pages.dart';
import 'package:doctor_appointment/widgets/buttons.dart';
import 'package:doctor_appointment/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../controllers/auth/otp_screen_controller.dart';

class OtpScreenView extends GetView<OtpScreenController> {
  const OtpScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);

    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width / 30,
          vertical: Get.height / 25,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height / 15,
                  width: Get.height / 15,
                  child: MyBackButtons(context),
                ),
              ],
            ),
            SizedBox(height: Get.height / 40),
            Text(
              "Verify Code",
              style: TextStyle(
                fontSize: Get.height / 30,
                color: controller.notifier.text,
              ),
            ),
            Text(
              "Please enter the code we just sent to email",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: Get.height / 65,
              ),
            ),
            Text(
              "example@gmail.com",
              style: TextStyle(
                color: const Color(0xFF0165FC),
                fontSize: Get.height / 65,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: Get.height / 20),
            OtpTextField(
              textStyle: TextStyle(
                color: controller.notifier.text,
              ),
              numberOfFields: 4,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
              ),
              fillColor: controller.notifier.getBgColor,
              cursorColor: const Color(0xff0165FC),
              showFieldAsBox: true,
              fieldHeight: Get.height / 17,
              contentPadding: EdgeInsets.zero,
              filled: true,
              fieldWidth: Get.width / 6,
              enabledBorderColor: controller.notifier.getfillborder,
              borderRadius: BorderRadius.circular(Get.width / 30),
              borderWidth: 1,
              focusedBorderColor: const Color(0xff0165FC),
            ),
            SizedBox(height: Get.height / 20),
            Text(
              "Didn't receive OTP?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: Get.height / 65,
              ),
            ),
            Text(
              "Resend code",
              style: TextStyle(
                decoration: TextDecoration.underline,
                decorationThickness: 2,
                fontSize: Get.height / 65,
                decorationColor: const Color(0xFF0165FC),
                color: const Color(0xFF0165FC),
              ),
            ),
            SizedBox(height: Get.height / 30),
            SizedBox(
              width: Get.width,
              height: Get.height / 17,
              child: CustomButton(
                text: "Verify",
                radius: BorderRadius.circular(Get.height / 20),
                onPressed: () {
                  if (controller.password == null) {
                    Get.toNamed(Routes.NEW_PASSWORD_SCREEN);
                  } else if (controller.password != null) {
                    Get.toNamed(Routes.PROFILE_INFO_ADD_SCREEN);
                  }
                },
                color: const Color(0xFF0165FC),
                textcolor: const Color(0xFFFFFFFF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
