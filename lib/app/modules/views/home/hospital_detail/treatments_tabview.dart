import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../controllers/home/hospital_detail_controller.dart';

class TreatmentsTabview extends GetView<HospitalDetailController> {
  const TreatmentsTabview({super.key});

  @override
  Widget build(BuildContext context) {
    controller.profileInfoAddController.notifier =
        Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: controller.profileInfoAddController.notifier.getBgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Get.width / 25,
            ),
            child: Row(
              children: [
                Text(
                  "Treatments",
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
          ListView.separated(
            itemCount: controller.treatmentTitle.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: Get.width / 25,
              vertical: Get.height / 80,
            ),
            itemBuilder: (context, index) {
              return Container(
                height: Get.height / 20,
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: Get.width / 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Get.width / 50),
                  border: Border.all(
                    color: controller
                        .profileInfoAddController.notifier.getfillborder,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.treatmentTitle[index],
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: Get.height / 55,
                      ),
                    ),
                    Obx(
                      () => Radio(
                        activeColor: const Color(0xFF0165FC),
                        value: index,
                        groupValue: controller.selecttreatment.value,
                        onChanged: (value) {
                          controller.changeSelecttreatment(index);
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: Get.height / 50);
            },
          ),
        ],
      ),
    );
  }
}
