import 'package:get/get.dart';

import '../../controllers/bookings/cancle_booking_controller.dart';

class CancleBookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CancleBookingController>(
      () => CancleBookingController(),
    );
  }
}
