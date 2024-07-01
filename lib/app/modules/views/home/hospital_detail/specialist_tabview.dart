import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../../widgets/top_specialist_dr_widget.dart';
import '../../../controllers/home/hospital_detail_controller.dart';

class SpecialistTabview extends GetView<HospitalDetailController> {
  const SpecialistTabview({super.key});

  @override
  Widget build(BuildContext context) {
    controller.profileInfoAddController.notifier = Provider.of(context, listen: true);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Get.width / 25,
          ),
          child: Row(
            children: [
              Text(
                "specialist ",
                style: TextStyle(
                  color: controller.profileInfoAddController.notifier.text,
                  fontSize: Get.height / 45,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                " (18)",
                style: TextStyle(
                  color: const Color(0xFF0165FC),
                  fontSize: Get.height / 45,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const TopSpecialistDrWidget(),
      ],
    );
  }
}
