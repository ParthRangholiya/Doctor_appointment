import 'dart:io';

import 'package:doctor_appointment/widgets/buttons.dart';
import 'package:doctor_appointment/widgets/custombutton.dart';
import 'package:doctor_appointment/widgets/dropdownfield_widget.dart';
import 'package:doctor_appointment/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../controllers/home/add_card_controller.dart';
import '../../controllers/profile/your_profile_controller.dart';

class YourProfileView extends GetView<YourProfileController> {
  const YourProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.profileinfocontroller.notifier =
        Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: controller.profileinfocontroller.notifier.getBgColor,
      appBar: AppBar(
        backgroundColor: controller.profileinfocontroller.notifier.getBgColor,
        title: Text(
          'Your Profile',
          style: TextStyle(
            color: controller.profileinfocontroller.notifier.text,
            fontSize: Get.height / 40,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: MyBackButtons(context),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Get.width / 30,
            vertical: Get.height / 40,
          ),
          child: Center(
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Obx(
                      () => SizedBox(
                        child:
                            controller.profileinfocontroller.selectImage == null
                                ? Container(
                                    padding: EdgeInsets.all(Get.height / 30),
                                    height: Get.height / 5.5,
                                    decoration: BoxDecoration(
                                      color: controller.profileinfocontroller
                                              .notifier.isDark
                                          ? const Color(0xff161616)
                                          : Colors.black12,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      "assets/images/user.png",
                                      color: Colors.grey,
                                      height: Get.height / 10,
                                    ),
                                  )
                                : Container(
                                    height: Get.height / 6.5,
                                    width: Get.height / 6.5,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: ClipOval(
                                      child: Image.file(
                                        File(
                                          controller.profileinfocontroller
                                              .selectImage!.path,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                      ),
                    ),
                    Positioned(
                      bottom: Get.height / 60,
                      right: Get.width / 70,
                      child: GestureDetector(
                        onTap: () {
                          controller.profileinfocontroller
                              .showimagepicker(context);
                        },
                        child: Container(
                          height: Get.height / 27,
                          decoration: BoxDecoration(
                            color: controller
                                .profileinfocontroller.notifier.getBgColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/images/editicon.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Get.height / 30),
                MyTextField(
                  titletext: "Name",
                  type: TextInputType.name,
                  hintText: "name",
                  controller: controller.namecontroller,
                ),
                SizedBox(height: Get.height / 50),
                MyTextField(
                  titletext: "Phone Number",
                  type: TextInputType.number,
                  hintText: "Phone",
                  controller: controller.phonecontroller,
                ),
                SizedBox(height: Get.height / 50),
                MyTextField(
                  titletext: "Email",
                  type: TextInputType.emailAddress,
                  hintText: "example@gmail.com",
                  controller: controller.emailcontroller,
                ),
                SizedBox(height: Get.height / 50),
                MyTextField(
                  titletext: "DOB",
                  type: TextInputType.datetime,
                  hintText: "DD/MM/YY",
                  controller: controller.dobcontroller,
                  inputFormatter: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(6),
                    ValidMonthInputFormatter(),
                  ],
                ),
                SizedBox(height: Get.height / 50),
                MyDropdownButtonField(
                  titletext: "Gender",
                  select: controller.selectgender,
                  items: const ["Male", "Female"],
                  onChanged: (value) {
                    controller.selectgender = value;
                  },
                ),
                SizedBox(height: Get.height / 25),
                SizedBox(
                  width: Get.width,
                  height: Get.height / 17,
                  child: CustomButton(
                    text: "Update Profile",
                    onPressed: () {
                      Get.back();
                    },
                    color: const Color(0xFF0165FC),
                    textcolor: Colors.white,
                    radius: BorderRadius.circular(Get.height / 20),
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
