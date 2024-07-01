import 'package:doctor_appointment/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../../../../../widgets/bottombar_widget.dart';
import '../../../../../widgets/buttons.dart';
import '../../../controllers/bookings/review/hospital_review_screen_controller.dart';

class HospitalReviewScreenView extends GetView<HospitalReviewScreenController> {
  const HospitalReviewScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.profileinfocontroller.notifier =
        Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: controller.profileinfocontroller.notifier.getBgColor,
      bottomNavigationBar: MyBottomBar(
        context,
        "Submit",
        () {
          Get.toNamed(Routes.DOCTOR_REVIEW_SCREEN);
        },
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            collapsedHeight: Get.height / 8,
            expandedHeight: Get.height / 2.5,
            floating: true,
            pinned: true,
            bottom: PreferredSize(
              preferredSize: const Size(0, 20),
              child: Container(),
            ),
            leading: MyBackButtons(context),
            actions: [
              shareButton(context),
              Obx(
                () => GestureDetector(
                  onTap: () {
                    controller.favrithospi = !controller.favrithospi;
                  },
                  child: Container(
                    padding: EdgeInsets.all(Get.width / 55),
                    decoration: BoxDecoration(
                      color:
                          controller.profileinfocontroller.notifier.getBgColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: controller.favrithospi == true
                        ? SvgPicture.asset(
                            "assets/images/heartIcon.svg",
                            color: const Color(0xff0165FC),
                          )
                        : SvgPicture.asset(
                            "assets/images/heartoutlineIcon.svg",
                            color:
                                controller.profileinfocontroller.notifier.text,
                          ),
                  ),
                ),
              ),
              SizedBox(width: Get.width / 40),
            ],
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
                    height: Get.height / 40,
                    decoration: BoxDecoration(
                      color:
                          controller.profileinfocontroller.notifier.getBgColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(Get.width / 5),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: Get.width / 80,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      width: Get.width / 2.9,
                      height: Get.height / 35,
                      padding: EdgeInsets.symmetric(horizontal: Get.width / 40),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0165FC),
                        borderRadius: BorderRadius.circular(Get.width / 15),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/images/starIcon.png",
                              height: Get.width / 30,
                              color: Colors.white,
                            ),
                            Text(
                              " 4.8 (1k+ Review)",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: Get.height / 70,
                              ),
                            )
                          ],
                        ),
                      ),
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
                    vertical: Get.height / 50,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Serenity Wellness Clinic",
                        style: TextStyle(
                          color: controller.profileinfocontroller.notifier.text,
                          fontSize: Get.height / 40,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Dental, Skin Care, Eye Care,",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: Get.height / 60,
                        ),
                      ),
                      Divider(
                          color: controller
                              .profileinfocontroller.notifier.getfillborder),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/location-pin.png",
                            height: Get.height / 65,
                            color: const Color(0xff0165FC),
                          ),
                          Text(
                            " 8502 Preston Rd. Inglewood, Maine 98380",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: Get.height / 60,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/clock.svg",
                            height: Get.height / 65,
                            color: const Color(0xff0165FC),
                          ),
                          Text(
                            " 15 min, 1.5km,Mon Sun | 11 am - 11 pm",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: Get.height / 60,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                    color: controller
                        .profileinfocontroller.notifier.getfillborder),
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
                          "You overall rating of this product",
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
                      SizedBox(height: Get.height / 30),
                      Text(
                        "Add details review",
                        style: TextStyle(
                          fontSize: Get.height / 55,
                          color: controller.profileinfocontroller.notifier.text,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: Get.width / 70),
                      TextFormField(
                        cursorColor: const Color(0xff0165FC),
                        style: TextStyle(
                            color:
                                controller.profileinfocontroller.notifier.text),
                        maxLines: 4,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: Get.width / 30,
                            vertical: Get.width / 60,
                          ),
                          filled: true,
                          fillColor: controller
                              .profileinfocontroller.notifier.getBgColor,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(Get.height / 90),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: controller
                                  .profileinfocontroller.notifier.getfillborder,
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
                      SizedBox(height: Get.height / 50),
                      GestureDetector(
                        onTap: () {
                          controller.profileinfocontroller
                              .showimagepicker(context);
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/addphoto_icon.png",
                              color: const Color(0xFF0165FC),
                              height: Get.height / 50,
                            ),
                            Text(
                              "  add photo",
                              style: TextStyle(
                                color: const Color(0xFF0165FC),
                                fontSize: Get.height / 60,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Get.height / 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
