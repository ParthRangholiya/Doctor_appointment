import 'package:doctor_appointment/app/modules/controllers/home/home_controller.dart';
import 'package:get/get.dart';

import '../../auth/profile_info_add_screen_controller.dart';

class HospitalReviewScreenController extends GetxController {


  final HomeController homeController = Get.find<HomeController>();

  final ProfileInfoAddScreenController profileinfocontroller =
      Get.find<ProfileInfoAddScreenController>();


  final _favrithospi = false.obs;
  bool get favrithospi => _favrithospi.value;
  set favrithospi(bool value) => _favrithospi.value = value;

  final _rating = 5.0.obs;
  double get rating => _rating.value;
  set rating(double value) => _rating.value = value;
}
