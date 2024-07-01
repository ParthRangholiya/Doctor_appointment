import 'package:get/get.dart';

import '../../../controllers/bookings/review/doctor_review_screen_controller.dart';

class DoctorReviewScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorReviewScreenController>(
      () => DoctorReviewScreenController(),
    );
  }
}
