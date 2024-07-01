import 'package:doctor_appointment/widgets/nearby_hospital_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/buttons.dart';
import '../../controllers/home/nearby_hospitals_controller.dart';

class NearbyHospitalsView extends GetView<NearbyHospitalsController> {
  const NearbyHospitalsView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.height / 7.2),
        child: Column(
          children: [
            AppBar(
              backgroundColor: controller.notifier.getBgColor,
              title: Text(
                'Nearby Hospitals',
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
                  itemCount: controller.nearbyhospital.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.width / 25,
                  ),
                  itemBuilder: (context, index) {
                    return Obx(
                      () => GestureDetector(
                        onTap: () => controller.addlistnrhostypes(index),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: Get.width / 20.5,
                          ),
                          margin:
                              EdgeInsets.symmetric(vertical: Get.height / 80),
                          decoration: BoxDecoration(
                            color:
                                controller.nearbyhospitalselect.contains(index)
                                    ? const Color(0xff0165FC)
                                    : controller.notifier.getBgColor,
                            borderRadius:
                                BorderRadius.circular(Get.height / 20),
                            border: Border.all(
                              color: controller.nearbyhospitalselect
                                      .contains(index)
                                  ? const Color(0xFF0165FC)
                                  : controller.notifier.getfillborder,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              controller.nearbyhospital[index],
                              style: TextStyle(
                                color: controller.nearbyhospitalselect
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
      body: const NearbyHospitalWidget(),
    );
  }
}
