import 'package:get/get.dart';

import '../../controllers/auth/new_password_screen_controller.dart';

class NewPasswordScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewPasswordScreenController>(
      () => NewPasswordScreenController(),
    );
  }
}
