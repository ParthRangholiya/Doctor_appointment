import 'package:get/get.dart';

import '../../controllers/home/top_specialist_controller.dart';

class TopSpecialistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopSpecialistController>(
      () => TopSpecialistController(),
    );
  }
}
