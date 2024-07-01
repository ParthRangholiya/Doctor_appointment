import 'package:doctor_appointment/app/routes/app_pages.dart';
import 'package:doctor_appointment/widgets/google_map_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import 'home/filter_screen_view.dart';
import '../controllers/explore_screen_controller.dart';

class ExploreScreenView extends GetView<ExploreScreenController> {
  const ExploreScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);

    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      body: Stack(
        children: [
          const GoogleMapWidget(
            tiltGesturesEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: false,
            zoom: 13,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width / 25,
                  vertical: Get.height / 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.SEARCH_SCREEN);
                      },
                      child: Container(
                        width: Get.width / 1.3,
                        height: Get.height / 20,
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width / 70),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Get.height / 90),
                          color: controller.notifier.getBgColor,
                          border: Border.all(
                            color: controller.notifier.getfillborder,
                          ),
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/searchIcon.png",
                                color: const Color(0xFF0165FC),
                                height: Get.height / 35,
                              ),
                              SizedBox(width: Get.width / 80),
                              Text(
                                "Search Doctor, Hospital",
                                style: TextStyle(
                                  fontSize: Get.height / 55,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(
                          () => const FilterScreenView(),
                          transition: Transition.downToUp,
                          duration: const Duration(milliseconds: 500),
                        );
                      },
                      child: Container(
                        height: Get.height / 20,
                        width: Get.width / 8,
                        padding: EdgeInsets.all(Get.width / 90),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0165FC),
                          borderRadius: BorderRadius.circular(Get.height / 80),
                        ),
                        child: Image.asset("assets/images/menu.png"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height / 2.7,
                child: ListView.builder(
                  itemCount: 3,
                  padding: EdgeInsets.only(
                      bottom: Get.height / 90, left: Get.width / 35),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      width: Get.width / 1.2,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: controller.notifier.getcontainer,
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(Get.width / 30),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(5, 6),
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: Get.height / 7,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(Get.width / 35),
                                topRight: Radius.circular(Get.width / 35),
                              ),
                              child: Image.asset(
                                "assets/images/glamourhaven.jpeg",
                                width: Get.width,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: Get.width,
                              height: Get.height,
                              margin: EdgeInsets.all(Get.width / 50),
                              decoration: const BoxDecoration(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Glamour Haven",
                                            style: TextStyle(
                                              color: controller.notifier.text,
                                              fontSize: Get.height / 50,
                                            ),
                                          ),
                                          SizedBox(height: Get.width / 80),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
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
                                                  fontSize: Get.height / 55,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: Get.width / 80),
                                          Obx(
                                            () => Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  controller.rating
                                                      .toStringAsFixed(1),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: Get.height / 65,
                                                    color: controller
                                                        .notifier.text,
                                                  ),
                                                ),
                                                SizedBox(width: Get.width / 40),
                                                SmoothStarRating(
                                                  allowHalfRating: true,
                                                  size: Get.height / 45,
                                                  rating: controller.rating,
                                                  filledIconData: Icons.star,
                                                  halfFilledIconData:
                                                      Icons.star_half,
                                                  defaultIconData:
                                                      Icons.star_outline,
                                                  starCount: 5,
                                                  color:
                                                      const Color(0xffECA61B),
                                                  borderColor:
                                                      const Color(0xffECA61B),
                                                  onRatingChanged: (value) {
                                                    controller.rating = value;
                                                  },
                                                ),
                                                SizedBox(width: Get.width / 40),
                                                Text(
                                                  "(107 Reviews)",
                                                  style: TextStyle(
                                                    fontSize: Get.height / 60,
                                                    color: Colors.grey,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Get.toNamed(Routes.GET_DIRECTION);
                                            },
                                            child: Container(
                                              width: Get.height / 20,
                                              height: Get.height / 20,
                                              padding: EdgeInsets.all(
                                                  Get.width / 50),
                                              decoration: const BoxDecoration(
                                                color: Color(0xff0165FC),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                "assets/images/sendIcon.png",
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: controller.notifier.getfillborder,
                                  ),
                                  SizedBox(
                                    height: Get.height / 25,
                                    child: ListView.separated(
                                      itemCount: controller.imag.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              controller.imag[index],
                                              height: Get.height / 40,
                                              color: const Color(0xff0165FC),
                                            ),
                                            Text(
                                              " ${controller.text[index]}",
                                              style: TextStyle(
                                                fontSize: Get.height / 50,
                                                color: controller.notifier.text,
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return SizedBox(width: Get.width / 10);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
