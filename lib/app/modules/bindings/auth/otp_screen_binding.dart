import 'package:get/get.dart';

import '../../controllers/auth/otp_screen_controller.dart';

class OtpScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpScreenController>(
      () => OtpScreenController(),
    );
  }
}
