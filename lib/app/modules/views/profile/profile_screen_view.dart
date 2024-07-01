import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../routes/app_pages.dart';
import '../../controllers/profile/profile_screen_controller.dart';

class ProfileScreenView extends GetView<ProfileScreenController> {
  const ProfileScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      appBar: AppBar(
        backgroundColor: controller.notifier.getBgColor,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Profile',
          style: TextStyle(
            color: controller.notifier.text,
            fontSize: Get.height / 40,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width / 50),
            child: CupertinoSwitch(
              value: controller.notifier.isDark,
              activeColor: const Color(0xFF0165FC),
              onChanged: (value) {
                controller.notifier.setIsDark = value;
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width / 25,
          vertical: Get.height / 40,
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                child: Container(
                  padding: EdgeInsets.all(Get.height / 30),
                  height: Get.height / 5.5,
                  decoration: BoxDecoration(
                    color: controller.notifier.isDark
                        ? const Color(0xff161616)
                        : Colors.black12,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    "assets/images/user.png",
                    color: Colors.grey,
                    height: Get.height / 10,
                  ),
                ),
              ),
              SizedBox(height: Get.height / 50),
              Text(
                "Esther Howard",
                style: TextStyle(
                  fontSize: Get.height / 40,
                  color: controller.notifier.text,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: Get.height / 50),
              ListView.separated(
                itemCount: controller.leadingicon.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (index == 1) {
                        Get.toNamed(
                          Routes.PAYMENT_METHODS,
                          arguments: {"boolean": true},
                        );
                      } else if (index == 6) {
                        showbottomsheetsLogout(context);
                      } else {
                        Get.toNamed(controller.routes[index]);
                      }
                    },
                    child: SizedBox(
                      height: Get.height / 20,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  controller.leadingicon[index],
                                  height: Get.height / 45,
                                  color: const Color(0xFF0165FC),
                                ),
                                SizedBox(width: Get.width / 30),
                                Text(
                                  controller.titletext[index],
                                  style: TextStyle(
                                    color: controller.notifier.text,
                                    fontSize: Get.height / 50,
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: const Color(0xFF0165FC),
                              size: Get.height / 45,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(color: controller.notifier.getfillborder);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
