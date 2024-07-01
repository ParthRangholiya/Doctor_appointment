import 'package:get/get.dart';

import '../../controllers/home/book_appointment_controller.dart';

class BookAppointmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookAppointmentController>(
      () => BookAppointmentController(),
    );
  }
}
