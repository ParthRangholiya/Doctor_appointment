import 'package:get/get.dart';

import '../../controllers/auth/profile_info_add_screen_controller.dart';
import '../../controllers/profile/your_profile_controller.dart';

class YourProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<YourProfileController>(
      () => YourProfileController(),
    );
    Get.lazyPut<ProfileInfoAddScreenController>(
      () => ProfileInfoAddScreenController(),
    );
  }
}
