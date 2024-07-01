import 'package:doctor_appointment/app/modules/controllers/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../app/routes/app_pages.dart';

class NearbyHospitalWidget extends GetView<HomeController> {
  const NearbyHospitalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width / 30,
        ),
        shrinkWrap: true,
        itemCount: controller.nearbyhospitals.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.toNamed(
                Routes.HOSPITAL_DETAIL,
                arguments: {
                  "himage": controller.nearbyhospitals[index],
                  "hname": controller.hospitalstext[index]
                },
              );
            },
            child: Container(
              width: Get.width / 1.9,
              margin: EdgeInsets.all(Get.width / 50),
              decoration: BoxDecoration(
                color: controller.notifier.getcontainer,
                borderRadius: BorderRadius.circular(Get.height / 40),
                border: Border.all(color: Colors.black12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Get.height / 45),
                          topRight: Radius.circular(Get.height / 45),
                        ),
                        child: Image.asset(
                          controller.nearbyhospitals[index],
                          fit: BoxFit.cover,
                          width: Get.width,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Obx(
                          () => GestureDetector(
                            onTap: () {
                              controller.nearbyhospitalslickebuttton(index);
                            },
                            child: Container(
                              height: Get.height / 20,
                              padding: EdgeInsets.all(Get.width / 40),
                              decoration: const BoxDecoration(
                                color: Colors.white38,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: controller.nearbyhospitalspotos.contains(
                                            controller
                                                .nearbyhospitals[index]) !=
                                        true
                                    ? SvgPicture.asset(
                                        "assets/images/heartoutlineIcon.svg",
                                        color: const Color(0xFFFFFFFF),
                                      )
                                    : SvgPicture.asset(
                                        "assets/images/heartIcon.svg",
                                        color: const Color(0xff0165FC),
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: Get.width / 95,
                        right: Get.width / 80,
                        child: Container(
                          height: Get.height / 30,
                          padding: EdgeInsets.symmetric(
                            horizontal: Get.width / 50,
                          ),
                          decoration: BoxDecoration(
                            color: controller.notifier.getBgColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/images/starIcon.png",
                                color: Colors.amber,
                                height: Get.height / 55,
                              ),
                              Text(
                                " 4.8",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: Get.height / 65,
                                  color: controller.notifier.text,
                                ),
                              ),
                              Text(
                                " (1k+ Review)",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: Get.height / 65,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Get.width / 40,
                      vertical: 7,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.hospitalstext[index],
                          style: TextStyle(
                            fontSize: Get.height / 55,
                            fontWeight: FontWeight.w500,
                            color: controller.notifier.text,
                          ),
                        ),
                        Text(
                          "Dental, Skin care",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: Get.height / 65,
                          ),
                        ),
                        Divider(color: controller.notifier.getfillborder),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/location-pin.png",
                              height: Get.height / 70,
                              color: const Color(0xff0165FC),
                            ),
                            Text(
                              " 8502 Preston Rd. Inglewood,Maine 98380",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: Get.height / 65,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/images/clock.svg",
                              height: Get.height / 70,
                              color: const Color(0xff0165FC),
                            ),
                            Text(
                              " 15 min, 1.5km",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: Get.height / 65,
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
          );
        },
      ),
    );
  }
}
