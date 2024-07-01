import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../controllers/profile/help_center_controller.dart';

class ContactusTabView extends GetView<HelpCenterController> {
  const ContactusTabView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      body: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(
          horizontal: Get.width / 25,
          vertical: Get.height / 40,
        ),
        itemCount: controller.contactusleading.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Get.width / 40),
              border: Border.all(
                color: controller.notifier.getfillborder,
              ),
            ),
            child: Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                childrenPadding: EdgeInsets.symmetric(
                  horizontal: Get.width / 30,
                ),
                leading: Image.asset(
                  controller.contactusleading[index],
                  color: const Color(0xFF0165FC),
                  height: Get.height / 40,
                ),
                trailing: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Color(0xFF0165FC),
                ),
                title: Text(
                  controller.contactustitle[index],
                  style: TextStyle(
                    fontSize: Get.height / 67,
                    fontWeight: FontWeight.w500,
                    color: controller.notifier.text,
                  ),
                ),
                children: [
                  Divider(color: controller.notifier.getfillborder),
                  Row(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: Get.height / 70),
                        child: Text(
                          controller.contactustext[index],
                          textAlign: TextAlign.start,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: Get.height / 70);
        },
      ),
    );
  }
}
