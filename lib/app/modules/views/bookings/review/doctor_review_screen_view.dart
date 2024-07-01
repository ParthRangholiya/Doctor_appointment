import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../../../../../widgets/bottombar_widget.dart';
import '../../../../../widgets/buttons.dart';
import '../../../controllers/bookings/review/doctor_review_screen_controller.dart';

class DoctorReviewScreenView extends GetView<DoctorReviewScreenController> {
  const DoctorReviewScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      bottomNavigationBar: MyBottomBar(
        context,
        "Submit",
        () {},
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            collapsedHeight: Get.height / 5,
            expandedHeight: Get.height / 2.5,
            floating: true,
            pinned: true,
            bottom: PreferredSize(
              preferredSize: const Size(0, 20),
              child: Container(),
            ),
            leading: MyBackButtons(context),
            flexibleSpace: Stack(
              children: [
                SizedBox(
                  height: Get.height,
                  width: Get.width,
                  child: Image.asset(
                    "assets/images/dentalhospital.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: -3,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: Get.height / 8.5,
                    decoration: BoxDecoration(
                      color: controller.notifier.getBgColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(Get.width / 15),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: Get.height / 50,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Stack(
                      children: [
                        Container(
                          height: Get.height / 6,
                          width: Get.height / 6,
                          padding:
                              EdgeInsets.symmetric(horizontal: Get.width / 30),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade400,
                            border: Border.all(
                              color: controller.notifier.getBgColor,
                              width: 6,
                            ),
                          ),
                          child: Image.asset("assets/images/doctor.jpg"),
                        ),
                        Positioned(
                          bottom: Get.height / 50,
                          right: Get.width / 35,
                          child: SvgPicture.asset(
                            "assets/images/shieldtrustIcon.svg",
                            height: Get.height / 40,
                            color: controller.notifier.isDark
                                ? Colors.white
                                : const Color(0xff0165FC),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.width / 25,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Dr. Jonny Wilson",
                        style: TextStyle(
                          color: controller.notifier.text,
                          fontSize: Get.height / 40,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Dentist",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: Get.height / 60,
                        ),
                      ),
                      SizedBox(height: Get.height / 50),
                      Text(
                        "How  was your experience with Jonny?",
                        style: TextStyle(
                          color: controller.notifier.text,
                          fontSize: Get.height / 45,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: Get.height / 50),
                    ],
                  ),
                ),
                Divider(color: controller.notifier.getfillborder),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.width / 25,
                    vertical: Get.height / 50,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "You overall rating",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: Get.height / 60,
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height / 50),
                      Obx(
                        () => Center(
                          child: SmoothStarRating(
                            allowHalfRating: true,
                            size: Get.height / 20,
                            spacing: Get.width / 25,
                            rating: controller.rating,
                            filledIconData: Icons.star,
                            halfFilledIconData: Icons.star_half,
                            defaultIconData: Icons.star_outline,
                            starCount: 5,
                            color: const Color(0xffECA61B),
                            borderColor: const Color(0xffECA61B),
                            onRatingChanged: (value) {
                              controller.rating = value;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Get.height / 50),
                Divider(color: controller.notifier.getfillborder),
                SizedBox(height: Get.height / 50),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.width / 25,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Add detailed review",
                        style: TextStyle(
                          fontSize: Get.height / 55,
                          color: controller.notifier.text,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: Get.width / 70),
                      TextFormField(
                        cursorColor: const Color(0xff0165FC),
                        style: TextStyle(color: controller.notifier.text),
                        maxLines: 4,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: Get.width / 30,
                            vertical: Get.width / 60,
                          ),
                          filled: true,
                          fillColor: controller.notifier.getBgColor,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(Get.height / 90),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: controller.notifier.getfillborder,
                            ),
                            borderRadius:
                                BorderRadius.circular(Get.height / 90),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xff0165FC),
                            ),
                            borderRadius:
                                BorderRadius.circular(Get.height / 90),
                          ),
                          hintText: "Enter here",
                          hintStyle: TextStyle(
                            fontSize: Get.height / 55,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height / 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
