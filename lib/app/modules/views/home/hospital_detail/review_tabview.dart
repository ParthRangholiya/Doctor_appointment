import 'package:doctor_appointment/app/modules/views/home/doctor_details/reviews_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../doctor_details/clinicimage.dart';
import '../doctor_details/visiter_person_view.dart';
import '../../../controllers/home/hospital_detail_controller.dart';

class ReviewTabview extends GetView<HospitalDetailController> {
  const ReviewTabview({super.key});

  @override
  Widget build(BuildContext context) {
    controller.profileInfoAddController.notifier = Provider.of(context, listen: true);
    return Column(
      children: [
        //  doctor Review Information
        const ReviewsView(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: Get.height / 70),
          child: Divider(
            color: controller.profileInfoAddController.notifier.getfillborder,
          ),
        ),

        //  doctor Visiter Person Information
        const VisiterPersonView(),
        SizedBox(height: Get.height / 50),
        const ClinicimageView(),
      ],
    );
  }
}
