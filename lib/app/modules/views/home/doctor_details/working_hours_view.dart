import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../controllers/home/doctor_details_controller.dart';

class WorkingHoursView extends GetView<DoctorDetailsController> {
  const WorkingHoursView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Working Hours",
          style: TextStyle(
            color: controller.notifier.text,
            fontSize: Get.height / 40,
          ),
        ),
        Divider(
          color: controller.notifier.getfillborder,
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.days.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  controller.days[index],
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: Get.height / 55,
                  ),
                ),
                Text(
                  "00:00 - 00:00",
                  style: TextStyle(
                    color: controller.notifier.text,
                    fontSize: Get.height / 55,
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: Get.height / 70);
          },
        ),
      ],
    );
  }
}
