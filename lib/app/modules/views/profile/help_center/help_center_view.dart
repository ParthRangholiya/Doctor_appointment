import 'package:doctor_appointment/app/modules/views/profile/help_center/contactus_tab_view.dart';
import 'package:doctor_appointment/app/modules/views/profile/help_center/faq_tab_view.dart';
import 'package:doctor_appointment/widgets/buttons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../routes/app_pages.dart';
import '../../../controllers/profile/help_center_controller.dart';

class HelpCenterView extends GetView<HelpCenterController> {
  const HelpCenterView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.height / 5),
        child: AppBar(
          backgroundColor: controller.notifier.getBgColor,
          leading: MyBackButtons(context),
          title: Text(
            'Help Center',
            style: TextStyle(
              color: controller.notifier.text,
              fontSize: Get.height / 40,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          flexibleSpace: SizedBox(
            height: Get.height / 6,
            width: Get.width,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.SEARCH_SCREEN);
                    },
                    child: Container(
                      width: Get.width / 1.3,
                      height: Get.height / 20,
                      padding: EdgeInsets.symmetric(horizontal: Get.width / 70),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Get.height / 90),
                        border: Border.all(
                          color: controller.notifier.getfillborder,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/searchIcon.png",
                              color: const Color(0xFF0165FC),
                              height: Get.height / 35,
                            ),
                            SizedBox(width: Get.width / 80),
                            Text(
                              "Search",
                              style: TextStyle(
                                fontSize: Get.height / 55,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottom: TabBar(
            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
            indicatorColor: const Color(0xff0165FC),
            controller: controller.tabController,
            labelColor: const Color(0xFF0165FC),
            dividerColor: controller.notifier.getfillborder,
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: TextStyle(
              fontSize: Get.height / 60,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
            tabs: const [
              Tab(child: Text("FAQ", overflow: TextOverflow.ellipsis)),
              Tab(child: Text("Contact Us", overflow: TextOverflow.ellipsis)),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: const [
          FaqTabView(),
          ContactusTabView(),
        ],
      ),
    );
  }
}
