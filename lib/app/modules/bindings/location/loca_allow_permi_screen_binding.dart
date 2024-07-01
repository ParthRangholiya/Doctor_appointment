import 'package:get/get.dart';

import '../../controllers/location/loca_allow_permi_screen_controller.dart';

class LocaAllowPermiScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocaAllowPermiScreenController>(
      () => LocaAllowPermiScreenController(),
    );
  }
}
