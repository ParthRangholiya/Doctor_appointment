import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class NearbyHospitalsController extends GetxController {
  late ColorNotifier notifier;

  final HomeController homeController = Get.find<HomeController>();

  List nearbyhospital = [
    "All",
    "Dentist",
    "Cardiologist",
    "Skin Care",
    "Neurological",
    "Orthopedic",
  ].obs;

  List nearbyhospitalselect = [].obs;

  addlistnrhostypes(int index) {
    if (nearbyhospitalselect.contains(index)) {
      nearbyhospitalselect.remove(index);
      debugPrint("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-remove$nearbyhospitalselect");
    } else {
      nearbyhospitalselect.add(index);
      debugPrint("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-add$nearbyhospitalselect");
    }
  }
}
