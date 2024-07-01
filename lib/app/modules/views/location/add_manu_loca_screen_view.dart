import 'package:doctor_appointment/widgets/buttons.dart';
import 'package:doctor_appointment/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../controllers/location/add_manu_loca_screen_controller.dart';

class AddManuLocaScreenView extends GetView<AddManuLocaScreenController> {
  const AddManuLocaScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);

    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      appBar: AppBar(
        backgroundColor: controller.notifier.getBgColor,
        title: Text(
          'Enter Your Loction',
          style: TextStyle(
            color: controller.notifier.text,
          ),
        ),
        centerTitle: true,
        leading: MyBackButtons(context),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyTextField(
              controller: controller.locationcontroller,
              type: TextInputType.name,
              hintText: "Search location",
              prefixIcon: Container(
                padding: EdgeInsets.all(Get.width / 40),
                height: Get.height / 50,
                child: Image.asset(
                  "assets/images/searchIcon.png",
                  height: Get.height / 50,
                  color: controller.notifier.text,
                ),
              ),
              suffixIcon: Container(
                padding: EdgeInsets.all(Get.width / 40),
                height: Get.height / 50,
                child: Image.asset(
                  "assets/images/closeIcon.png",
                  height: Get.height / 50,
                ),
              ),
            ),
            SizedBox(height: Get.height / 50),
            ListTile(
              leading: Image.asset(
                "assets/images/sendIcon.png",
                height: Get.height / 30,
              ),
              title: Text(
                "Use my current location",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: Get.height / 50,
                  color: controller.notifier.text,
                ),
              ),
            ),
            const Divider(),
            SizedBox(height: Get.height / 80),
            Text(
              "SEARCH RESULT",
              style: TextStyle(
                letterSpacing: 2,
                color: Colors.grey,
                fontSize: Get.height / 60,
                fontWeight: FontWeight.w500,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Image.asset(
                "assets/images/sendIcon.png",
                height: Get.height / 40,
              ),
              title: Text(
                "Golden Avenue",
                style: TextStyle(
                  fontSize: Get.height / 55,
                  color: controller.notifier.text,
                ),
              ),
              subtitle: Text(
                "8502 Preston Rd. Ingl...",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: Get.height / 65,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
