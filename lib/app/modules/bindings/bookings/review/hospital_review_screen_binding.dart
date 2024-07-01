import 'package:get/get.dart';

import '../../../controllers/auth/profile_info_add_screen_controller.dart';
import '../../../controllers/bookings/review/hospital_review_screen_controller.dart';

class HospitalReviewScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HospitalReviewScreenController>(
      () => HospitalReviewScreenController(),
    );
    Get.lazyPut<ProfileInfoAddScreenController>(
      () => ProfileInfoAddScreenController(),
    );
  }
}
