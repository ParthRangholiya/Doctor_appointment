import 'package:doctor_appointment/app/routes/app_pages.dart';
import 'package:doctor_appointment/widgets/buttons.dart';
import 'package:doctor_appointment/widgets/bottombar_widget.dart';
import 'package:doctor_appointment/widgets/google_map_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../controllers/home/get_direction_controller.dart';

class GetDirectionView extends GetView<GetDirectionController> {
  const GetDirectionView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);

    return Scaffold(
      bottomNavigationBar: MyBottomBar(
        context,
        "Start",
        () {
          Get.toNamed(Routes.LOCATION_DONE);
        },
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          const GoogleMapWidget(
            tiltGesturesEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: false,
            zoom: 13,
          ),
          Positioned(
            top: Get.height / 20,
            left: Get.width / 30,
            child: SizedBox(
              height: Get.height / 15,
              width: Get.height / 15,
              child: MyBackButtons(context),
            ),
          ),
          Positioned(
            top: Get.height / 16,
            child: Text(
              'Get Direction',
              style: TextStyle(
                color: Colors.black,
                fontSize: Get.height / 40,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
