import 'package:get/get.dart';

import '../../controllers/chat/message_screen_controller.dart';

class MessageScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessageScreenController>(
      () => MessageScreenController(),
    );
  }
}
