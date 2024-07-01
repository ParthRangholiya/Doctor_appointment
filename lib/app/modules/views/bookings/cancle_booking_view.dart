import 'package:doctor_appointment/widgets/bottombar_widget.dart';
import 'package:doctor_appointment/widgets/buttons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../controllers/bookings/cancle_booking_controller.dart';

class CancleBookingView extends GetView<CancleBookingController> {
  const CancleBookingView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);

    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      appBar: AppBar(
        backgroundColor: controller.notifier.getBgColor,
        title: Text(
          'Cancle Booking',
          style: TextStyle(
            color: controller.notifier.text,
            fontSize: Get.height / 40,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: MyBackButtons(context),
        centerTitle: true,
      ),
      bottomNavigationBar: MyBottomBar(
        context,
        "Cancel Appointment",
        () {},
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width / 25,
          vertical: Get.width / 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Please select the reason for cancellations : ",
              style: TextStyle(
                color: Colors.grey,
                fontSize: Get.height / 55,
              ),
            ),
            SizedBox(height: Get.height / 50),
            ListView.builder(
              itemCount: controller.cancellationsreason.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Obx(
                  () => SizedBox(
                    height: Get.height / 20,
                    child: Center(
                      child: RadioListTile(
                        tileColor: Colors.transparent,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          controller.cancellationsreason[index],
                          style: TextStyle(
                            color: controller.notifier.text,
                            fontSize: Get.height / 55,
                          ),
                        ),
                        hoverColor: Colors.transparent,
                        activeColor: const Color(0xFF0165FC),
                        value: index,
                        groupValue: controller.selectReason.value,
                        onChanged: (value) {
                          controller.updateReasonvalues(index);
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Get.width / 50),
              child: Divider(color: controller.notifier.getfillborder),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Other  ",
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
                  maxLines: 6,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: Get.width / 30,
                      vertical: Get.width / 60,
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
                    hintText: "Enter your Reason",
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
    );
  }
}
