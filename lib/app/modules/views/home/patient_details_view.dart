import 'package:doctor_appointment/app/routes/app_pages.dart';
import 'package:doctor_appointment/widgets/buttons.dart';
import 'package:doctor_appointment/widgets/bottombar_widget.dart';
import 'package:doctor_appointment/widgets/dropdownfield_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../controllers/home/patient_details_controller.dart';

class PatientDetailsView extends GetView<PatientDetailsController> {
  const PatientDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);

    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      appBar: AppBar(
        backgroundColor: controller.notifier.getBgColor,
        title: Text(
          'Patient Details',
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
        "Next",
        () {
          Get.toNamed(Routes.PAYMENT_METHODS, arguments: {"boolean": false});
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Get.width / 25,
            vertical: Get.height / 40,
          ),
          child: Column(
            children: [
              MyDropdownButtonField(
                titletext: "Booking for",
                select: controller.selectperson,
                items: const ["Self", "Other"],
                onChanged: (value) {
                  controller.selectperson = value;
                },
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
              SizedBox(height: Get.height / 50),
              MyDropdownButtonField(
                titletext: "Your Age",
                select: controller.selectage,
                items: const ["24 Years", "25 Years", "26 Years"],
                onChanged: (value) {
                  controller.selectage = value;
                },
              ),
              SizedBox(height: Get.height / 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Write Your Problem",
                    style: TextStyle(
                      fontSize: Get.height / 65,
                      color: controller.notifier.text,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: Get.width / 80),
                  TextFormField(
                    cursorColor: const Color(0xff0165FC),
                    style: TextStyle(color: controller.notifier.text),
                    maxLines: 7,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: Get.width / 40,
                        vertical: Get.width / 70,
                      ),
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
                      hintText: "Write here...",
                      hintStyle: TextStyle(
                        fontSize: Get.height / 55,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
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
