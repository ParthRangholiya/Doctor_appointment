import 'package:doctor_appointment/widgets/google_map_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../routes/app_pages.dart';
import '../../../controllers/home/doctor_details_controller.dart';

class AddressView extends GetView<DoctorDetailsController> {
  const AddressView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Address",
              style: TextStyle(
                color: controller.notifier.text,
                fontSize: Get.height / 40,
              ),
            ),
            GestureDetector(
              onTap: () => Get.toNamed(Routes.GET_DIRECTION),
              child: Text(
                "View on Map",
                style: TextStyle(
                  color: const Color(0xff0165FC),
                  fontSize: Get.height / 55,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        Divider(
          color: controller.notifier.getfillborder,
        ),
        Row(
          children: [
            Image.asset(
              "assets/images/location-pin-outline.png",
              color: const Color(0xff0165FC),
              height: Get.height / 50,
            ),
            Text(
              " 8502 Preston Rd. Inglewood, Maine 98380",
              style: TextStyle(
                color: controller.notifier.text,
                fontSize: Get.height / 55,
              ),
            ),
          ],
        ),
        SizedBox(height: Get.height / 80),
        SizedBox(
          height: Get.height / 3.5,
          width: Get.width,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Get.width / 30),
            child: const GoogleMapWidget(
              zoomGesturesEnabled: true,
              tiltGesturesEnabled: true,
              zoomControlsEnabled: false,
              zoom: 15,
            ),
          ),
        ),
      ],
    );
  }
}
