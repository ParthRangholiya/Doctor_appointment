import 'package:get/get.dart';

import '../../controllers/home/get_direction_controller.dart';

class GetDirectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetDirectionController>(
      () => GetDirectionController(),
    );
  }
}
