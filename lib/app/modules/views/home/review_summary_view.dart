import 'package:doctor_appointment/app/routes/app_pages.dart';
import 'package:doctor_appointment/widgets/buttons.dart';
import 'package:doctor_appointment/widgets/bottombar_widget.dart';
import 'package:doctor_appointment/widgets/doctor_info_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../controllers/home/review_summary_controller.dart';

class ReviewSummaryView extends GetView<ReviewSummaryController> {
  const ReviewSummaryView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      appBar: AppBar(
        backgroundColor: controller.notifier.getBgColor,
        title: Text(
          'ReviewSummary',
          style: TextStyle(
            color: controller.notifier.text,
            fontSize: Get.height / 40,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: MyBackButtons(context),
      ),
      bottomNavigationBar: MyBottomBar(
        context,
        "Pay Now",
        () {
          Get.toNamed(Routes.PAYMENT);
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width / 25,
          vertical: Get.height / 50,
        ),
        child: Column(
          children: [
            DoctorInfoWidget(
              name: controller.bookAppointmentController.drname,
              image: controller.bookAppointmentController.drphoto,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Get.height / 45),
              child: Divider(
                color: controller.notifier.getfillborder,
              ),
            ),
            ListView.separated(
              itemCount: controller.reviewtitle.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.reviewtitle[index],
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: Get.height / 55,
                      ),
                    ),
                    Text(
                      controller.reviewvalue[index],
                      style: TextStyle(
                        color: controller.notifier.text,
                        fontSize: Get.height / 55,
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                if (index == 3) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: Get.height / 60),
                    child: Divider(
                      color: controller.notifier.getfillborder,
                    ),
                  );
                }
                return SizedBox(height: Get.height / 70);
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Get.height / 60),
              child: Divider(
                color: controller.notifier.getfillborder,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/cash.png",
                      height: Get.height / 40,
                      color: const Color(0xFF0165FC),
                    ),
                    SizedBox(width: Get.width / 80),
                    Text(
                      "Cash",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: Get.height / 55,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    "Change",
                    style: TextStyle(
                      color: const Color(0xFF0165FC),
                      fontSize: Get.height / 55,
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
