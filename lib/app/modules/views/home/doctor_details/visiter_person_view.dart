import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../controllers/home/doctor_details_controller.dart';

class VisiterPersonView extends GetView<DoctorDetailsController> {
  const VisiterPersonView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: controller.daletext.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width / 25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: Get.height / 18,
                            width: Get.height / 18,
                            padding: EdgeInsets.all(Get.width / 45),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: controller.notifier.getimagBgColor,
                            ),
                            child: Image.asset(
                              "assets/images/user.png",
                              color: controller.notifier.text,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: SvgPicture.asset(
                              "assets/images/shieldtrustIcon.svg",
                              height: Get.height / 50,
                              color: const Color(0xff0165FC),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: Get.width / 50),
                      Text(
                        controller.daletext[index],
                        style: TextStyle(
                          color: controller.notifier.text,
                          fontSize: Get.height / 40,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/starIcon.png",
                            height: Get.height / 45,
                            color: Colors.amber,
                          ),
                          Text(
                            "5.0",
                            style: TextStyle(
                              color: controller.notifier.text,
                              fontSize: Get.height / 50,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "11 months ago",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: Get.height / 60,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: Get.height / 60,
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: Get.height / 70),
          child: Divider(
            color: controller.notifier.getfillborder,
          ),
        );
      },
    );
  }
}
