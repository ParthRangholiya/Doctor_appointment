import 'package:get/get.dart';

import '../../controllers/profile/help_center_controller.dart';

class HelpCenterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HelpCenterController>(
      () => HelpCenterController(),
    );
  }
}
