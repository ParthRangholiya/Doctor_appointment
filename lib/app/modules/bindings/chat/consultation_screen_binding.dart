import 'package:get/get.dart';

import '../../controllers/chat/consultation_screen_controller.dart';

class ConsultationScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConsultationScreenController>(
      () => ConsultationScreenController(),
    );
  }
}
