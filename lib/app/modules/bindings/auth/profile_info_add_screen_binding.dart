import 'package:get/get.dart';

import '../../controllers/auth/profile_info_add_screen_controller.dart';

class ProfileInfoAddScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileInfoAddScreenController>(
      () => ProfileInfoAddScreenController(),
    );
  }
}
