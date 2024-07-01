import 'package:doctor_appointment/app/modules/views/home/doctor_details/clinicimage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../controllers/home/hospital_detail_controller.dart';

class GalleryTabview extends GetView<HospitalDetailController> {
  const GalleryTabview({super.key});

  @override
  Widget build(BuildContext context) {
    controller.profileInfoAddController.notifier =
        Provider.of(context, listen: true);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Get.width / 25,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Gallery ",
                    style: TextStyle(
                      color: controller.profileInfoAddController.notifier.text,
                      fontSize: Get.height / 45,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    " (400)",
                    style: TextStyle(
                      color: const Color(0xFF0165FC),
                      fontSize: Get.height / 45,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  controller.profileInfoAddController.showimagepicker(context);
                },
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/add-image.png",
                      color: const Color(0xFF0165FC),
                      height: Get.height / 50,
                    ),
                    Text(
                      " add photo",
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
        SizedBox(height: Get.height / 50),
        const ClinicimageView(),
      ],
    );
  }
}
