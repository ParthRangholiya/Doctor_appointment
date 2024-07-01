import 'package:get/get.dart';

import '../controllers/explore_screen_controller.dart';

class ExploreScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExploreScreenController>(
      () => ExploreScreenController(),
    );
  }
}
