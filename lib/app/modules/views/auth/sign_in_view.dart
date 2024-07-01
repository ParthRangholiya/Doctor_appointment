import 'package:doctor_appointment/app/routes/app_pages.dart';
import 'package:doctor_appointment/widgets/custombutton.dart';
import 'package:doctor_appointment/widgets/my_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../controllers/auth/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Get.width / 25,
              vertical: Get.height / 35,
            ),
            child: Column(
              children: [
                SizedBox(height: Get.height / 12),
                Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: Get.height / 30,
                    color: controller.notifier.text,
                  ),
                ),
                SizedBox(height: Get.height / 70),
                Text(
                  "Hi! Welcome back, you've been missed",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: Get.height / 65,
                  ),
                ),
                SizedBox(height: Get.height / 15),
                MyTextField(
                  hintText: "example@gmail.com",
                  titletext: "Email",
                  controller: controller.emailcontroller,
                  type: TextInputType.emailAddress,
                ),
                SizedBox(height: Get.height / 40),
                Obx(
                  () => MyTextField(
                    titletext: "Password",
                    controller: controller.passwordcontroller,
                    obscureText: controller.password,
                    type: TextInputType.visiblePassword,
                    hintText: "*************",
                    suffixIcon: GestureDetector(
                      onTap: () {
                        controller.password = !controller.password;
                      },
                      child: Icon(
                        controller.password == false
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
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
                            "email": controller.emailcontroller.text
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
                SizedBox(height: Get.height / 30),
                SizedBox(
                  width: Get.width,
                  height: Get.height / 17,
                  child: CustomButton(
                    text: "Sign In",
                    radius: BorderRadius.circular(Get.height / 20),
                    onPressed: () {
                      Get.offAllNamed(Routes.BOTTOM_NAVIGATION_BAR);
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
                        "Or sign in with",
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
                    itemCount: controller.signinmethodelogo.length,
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
                          controller.signinmethodelogo[index],
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
                    text: "Don't have an account? ",
                    style: TextStyle(
                      fontSize: Get.height / 63,
                      color: controller.notifier.text,
                      fontWeight: FontWeight.w400,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign Up',
                        style: const TextStyle(
                          color: Color(0xFF0165FC),
                          decorationThickness: 2,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(Routes.CREATE_ACCOUNT);
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
