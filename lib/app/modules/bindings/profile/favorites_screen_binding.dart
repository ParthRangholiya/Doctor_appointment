import 'package:get/get.dart';

import '../../controllers/profile/favorites_screen_controller.dart';

class FavoritesScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoritesScreenController>(
      () => FavoritesScreenController(),
    );
  }
}
