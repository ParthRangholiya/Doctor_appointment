import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home/doctor_details_controller.dart';

class ClinicimageView extends GetView<DoctorDetailsController> {
  const ClinicimageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: controller.clinic.length,
      padding: EdgeInsets.symmetric(horizontal: Get.width / 25),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: Get.width / 50,
        mainAxisSpacing: Get.height / 90,
        mainAxisExtent: Get.height / 5,
      ),
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(Get.width / 40),
          child: Image.asset(
            controller.clinic[index],
            fit: BoxFit.cover,
            width: Get.width / 2.2,
            height: Get.width / 2.2,
          ),
        );
      },
    );
  }
}
