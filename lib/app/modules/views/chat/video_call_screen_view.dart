import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../routes/app_pages.dart';
import '../../controllers/chat/video_call_screen_controller.dart';

class VideoCallScreenView extends GetView<VideoCallScreenController> {
  const VideoCallScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.CONSULTATION_SCREEN),
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Get.width / 4),
        ),
        child: const Icon(
          Icons.call_end,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: Get.width / 15),
        color: const Color(0xFF0165FC),
        height: Get.height / 10,
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: Get.height / 18,
                  width: Get.height / 18,
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(Get.width / 40),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.volume_up,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: Get.width / 30),
                Container(
                  height: Get.height / 18,
                  width: Get.height / 18,
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(Get.width / 40),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.mic_off,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: Get.height / 18,
                  width: Get.height / 18,
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(Get.width / 40),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.videocam_off_sharp,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: Get.width / 30),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    height: Get.height / 18,
                    width: Get.height / 18,
                    padding: EdgeInsets.all(Get.width / 70),
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(Get.width / 40),
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/images/reviewIcon.png",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'VideoCallScreenView is working',
          style: TextStyle(
            fontSize: 20,
            color: controller.notifier.text,
          ),
        ),
      ),
    );
  }
}
