import 'dart:io';

import 'package:doctor_appointment/app/routes/app_pages.dart';
import 'package:doctor_appointment/widgets/buttons.dart';
import 'package:doctor_appointment/widgets/custombutton.dart';
import 'package:doctor_appointment/widgets/dropdownfield_widget.dart';
import 'package:doctor_appointment/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

import '../../controllers/auth/profile_info_add_screen_controller.dart';

class ProfileInfoAddScreenView extends GetView<ProfileInfoAddScreenController> {
  const ProfileInfoAddScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      body: SingleChildScrollView(
        child: Padding(
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
                "Complete Your Profile",
                style: TextStyle(
                  fontSize: Get.height / 30,
                  color: controller.notifier.text,
                ),
              ),
              SizedBox(
                width: Get.width / 1.4,
                child: Text(
                  "Don't worry, only you can see your personal data. No one else will be able to see it.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Get.height / 65,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: Get.height / 20),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Obx(
                    () => SizedBox(
                      child: controller.selectImage == null
                          ? Container(
                              padding: EdgeInsets.all(Get.height / 30),
                              height: Get.height / 5.5,
                              decoration: BoxDecoration(
                                color: controller.notifier.isDark
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
                                  File(controller.selectImage!.path),
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
                      onTap: () => controller.showimagepicker(context),
                      child: Container(
                        height: Get.height / 27,
                        decoration: BoxDecoration(
                          color: controller.notifier.getBgColor,
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
                controller: controller.namecontroller,
                type: TextInputType.name,
                hintText: "Name",
                titletext: "Name",
              ),
              SizedBox(height: Get.height / 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Phone Number",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: controller.notifier.text,
                      fontSize: Get.height / 65,
                    ),
                  ),
                  IntlPhoneField(
                    style: TextStyle(
                      fontSize: Get.height / 65,
                      color: controller.notifier.text,
                    ),
                    keyboardType: TextInputType.number,
                    dropdownIconPosition: IconPosition.trailing,
                    flagsButtonPadding: EdgeInsets.only(left: Get.width / 30),
                    showCountryFlag: false,
                    dropdownTextStyle: TextStyle(
                      color: controller.notifier.text,
                    ),
                    dropdownIcon: Icon(
                      Icons.keyboard_arrow_down,
                      color: controller.notifier.text,
                    ),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: Get.width / 40),
                      filled: true,
                      fillColor: controller.notifier.getBgColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Get.height / 90),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: controller.notifier.getfillborder,
                        ),
                        borderRadius: BorderRadius.circular(Get.height / 90),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xff0165FC),
                        ),
                        borderRadius: BorderRadius.circular(Get.height / 90),
                      ),
                      hintStyle: TextStyle(
                        fontSize: Get.height / 65,
                        color: Colors.grey,
                      ),
                    ),
                    initialCountryCode: 'US',
                    onChanged: (phone) {},
                  ),
                  MyDropdownButtonField(
                    titletext: "Gender",
                    select: controller.selectedValue.value,
                    items: const ['Male', 'Female'],
                    onChanged: (value) {
                      controller.setSelected(value);
                    },
                  ),
                ],
              ),
              SizedBox(height: Get.height / 30),
              SizedBox(
                width: Get.width,
                height: Get.height / 17,
                child: CustomButton(
                  text: "Complete Profile",
                  radius: BorderRadius.circular(Get.height / 20),
                  onPressed: () {
                    Get.toNamed(Routes.LOCA_ALLOW_PERMI_SCREEN);
                  },
                  color: const Color(0xFF0165FC),
                  textcolor: const Color(0xFFFFFFFF),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
