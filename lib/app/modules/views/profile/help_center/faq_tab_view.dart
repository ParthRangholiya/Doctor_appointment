import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../controllers/profile/help_center_controller.dart';

class FaqTabView extends GetView<HelpCenterController> {
  const FaqTabView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Get.height / 40,
          ),
          child: Column(
            children: [
              SizedBox(
                height: Get.height / 22,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: Get.width / 25),
                  itemCount: controller.faq.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Obx(
                      () => GestureDetector(
                        onTap: () {
                          controller.updatedvalue(controller.faq[index]);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: Get.width / 60,
                            horizontal: Get.width / 25,
                          ),
                          decoration: BoxDecoration(
                            color:
                                controller.faq[index] == controller.selectvalue
                                    ? const Color(0xFF0165FC)
                                    : controller.notifier.getimagBgColor,
                            borderRadius:
                                BorderRadius.circular(Get.height / 20),
                          ),
                          child: Center(
                            child: Text(
                              controller.faq[index],
                              style: TextStyle(
                                color: controller.faq[index] ==
                                        controller.selectvalue
                                    ? Colors.white
                                    : Colors.grey,
                                fontSize: Get.height / 55,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: Get.width / 40);
                  },
                ),
              ),
              SizedBox(height: Get.height / 50),
              ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: Get.width / 25),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.titlefaq.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Get.width / 40),
                      border: Border.all(
                        color: controller.notifier.getfillborder,
                      ),
                    ),
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        childrenPadding:
                            EdgeInsets.symmetric(horizontal: Get.width / 25),
                        trailing: const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Color(0xFF0165FC),
                        ),
                        title: Text(
                          controller.titlefaq[index],
                          style: TextStyle(
                            fontSize: Get.height / 67,
                            fontWeight: FontWeight.w500,
                            color: controller.notifier.text,
                          ),
                        ),
                        children: [
                          Divider(
                            color: controller.notifier.getfillborder,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: Get.width / 60),
                            child: const Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                              style: TextStyle(color: Colors.grey),
                            ),
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
            ],
          ),
        ),
      ),
    );
  }
}
