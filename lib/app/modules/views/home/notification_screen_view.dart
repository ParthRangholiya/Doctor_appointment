import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/buttons.dart';
import '../../controllers/home/notification_screen_controller.dart';

class NotificationScreenView extends GetView<NotificationScreenController> {
  const NotificationScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      appBar: AppBar(
        backgroundColor: controller.notifier.getBgColor,
        title: Text(
          'Notification',
          style: TextStyle(
            color: controller.notifier.text,
            fontSize: Get.height / 40,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: MyBackButtons(context),
        actions: [
          Container(
            height: Get.height / 25,
            margin: EdgeInsets.symmetric(horizontal: Get.height / 80),
            padding: EdgeInsets.symmetric(horizontal: Get.height / 80),
            decoration: BoxDecoration(
              color: const Color(0xFF0165FC),
              borderRadius: BorderRadius.circular(Get.height / 40),
            ),
            child: Center(
              child: Text(
                "2 NEW",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Get.height / 55,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Get.width / 40,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width / 25,
                  vertical: Get.width / 50,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "TODAY",
                      style: TextStyle(
                        fontSize: Get.height / 50,
                        color: Colors.grey,
                        letterSpacing: 2,
                      ),
                    ),
                    Text(
                      "Mark all as read",
                      style: TextStyle(
                        fontSize: Get.height / 50,
                        color: const Color(0xFF0165FC),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.separated(
                itemCount: controller.icon.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Container(
                      height: Get.height / 15,
                      width: Get.height / 15,
                      padding: EdgeInsets.all(Get.height / 50),
                      decoration: BoxDecoration(
                        color: index == 0 || index == 2 || index == 5
                            ? Colors.green.shade100
                            : index == 3
                                ? Colors.red.shade100
                                : controller.notifier.getbluelightcolor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(
                          controller.icon[index],
                          color: index == 0 || index == 2 || index == 5
                              ? Colors.green
                              : index == 3
                                  ? Colors.red
                                  : const Color(0xff0165FC),
                        ),
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.text[index],
                          style: TextStyle(
                            fontSize: Get.height / 55,
                            color: controller.notifier.text,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          index <= 2 ? "1h" : "1d",
                          style: TextStyle(
                            fontSize: Get.height / 65,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      controller.subtext[index],
                      style: TextStyle(
                        fontSize: Get.height / 65,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  if (index == 2) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width / 25,
                        vertical: Get.height / 50,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "YESTERDAY",
                            style: TextStyle(
                              fontSize: Get.height / 50,
                              color: Colors.grey,
                              letterSpacing: 2,
                            ),
                          ),
                          Text(
                            "Mark all as read",
                            style: TextStyle(
                              fontSize: Get.height / 50,
                              color: const Color(0xFF0165FC),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: Get.height / 50,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
