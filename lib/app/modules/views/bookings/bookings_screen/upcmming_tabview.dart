import 'package:doctor_appointment/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../../widgets/custombutton.dart';
import '../../../controllers/bookings/bookings_screen_controller.dart';

class UpcmmingTabview extends GetView<BookingsScreenController> {
  const UpcmmingTabview({super.key});

  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      body: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width / 20,
          vertical: Get.height / 40,
        ),
        itemCount: controller.drphotos.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: Get.width,
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width / 30,
                  vertical: Get.width / 40,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Get.width / 35),
                  border: Border.all(
                    color: controller.notifier.getfillborder,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Aug 25, 2023 - 10:00 AM",
                          style: TextStyle(
                            color: controller.notifier.text,
                            fontSize: Get.height / 60,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Remind me",
                              style: TextStyle(
                                fontSize: Get.height / 70,
                                color: Colors.grey,
                              ),
                            ),
                            Obx(
                              () => SizedBox(
                                height: Get.height / 80,
                                child: CupertinoSwitch(
                                  activeColor: const Color(0xFF0165FC),
                                  value: controller.switches[index] ?? false,
                                  onChanged: (value) {
                                    controller.toggleSwitch(index, value);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(color: controller.notifier.getfillborder),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          Routes.DOCTOR_DETAILS,
                          arguments: {
                            "image": controller.drphotos[index],
                            "name": controller.drname[index],
                          },
                        );
                      },
                      child: Container(
                        height: Get.height / 8,
                        margin: EdgeInsets.symmetric(vertical: Get.width / 70),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: Get.height / 8,
                              width: Get.width / 4,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Get.height / 80),
                                color: controller.notifier.getimagBgColor,
                                image: DecorationImage(
                                  image: AssetImage(
                                    controller.drphotos[index],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width / 1.9,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.drname[index],
                                    style: TextStyle(
                                      color: controller.notifier.text,
                                      fontSize: Get.height / 55,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: Get.width / 70),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/location-pin-outline.png",
                                        height: Get.height / 70,
                                        color: controller.notifier.text,
                                      ),
                                      Text(
                                        " G8502 Preston Rd. Inglewood",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: Get.height / 65,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: Get.width / 70),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/bookingId.png",
                                        height: Get.height / 50,
                                        color: controller.notifier.text,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: "Booking ID : ",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: Get.height / 65,
                                          ),
                                          children: const [
                                            TextSpan(
                                              text: "#DR452SA54",
                                              style: TextStyle(
                                                color: Color(0xFF0165FC),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(color: controller.notifier.getfillborder),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: Get.width / 2.5,
                          child: CustomButton(
                            text: "Cancel",
                            onPressed: () {
                              Get.toNamed(Routes.CANCLE_BOOKING);
                            },
                            color: const Color(0xFFC8DCFA),
                            textcolor: const Color(0xFF0165FC),
                            radius: BorderRadius.circular(Get.width / 10),
                          ),
                        ),
                        SizedBox(
                          width: Get.width / 2.5,
                          child: CustomButton(
                            text: "Reschedule",
                            onPressed: () {},
                            color: const Color(0xFF0165FC),
                            textcolor: Colors.white,
                            radius: BorderRadius.circular(Get.width / 10),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: Get.height / 80);
        },
      ),
    );
  }
}
