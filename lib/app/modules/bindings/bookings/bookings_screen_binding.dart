import 'package:get/get.dart';

import '../../controllers/bookings/bookings_screen_controller.dart';

class BookingsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookingsScreenController>(
      () => BookingsScreenController(),
    );
  }
}
