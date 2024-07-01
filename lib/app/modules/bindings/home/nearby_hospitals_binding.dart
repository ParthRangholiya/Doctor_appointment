import 'package:get/get.dart';

import '../../controllers/home/nearby_hospitals_controller.dart';

class NearbyHospitalsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NearbyHospitalsController>(
      () => NearbyHospitalsController(),
    );
  }
}
