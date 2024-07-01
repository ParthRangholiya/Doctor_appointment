import 'package:get/get.dart';

import '../../controllers/location/add_manu_loca_screen_controller.dart';

class AddManuLocaScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddManuLocaScreenController>(
      () => AddManuLocaScreenController(),
    );
  }
}
