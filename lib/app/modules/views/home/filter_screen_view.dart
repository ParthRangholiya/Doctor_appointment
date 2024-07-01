import 'package:doctor_appointment/widgets/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../widgets/custombutton.dart';
import '../../controllers/home/filter_screen_controller.dart';

class FilterScreenView extends GetView<FilterScreenController> {
  const FilterScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      appBar: AppBar(
        backgroundColor: controller.notifier.getBgColor,
        title: Text(
          'Filter',
          style: TextStyle(
            color: controller.notifier.text,
            fontSize: Get.height / 40,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: MyBackButtons(context),
      ),
      bottomNavigationBar: Container(
        height: Get.height / 10,
        padding: EdgeInsets.symmetric(
          horizontal: Get.width / 20,
          vertical: Get.height / 60,
        ),
        decoration: BoxDecoration(
          color: controller.notifier.getBgColor,
          border: Border(
            top: BorderSide(
              color: controller.notifier.getfillborder,
            ),
            left: BorderSide(
              color: controller.notifier.getfillborder,
            ),
            right: BorderSide(
              color: controller.notifier.getfillborder,
            ),
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Get.width / 25),
            topRight: Radius.circular(Get.width / 25),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: Get.height / 17,
              width: Get.width / 2.3,
              child: CustomButton(
                text: "Reset Filter",
                onPressed: () {},
                color: const Color(0xFFC8DCFA),
                textcolor: const Color(0xff0165FC),
                radius: BorderRadius.circular(Get.width / 10),
              ),
            ),
            SizedBox(
              height: Get.height / 17,
              width: Get.width / 2.3,
              child: CustomButton(
                text: "Apply",
                onPressed: () {},
                color: const Color(0xFF0165FC),
                textcolor: Colors.white,
                radius: BorderRadius.circular(Get.width / 10),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: Get.width / 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 25),
              child: Text(
                "Specialty",
                style: TextStyle(
                  color: controller.notifier.text,
                  fontSize: Get.height / 45,
                ),
              ),
            ),
            SizedBox(height: Get.height / 70),
            SizedBox(
              height: Get.height / 22,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: Get.width / 25),
                itemCount: controller.doctorspecialty.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Obx(
                    () => GestureDetector(
                      onTap: () {
                        controller
                            .updatespecialty(controller.doctorspecialty[index]);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: Get.width / 60,
                          horizontal: Get.width / 25,
                        ),
                        decoration: BoxDecoration(
                          color: controller.doctorspecialty[index] ==
                                  controller.selectdrspecialty
                              ? const Color(0xFF0165FC)
                              : controller.notifier.getimagBgColor,
                          borderRadius: BorderRadius.circular(Get.height / 20),
                        ),
                        child: Center(
                          child: Text(
                            controller.doctorspecialty[index],
                            style: TextStyle(
                              color: controller.doctorspecialty[index] ==
                                      controller.selectdrspecialty
                                  ? Colors.white
                                  : Colors.grey,
                              fontSize: Get.height / 55,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: Get.width / 40);
                },
              ),
            ),
            SizedBox(height: Get.height / 50),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Reviews",
                    style: TextStyle(
                      color: controller.notifier.text,
                      fontSize: Get.height / 45,
                    ),
                  ),
                  ListView.builder(
                    itemCount: controller.reviews.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: Get.height / 25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Obx(
                                  () => Center(
                                    child: SmoothStarRating(
                                      allowHalfRating: true,
                                      size: Get.height / 35,
                                      rating: controller.ratings[index],
                                      filledIconData: Icons.star,
                                      halfFilledIconData: Icons.star_half,
                                      defaultIconData: Icons.star_outline,
                                      starCount: 5,
                                      color: const Color(0xffECA61B),
                                      borderColor: const Color(0xffECA61B),
                                      onRatingChanged: (value) {
                                        controller.ratings[index] = value;
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(width: Get.width / 50),
                                Text(
                                  controller.reviews[index],
                                  style: TextStyle(
                                    fontSize: Get.height / 55,
                                    color: controller.notifier.text,
                                  ),
                                ),
                              ],
                            ),
                            Obx(
                              () => Radio(
                                value: index,
                                activeColor: const Color(0xFF0165FC),
                                groupValue: controller.selectreviews.value,
                                onChanged: (value) {
                                  controller.updateviews(value);
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: Get.height / 50),
                  Text(
                    "Distance (km)",
                    style: TextStyle(
                      color: controller.notifier.text,
                      fontSize: Get.height / 45,
                    ),
                  ),
                  Obx(
                    () => SizedBox(
                      width: Get.width,
                      child: SfRangeSlider(
                        min: 0.0,
                        max: 80.0,
                        values: controller.currentRangeValues.value,
                        interval: 10,
                        activeColor: const Color(0xFF0165FC),
                        inactiveColor: const Color(0xFFC8DCFA),
                        showLabels: true,
                        onChanged: (SfRangeValues values) {},
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height / 50),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "Instant Book",
                      style: TextStyle(
                        color: controller.notifier.text,
                        fontSize: Get.height / 45,
                      ),
                    ),
                    subtitle: Text(
                      "Book without waiting for the host to respond",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: Get.height / 68,
                      ),
                    ),
                    trailing: Obx(
                      () => CupertinoSwitch(
                        trackColor: controller.notifier.getimagBgColor,
                        activeColor: const Color(0xFF0165FC),
                        value: controller.swich,
                        onChanged: (value) {
                          controller.swich = value;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
