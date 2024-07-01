import 'package:doctor_appointment/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../../../../widgets/custombutton.dart';
import '../../../routes/app_pages.dart';
import '../../controllers/home/top_specialist_controller.dart';

class TopSpecialistView extends GetView<TopSpecialistController> {
  const TopSpecialistView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);

    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.height / 7),
        child: Column(
          children: [
            AppBar(
              backgroundColor: controller.notifier.getBgColor,
              title: Text(
                'Top Specialist',
                style: TextStyle(
                  color: controller.notifier.text,
                  fontSize: Get.height / 40,
                  fontWeight: FontWeight.w500,
                ),
              ),
              centerTitle: true,
              leading: MyBackButtons(context),
              actions: [searchButton(context)],
            ),
            SizedBox(
              height: Get.height / 15,
              width: Get.width,
              child: Center(
                child: ListView.separated(
                  itemCount: controller.topspecialist.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.width / 25,
                  ),
                  itemBuilder: (context, index) {
                    return Obx(
                      () => GestureDetector(
                        onTap: () => controller.addlistdrtypes(index),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: Get.width / 20.5,
                          ),
                          margin:
                              EdgeInsets.symmetric(vertical: Get.height / 80),
                          decoration: BoxDecoration(
                            color:
                                controller.topspecialistselect.contains(index)
                                    ? const Color(0xff0165FC)
                                    : controller.notifier.getBgColor,
                            borderRadius:
                                BorderRadius.circular(Get.height / 20),
                            border: Border.all(
                              color:
                                  controller.topspecialistselect.contains(index)
                                      ? const Color(0xFF0165FC)
                                      : controller.notifier.getfillborder,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              controller.topspecialist[index],
                              style: TextStyle(
                                color: controller.topspecialistselect
                                        .contains(index)
                                    ? Colors.white
                                    : controller.notifier.text,
                                fontSize: Get.height / 60,
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
            ),
          ],
        ),
      ),
      body:  ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
        horizontal: Get.width / 25,
      ),
      itemCount: controller.homeController.topspecialistdrphotos.length,
      itemBuilder: (context, index) {
        return Container(
          height: Get.height / 4.7,
          width: Get.width,
          padding: EdgeInsets.all(Get.width / 40),
          decoration: BoxDecoration(
            color: controller.notifier.getcontainer,
            borderRadius: BorderRadius.circular(Get.height / 60),
            border: Border.all(color: Colors.black12),
            boxShadow: [
              BoxShadow(
                offset: const Offset(5, 6),
                blurRadius: 10,
                color: Colors.black.withOpacity(0.1),
              ),
            ],
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
                      borderRadius: BorderRadius.circular(Get.height / 80),
                      color: controller.notifier.getimagBgColor,
                      image: DecorationImage(
                        image:
                            AssetImage(controller.homeController.topspecialistdrphotos[index]),
                        fit: BoxFit.cover,
                      ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: Get.height / 30,
                              width: Get.width / 2.4,
                              padding: EdgeInsets.symmetric(
                                horizontal: Get.width / 40,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFC8DCFA),
                                borderRadius:
                                    BorderRadius.circular(Get.height / 20),
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
                            Obx(
                              () => GestureDetector(
                                onTap: () {
                                  controller.homeController.topspecialistlikebutton(index);
                                },
                                child: controller.homeController.topspefavphotos.contains(
                                            controller.homeController.topspecialistdrphotos[
                                                index]) !=
                                        true
                                    ? SvgPicture.asset(
                                        "assets/images/heartoutlineIcon.svg",
                                        height: Get.height / 30,
                                        color: Colors.grey,
                                      )
                                    : SvgPicture.asset(
                                        "assets/images/heartIcon.svg",
                                        height: Get.height / 30,
                                        color: const Color(0xff0165FC),
                                      ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          controller.homeController.topsecialistdname[index],
                          style: TextStyle(
                            fontSize: Get.height / 55,
                            fontWeight: FontWeight.w500,
                            color: controller.notifier.text,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Obx(
                                    () => SmoothStarRating(
                                      allowHalfRating: true,
                                      size: Get.height / 45,
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
                                  Obx(
                                    () => Text(
                                      controller.rating.toStringAsFixed(1),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: Get.height / 65,
                                        color: controller.notifier.text,
                                      ),
                                    ),
                                  ),
                                  VerticalDivider(
                                    color: controller.notifier.getfillborder,
                                    indent: Get.width / 90,
                                    endIndent: Get.width / 90,
                                  ),
                                  Text(
                                    "49 Reviewers",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: Get.height / 55,
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
              SizedBox(
                width: Get.width,
                height: Get.height / 20,
                child: CustomButton(
                  text: "Make Appointment",
                  onPressed: () {
                    Get.toNamed(Routes.DOCTOR_DETAILS, arguments: {
                      "image": controller.homeController.topspecialistdrphotos[index],
                      "name": controller.homeController.topsecialistdname[index],
                    });
                  },
                  color: const Color(0xFFC8DCFA),
                  textcolor: const Color(0xff0165FC),
                  radius: BorderRadius.circular(Get.height / 70),
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: Get.height / 70);
      },
    ),
    );
  }
}
