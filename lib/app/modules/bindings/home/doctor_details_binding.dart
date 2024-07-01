import 'package:get/get.dart';

import '../../controllers/home/home_controller.dart';
import '../../controllers/home/doctor_details_controller.dart';

class DoctorDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorDetailsController>(
      () => DoctorDetailsController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
