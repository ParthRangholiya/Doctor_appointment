import 'package:doctor_appointment/widgets/bottombar_widget.dart';
import 'package:doctor_appointment/widgets/buttons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/my_text_field.dart';
import '../../../routes/app_pages.dart';
import '../../controllers/profile/password_manager_controller.dart';

class PasswordManagerView extends GetView<PasswordManagerController> {
  const PasswordManagerView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      appBar: AppBar(
        backgroundColor: controller.notifier.getBgColor,
        title: Text(
          'Password Manager',
          style: TextStyle(
            color: controller.notifier.text,
            fontSize: Get.height / 40,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: MyBackButtons(context),
      ),
      bottomNavigationBar: MyBottomBar(
        context,
        "Chnage Password",
        () {
          Get.back();
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width / 25,
          vertical: Get.height / 40,
        ),
        child: Obx(
          () => Column(
            children: [
              MyTextField(
                titletext: "Current Password",
                controller: controller.currentpasswordController,
                obscureText: controller.currentpassword,
                type: TextInputType.visiblePassword,
                hintText: "*************",
                suffixIcon: GestureDetector(
                  onTap: () {
                    controller.currentpassword = !controller.currentpassword;
                  },
                  child: Icon(
                    controller.currentpassword == false
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: Get.width / 40),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.OTP_SCREEN, arguments: {
                          "email": controller.currentpasswordController.text
                        });
                      },
                      child: Text(
                        "Forgot Password?",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: Get.height / 65,
                          color: const Color(0xFF0165FC),
                          decorationThickness: 2,
                          decoration: TextDecoration.underline,
                          decorationColor: const Color(0xFF0165FC),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height / 50),
              MyTextField(
                titletext: "New Password",
                controller: controller.newpasswordController,
                obscureText: controller.newpassword,
                type: TextInputType.visiblePassword,
                hintText: "*************",
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
              SizedBox(height: Get.height / 50),
              MyTextField(
                titletext: "Confirm New Password",
                controller: controller.confirmnewpasswordController,
                obscureText: controller.confirmnewpassword,
                type: TextInputType.visiblePassword,
                hintText: "*************",
                suffixIcon: GestureDetector(
                  onTap: () {
                    controller.confirmnewpassword =
                        !controller.confirmnewpassword;
                  },
                  child: Icon(
                    controller.confirmnewpassword == false
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
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
