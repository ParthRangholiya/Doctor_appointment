import 'package:doctor_appointment/app/routes/app_pages.dart';
import 'package:doctor_appointment/widgets/custombutton.dart';
import 'package:doctor_appointment/widgets/my_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../controllers/auth/create_account_controller.dart';

class CreateAccountView extends GetView<CreateAccountController> {
  const CreateAccountView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);

    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Get.width / 30,
              vertical: Get.height / 35,
            ),
            child: Column(
              children: [
                SizedBox(height: Get.height / 15),
                Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: Get.height / 30,
                    color: controller.notifier.text,
                  ),
                ),
                SizedBox(height: Get.height / 90),
                SizedBox(
                  width: Get.width / 1.6,
                  child: Text(
                    "Fill your information below or register with your social account.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: Get.height / 65,
                    ),
                  ),
                ),
                SizedBox(height: Get.height / 30),
                MyTextField(
                  type: TextInputType.name,
                  hintText: "Name",
                  titletext: "Name",
                  controller: controller.namecontroller,
                ),
                SizedBox(height: Get.height / 50),
                MyTextField(
                  hintText: "example@gmail.com",
                  titletext: "Email",
                  type: TextInputType.emailAddress,
                  controller: controller.emailcontroller,
                ),
                SizedBox(height: Get.height / 50),
                Obx(
                  () => MyTextField(
                    titletext: "Password",
                    obscureText: controller.createaccountpassword,
                    type: TextInputType.visiblePassword,
                    controller: controller.passwordcontroller,
                    hintText: "*************",
                    suffixIcon: GestureDetector(
                      onTap: () {
                        controller.createaccountpassword =
                            !controller.createaccountpassword;
                      },
                      child: Icon(
                        controller.createaccountpassword == false
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.isChecked,
                        activeColor: const Color(0xFF0165FC),
                        onChanged: (value) {
                          controller.isChecked = value!;
                        },
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Agree with ",
                        style: TextStyle(
                          fontSize: Get.height / 60,
                          color: controller.notifier.text,
                          fontWeight: FontWeight.w400,
                        ),
                        children: const <TextSpan>[
                          TextSpan(
                            text: "Terms & Condition",
                            style: TextStyle(
                              color: Color(0xFF0165FC),
                              decorationThickness: 2,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Get.height / 40),
                SizedBox(
                  width: Get.width,
                  height: Get.height / 17,
                  child: CustomButton(
                    text: "Sign Up",
                    radius: BorderRadius.circular(Get.height / 20),
                    onPressed: () {
                      Get.toNamed(Routes.OTP_SCREEN, arguments: {
                        "email": controller.emailcontroller.text,
                        "password": controller.passwordcontroller.text,
                      });
                    },
                    color: const Color(0xFF0165FC),
                    textcolor: const Color(0xFFFFFFFF),
                  ),
                ),
                SizedBox(height: Get.height / 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width / 40),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Get.width / 50),
                          child: const Divider(),
                        ),
                      ),
                      Text(
                        "Or sign Up with",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: Get.height / 65,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Get.width / 50),
                          child: const Divider(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Get.height / 20),
                SizedBox(
                  height: Get.height / 13,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.signupmethodelogo.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(Get.height / 50),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          controller.signupmethodelogo[index],
                          color: controller.notifier.isDark
                              ? index == 0
                                  ? controller.notifier.text
                                  : index == 2
                                      ? const Color(0xFF0165FC)
                                      : null
                              : index == 2
                                  ? const Color(0xFF0165FC)
                                  : null,
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(width: Get.width / 30);
                    },
                  ),
                ),
                SizedBox(height: Get.height / 20),
                RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(
                      fontSize: Get.height / 63,
                      color: controller.notifier.text,
                      fontWeight: FontWeight.w400,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign In',
                        style: const TextStyle(
                          color: Color(0xFF0165FC),
                          decorationThickness: 2,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.back();
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
