import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../widgets/buttons.dart';
import '../../../controllers/home/hospital_detail_controller.dart';

class SliverappbarView extends GetView<HospitalDetailController> {
  const SliverappbarView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
              if (controller.homeController.nearbyhospitalspotos
                  .contains(controller.himage)) {
                controller.homeController.nearbyhospitalspotos
                    .remove(controller.himage);
                controller.homeController.nearbyhospitalsname
                    .remove(controller.hname);
              } else {
                controller.homeController.nearbyhospitalspotos
                    .add(controller.himage);
                controller.homeController.nearbyhospitalsname
                    .add(controller.hname);
              }
            },
            child: Container(
              padding: EdgeInsets.all(Get.width / 55),
              decoration: BoxDecoration(
                color: controller.profileInfoAddController.notifier.getBgColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: controller.homeController.nearbyhospitalspotos
                      .contains(controller.himage)
                  ? SvgPicture.asset(
                      "assets/images/heartIcon.svg",
                      color: const Color(0xff0165FC),
                    )
                  : SvgPicture.asset(
                      "assets/images/heartoutlineIcon.svg",
                      color: controller.profileInfoAddController.notifier.text,
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
              controller.himage ,
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
                color: controller.profileInfoAddController.notifier.getBgColor,
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
    );
  }
}
