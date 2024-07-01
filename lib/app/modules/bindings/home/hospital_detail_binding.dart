import 'package:doctor_appointment/app/modules/controllers/home/doctor_details_controller.dart';
import 'package:get/get.dart';

import '../../controllers/auth/profile_info_add_screen_controller.dart';
import '../../controllers/home/hospital_detail_controller.dart';

class HospitalDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HospitalDetailController>(
      () => HospitalDetailController(),
    );
    Get.put<DoctorDetailsController>(
      DoctorDetailsController(),
    );
    Get.put<ProfileInfoAddScreenController>(
      ProfileInfoAddScreenController(),
    );
  }
}
