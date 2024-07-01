import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../routes/app_pages.dart';
import '../../controllers/chat/chat_screen_controller.dart';

class ChatScreenView extends GetView<ChatScreenController> {
  const ChatScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xFF0165FC),
            elevation: 0,
            expandedHeight: Get.height / 5.6,
            collapsedHeight: Get.height / 15,
            toolbarHeight: Get.height / 15,
            pinned: true,
            floating: true,
            automaticallyImplyLeading: true,
            bottom: PreferredSize(
              preferredSize: const Size(0, 20),
              child: Container(),
            ),
            centerTitle: true,
            title: Text(
              'Chat',
              style: TextStyle(
                color: Colors.white,
                fontSize: Get.height / 40,
                fontWeight: FontWeight.w500,
              ),
            ),
            flexibleSpace: Stack(
              children: [
                SizedBox(
                  width: Get.width,
                  child: ListView(
                    children: [
                      SizedBox(height: Get.height / 11),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Get.width / 25,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.SEARCH_SCREEN);
                          },
                          child: Container(
                            width: Get.width / 1.3,
                            height: Get.height / 20,
                            padding: EdgeInsets.symmetric(
                              horizontal: Get.width / 70,
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Get.height / 90),
                              color: controller.notifier.getBgColor,
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
                                    "Search Doctor",
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
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -2,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: Get.height / 40,
                    decoration: BoxDecoration(
                      color: controller.notifier.getBgColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: Get.height / 15,
                  child: ListView.builder(
                    itemCount: controller.drimages.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: Get.width / 25),
                    itemBuilder: (context, index) {
                      return Container(
                        height: Get.height / 13,
                        width: Get.height / 13,
                        decoration: BoxDecoration(
                          color: controller.notifier.getimagBgColor,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              controller.drimages[index],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.width / 25,
                    vertical: Get.height / 40,
                  ),
                  itemCount: controller.drimages.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: Get.height / 12,
                      width: Get.width,
                      padding: EdgeInsets.symmetric(horizontal: Get.width / 50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Get.width / 40),
                        border: Border.all(
                          color: controller.notifier.getfillborder,
                        ),
                      ),
                      child: ListTile(
                        onTap: () {
                          Get.toNamed(
                            Routes.MESSAGE_SCREEN,
                            arguments: {
                              "drprofile": controller.drimages[index],
                              "drname": controller.drname[index],
                            },
                          );
                        },
                        leading: Stack(
                          children: [
                            Container(
                              height: Get.height / 13,
                              width: Get.height / 13,
                              decoration: BoxDecoration(
                                color: controller.notifier.getimagBgColor,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                    controller.drimages[index],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 3,
                              right: 3,
                              child: Container(
                                width: Get.width / 25,
                                height: Get.width / 25,
                                decoration: BoxDecoration(
                                  color: index == 2 || index == 4
                                      ? Colors.grey.shade300
                                      : index == 6
                                          ? const Color(0xFF0165FC)
                                          : Colors.green,
                                  border: Border.all(
                                    color: controller.notifier.getBgColor,
                                    width: 2,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          controller.drname[index],
                          style: TextStyle(
                            color: controller.notifier.text,
                            fontSize: Get.height / 60,
                          ),
                        ),
                        subtitle: SizedBox(
                          width: Get.width / 2.6,
                          child: Text(
                            controller.subtitle[index],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: Get.height / 70,
                            ),
                          ),
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "09:34PM  ",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: Get.height / 70,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: Get.height / 50);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
