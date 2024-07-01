import 'package:doctor_appointment/app/routes/app_pages.dart';
import 'package:doctor_appointment/widgets/buttons.dart';
import 'package:doctor_appointment/widgets/bottombar_widget.dart';
import 'package:doctor_appointment/widgets/doctor_info_widget.dart';
import 'package:doctor_appointment/widgets/doctor_work_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../controllers/home/book_appointment_controller.dart';

class BookAppointmentView extends GetView<BookAppointmentController> {
  const BookAppointmentView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);

    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      appBar: AppBar(
        title: Text(
          'Book Appointment',
          style: TextStyle(
            color: controller.notifier.text,
            fontSize: Get.height / 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: controller.notifier.getBgColor,
        centerTitle: true,
        leading: MyBackButtons(context),
      ),
      bottomNavigationBar: MyBottomBar(
        context,
        "Make Appointment",
        () {
          Get.toNamed(Routes.SELECT_PACKAGE);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Get.width / 25,
                vertical: Get.height / 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DoctorInfoWidget(
                    image: controller.drphoto,
                    name: controller.drname,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: Get.height / 45),
                    child: Divider(
                      color: controller.notifier.getfillborder,
                    ),
                  ),
                  const DoctorWorkWidget(),
                  SizedBox(height: Get.height / 30),
                  const Text(
                    "BOOK APPOINTMENT",
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(height: Get.height / 60),
                  Text(
                    "Day",
                    style: TextStyle(
                      color: controller.notifier.text,
                      fontSize: Get.height / 40,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height / 15,
              width: Get.width,
              child: ListView.separated(
                itemCount: controller.days.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: Get.width / 25),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Obx(
                    () => GestureDetector(
                      onTap: () =>
                          controller.onchangedays(controller.days[index]),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: Get.width / 93,
                          horizontal: Get.width / 13.5,
                        ),
                        decoration: BoxDecoration(
                          color: controller.days[index] != controller.selectday
                              ? controller.notifier.getBgColor
                              : const Color(0xff0165FC),
                          borderRadius: BorderRadius.circular(Get.height / 20),
                          border: Border.all(
                            color:
                                controller.days[index] != controller.selectday
                                    ? controller.notifier.getfillborder
                                    : const Color(0xFF0165FC),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              controller.days[index],
                              style: TextStyle(
                                color: controller.days[index] !=
                                        controller.selectday
                                    ? controller.notifier.text
                                    : Colors.white,
                                fontSize: Get.height / 65,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              controller.date[index],
                              style: TextStyle(
                                color: controller.days[index] !=
                                        controller.selectday
                                    ? controller.notifier.text
                                    : Colors.white,
                                fontSize: Get.height / 55,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: Get.width / 60);
                },
              ),
            ),
            SizedBox(height: Get.height / 40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 25),
              child: Text(
                "Time",
                style: TextStyle(
                  color: controller.notifier.text,
                  fontSize: Get.height / 40,
                ),
              ),
            ),
            SizedBox(height: Get.height / 60),
            SizedBox(
              height: Get.height / 16,
              width: Get.width,
              child: ListView.separated(
                itemCount: controller.times.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: Get.width / 25),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Obx(
                    () => GestureDetector(
                      onTap: () =>
                          controller.onchnagetime(controller.times[index]),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: Get.width / 12.5,
                        ),
                        decoration: BoxDecoration(
                          color:
                              controller.times[index] != controller.selectTime
                                  ? controller.notifier.getBgColor
                                  : const Color(0xff0165FC),
                          borderRadius: BorderRadius.circular(Get.height / 20),
                          border: Border.all(
                            color:
                                controller.times[index] != controller.selectTime
                                    ? controller.notifier.getfillborder
                                    : const Color(0xFF0165FC),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            controller.times[index],
                            style: TextStyle(
                              color: controller.times[index] !=
                                      controller.selectTime
                                  ? controller.notifier.text
                                  : Colors.white,
                              fontSize: Get.height / 55,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: Get.width / 60);
                },
              ),
            ),
            SizedBox(height: Get.height / 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 25),
              child: TextFormField(
                cursorColor: const Color(0xff0165FC),
                style: TextStyle(color: controller.notifier.text),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: Get.width / 40,
                  ),
                  filled: true,
                  fillColor: controller.notifier.isDark
                      ? Colors.white12
                      : Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Get.height / 40),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(Get.height / 40),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xff0165FC),
                    ),
                    borderRadius: BorderRadius.circular(Get.height / 40),
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(
                        right: Get.width / 50, top: Get.height / 70),
                    child: Text(
                      "Request Schedule",
                      style: TextStyle(
                        fontSize: Get.height / 55,
                        color: const Color(0xFF0165FC),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  hintText: "Want a custom schedule?",
                  hintStyle: TextStyle(
                    fontSize: Get.height / 55,
                    color: controller.notifier.text,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
