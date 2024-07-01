import 'package:get/get.dart';

import '../../controllers/home/location_done_controller.dart';

class LocationDoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationDoneController>(
      () => LocationDoneController(),
    );
  }
}
