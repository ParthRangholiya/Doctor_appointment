import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:doctor_appointment/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/buttons.dart';
import '../../controllers/chat/message_screen_controller.dart';

class MessageScreenView extends GetView<MessageScreenController> {
  const MessageScreenView({super.key});
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
            expandedHeight: Get.height / 13,
            collapsedHeight: Get.height / 12,
            pinned: true,
            toolbarHeight: Get.height / 15,
            floating: true,
            bottom: PreferredSize(
              preferredSize: const Size(0, 20),
              child: Container(),
            ),
            leading: MyBackButtons(context),
            centerTitle: true,
            titleSpacing: 7,
            title: Row(
              children: [
                Container(
                  height: Get.height / 23,
                  width: Get.height / 23,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        controller.drprofile,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: Get.width / 50),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.drname,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Get.height / 50,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Online",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Get.height / 65,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              GestureDetector(
                onTap: () => Get.toNamed(Routes.VIDEO_CALL_SCREEN),
                child: Container(
                  height: Get.height / 15,
                  margin: EdgeInsets.symmetric(
                    vertical: Get.width / 50,
                    horizontal: Get.width / 35,
                  ),
                  padding: EdgeInsets.all(Get.width / 60),
                  decoration: BoxDecoration(
                    color: controller.notifier.getBgColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.more_vert,
                      color: controller.notifier.text,
                    ),
                  ),
                ),
              ),
            ],
            flexibleSpace: Stack(
              children: [
                Positioned(
                  bottom: -3,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: Get.height / 30,
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
                SingleChildScrollView(
                  child: Column(
                    children: [
                      BubbleSpecialOne(
                        text:
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
                                .tr,
                        tail: false,
                        isSender: false,
                        color: const Color(0xFFE8E8EE),
                        textStyle: TextStyle(
                          fontSize: Get.height / 65,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: Get.height / 95),
                      BubbleSpecialOne(
                        text:
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
                                .tr,
                        color: const Color(0xFF0165FC),
                        textStyle: TextStyle(
                          fontSize: Get.height / 65,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        sent: false,
                        seen: false,
                        delivered: false,
                        tail: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: Get.height / 10,
        width: Get.width,
        child: MessageBar(
          messageBarHintText: "Message".tr,
          messageBarHintStyle: TextStyle(
            fontSize: Get.height / 50,
            fontWeight: FontWeight.w500,
            color: const Color(0xff0165FC),
          ),
          replyCloseColor: const Color(0xFF0165FC),
          messageBarColor: controller.notifier.getimagBgColor,
          actions: [
            Container(
              height: Get.height / 20,
              width: Get.height / 20,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Get.width / 50),
              ),
              child: const Center(
                child: Icon(
                  color: Color(0xFF0165FC),
                  Icons.add,
                ),
              ),
            ),
          ],
          onSend: (p0) {},
          onTapCloseReply: () {},
        ),
      ),
    );
  }
}
