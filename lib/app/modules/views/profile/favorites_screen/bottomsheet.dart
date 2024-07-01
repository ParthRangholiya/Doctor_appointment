import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../../../../../widgets/custombutton.dart';
import '../../../controllers/profile/favorites_screen_controller.dart';

showmodelbottomsheetshos(context, String imag, String text) {
  final FavoritesScreenController favhospitalcontroller = Get.find();

  showModalBottomSheet(
    context: context,
    backgroundColor: favhospitalcontroller.notifier.getBgColor,
    builder: (context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: Get.width / 30,
            horizontal: Get.width / 27,
          ),
          width: Get.width,
          decoration: const BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Remove from Favorite?",
                style: TextStyle(
                  fontSize: Get.height / 40,
                  color: favhospitalcontroller.notifier.text,
                ),
              ),
              const Divider(),
              Container(
                width: Get.width,
                margin: EdgeInsets.all(Get.width / 50),
                decoration: BoxDecoration(
                  color: favhospitalcontroller.notifier.getcontainer,
                  borderRadius: BorderRadius.circular(Get.height / 40),
                  border: Border.all(color: Colors.black12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                            imag,
                            fit: BoxFit.cover,
                            width: Get.width,
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
                              color: favhospitalcontroller.notifier.getBgColor,
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
                                    color: favhospitalcontroller.notifier.text,
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
                            text,
                            style: TextStyle(
                              fontSize: Get.height / 55,
                              fontWeight: FontWeight.w500,
                              color: favhospitalcontroller.notifier.text,
                            ),
                          ),
                          Text(
                            "Dental, Skin care",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: Get.height / 65,
                            ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width / 2.3,
                    height: Get.height / 18,
                    child: CustomButton(
                      text: "cancle",
                      onPressed: () => Get.back(),
                      color: const Color(0xFFC8DCFA),
                      textcolor: const Color(0xff0165FC),
                      radius: BorderRadius.circular(Get.height / 20),
                    ),
                  ),
                  SizedBox(
                    width: Get.width / 2.3,
                    height: Get.height / 18,
                    child: CustomButton(
                      text: "Yes,Romove",
                      onPressed: () {
                        favhospitalcontroller
                            .homeController.nearbyhospitalspotos
                            .remove(imag);
                        favhospitalcontroller.homeController.nearbyhospitalsname
                            .remove(text);
                        Get.back();
                      },
                      color: const Color(0xFF0165FC),
                      textcolor: const Color(0xFFFFFFFF),
                      radius: BorderRadius.circular(Get.height / 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

showmodelbottomsheetsdr(context, String imag, String text) {
  final FavoritesScreenController favdoctorcontroller = Get.find();

  showModalBottomSheet(
    context: context,
    backgroundColor: favdoctorcontroller.notifier.getBgColor,
    builder: (context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: Get.width / 30,
            horizontal: Get.width / 27,
          ),
          height: Get.height / 2.7,
          width: Get.width,
          decoration: const BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Remove from Favorite?",
                style: TextStyle(
                  fontSize: Get.height / 40,
                  color: favdoctorcontroller.notifier.text,
                ),
              ),
              const Divider(),
              Container(
                width: Get.width,
                padding: EdgeInsets.all(Get.width / 40),
                decoration: BoxDecoration(
                  color: favdoctorcontroller.notifier.getcontainer,
                  borderRadius: BorderRadius.circular(Get.height / 60),
                  border: Border.all(color: Colors.black12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: Get.height / 8,
                          width: Get.width / 4,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Get.height / 80),
                            color: favdoctorcontroller.notifier.getimagBgColor,
                          ),
                          child: Image.asset(
                            imag,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: Get.width / 1.7,
                          height: Get.height / 8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: Get.height / 30,
                                    width: Get.width / 2,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: Get.width / 40,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFC8DCFA),
                                      borderRadius: BorderRadius.circular(
                                          Get.height / 20),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/images/shieldtrustIcon.svg",
                                          height: Get.height / 55,
                                          color: const Color(0xff0165FC),
                                        ),
                                        Text(
                                          "Proffesional Doctor",
                                          style: TextStyle(
                                            color: const Color(0xff0165FC),
                                            fontSize: Get.height / 60,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                text,
                                style: TextStyle(
                                  fontSize: Get.height / 55,
                                  fontWeight: FontWeight.w500,
                                  color: favdoctorcontroller.notifier.text,
                                ),
                              ),
                              const Text(
                                "Dentist",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                height: Get.height / 40,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Obx(
                                          () => SmoothStarRating(
                                            allowHalfRating: true,
                                            size: Get.height / 45,
                                            rating: favdoctorcontroller.rating,
                                            filledIconData: Icons.star,
                                            halfFilledIconData: Icons.star_half,
                                            defaultIconData: Icons.star_outline,
                                            starCount: 5,
                                            color: const Color(0xffECA61B),
                                            borderColor:
                                                const Color(0xffECA61B),
                                            onRatingChanged: (value) {
                                              favdoctorcontroller.rating =
                                                  value;
                                            },
                                          ),
                                        ),
                                        Obx(
                                          () => Text(
                                            favdoctorcontroller.rating
                                                .toStringAsFixed(1),
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: Get.height / 70,
                                                color: favdoctorcontroller
                                                    .notifier.text),
                                          ),
                                        ),
                                        VerticalDivider(
                                          color: favdoctorcontroller
                                              .notifier.getfillborder,
                                          indent: Get.width / 90,
                                          endIndent: Get.width / 90,
                                        ),
                                        Text(
                                          "49 Reviewers",
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
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width / 2.3,
                    height: Get.height / 18,
                    child: CustomButton(
                      text: "cancle",
                      onPressed: () => Get.back(),
                      color: const Color(0xFFC8DCFA),
                      textcolor: const Color(0xff0165FC),
                      radius: BorderRadius.circular(Get.height / 20),
                    ),
                  ),
                  SizedBox(
                    width: Get.width / 2.3,
                    height: Get.height / 18,
                    child: CustomButton(
                      text: "Yes,Romove",
                      onPressed: () {
                        favdoctorcontroller.homeController.topspefavphotos
                            .remove(imag);
                        favdoctorcontroller.homeController.topspefavname
                            .remove(text);
                        Get.back();
                      },
                      color: const Color(0xFF0165FC),
                      textcolor: const Color(0xFFFFFFFF),
                      radius: BorderRadius.circular(Get.height / 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
