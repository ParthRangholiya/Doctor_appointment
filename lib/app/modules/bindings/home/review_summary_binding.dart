import 'package:get/get.dart';

import '../../controllers/home/book_appointment_controller.dart';
import '../../controllers/home/review_summary_controller.dart';

class ReviewSummaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewSummaryController>(
      () => ReviewSummaryController(),
    );
    Get.lazyPut<BookAppointmentController>(
      () => BookAppointmentController(),
    );
  }
}
