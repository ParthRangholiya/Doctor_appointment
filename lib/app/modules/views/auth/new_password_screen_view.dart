import 'package:doctor_appointment/app/routes/app_pages.dart';
import 'package:doctor_appointment/widgets/buttons.dart';
import 'package:doctor_appointment/widgets/custombutton.dart';
import 'package:doctor_appointment/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../controllers/auth/new_password_screen_controller.dart';

class NewPasswordScreenView extends GetView<NewPasswordScreenController> {
  const NewPasswordScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width / 30,
          vertical: Get.height / 35,
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
              "New Password",
              style: TextStyle(
                fontSize: Get.height / 30,
                color: controller.notifier.text,
              ),
            ),
            SizedBox(
              width:Get. width / 1.6,
              child: Text(
                "Your new password must be different from previously used password",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: Get.height / 65,
                ),
              ),
            ),
            SizedBox(height: Get.height / 20),
            Obx(
              () => MyTextField(
                titletext: "Password",
                obscureText: controller.newpassword,
                type: TextInputType.visiblePassword,
                hintText: "*************",
                controller: controller.passwordcontroller,
                suffixIcon: GestureDetector(
                  onTap: () {
                    controller.newpassword = !controller.newpassword;
                  },
                  child: Icon(
                    controller.newpassword == false
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                ),
              ),
            ),
            SizedBox(height: Get.height / 50),
            Obx(
              () => MyTextField(
                titletext: "Confirm Password",
                obscureText: controller.confirmpassword,
                type: TextInputType.visiblePassword,
                hintText: "*************",
                controller: controller.confirmPasswordcontroller,
                suffixIcon: GestureDetector(
                  onTap: () {
                    controller.confirmpassword = !controller.confirmpassword;
                  },
                  child: Icon(
                    controller.confirmpassword == false
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                ),
              ),
            ),
            SizedBox(height: Get.height / 20),
            SizedBox(
              width: Get.width,
              height: Get.height / 17,
              child: CustomButton(
                text: "Create New Password",
                radius: BorderRadius.circular(Get.height / 20),
                onPressed: () => Get.toNamed(Routes.SIGN_IN),
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
