import 'package:get/get.dart';

import '../../controllers/home/my_appointment_controller.dart';

class MyAppointmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyAppointmentController>(
      () => MyAppointmentController(),
    );
  }
}
