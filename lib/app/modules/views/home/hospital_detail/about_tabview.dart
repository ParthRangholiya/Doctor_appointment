import 'package:doctor_appointment/app/modules/views/home/doctor_details/about_text_view.dart';
import 'package:doctor_appointment/app/modules/views/home/doctor_details/address_view.dart';
import 'package:doctor_appointment/app/modules/views/home/doctor_details/working_hours_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home/hospital_detail_controller.dart';

class AboutTabview extends GetView<HospitalDetailController> {
  const AboutTabview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Get.width / 25,
        vertical: Get.height / 50,
      ),
      child: Column(
        children: [
          const AboutTextView(),
          SizedBox(height: Get.height / 50),
          const WorkingHoursView(),
          SizedBox(height: Get.height / 50),
          const AddressView(),
        ],
      ),
    );
  }
}
