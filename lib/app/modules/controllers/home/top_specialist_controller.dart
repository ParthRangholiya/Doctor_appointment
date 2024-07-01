import 'package:doctor_appointment/app/modules/controllers/home/home_controller.dart';
import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopSpecialistController extends GetxController {
  late ColorNotifier notifier;

  final HomeController homeController = Get.find<HomeController>();

  final _rating = 4.8.obs;
  double get rating => _rating.value;
  set rating(double value) => _rating.value = value;

  List topspecialist = [
    "All",
    "Dentist",
    "Cardiologist",
    "Neurological",
    "Orthopedic",
  ].obs;

  List drprofiles = [
    
  ].obs;

  List topspecialistselect = [].obs;

  addlistdrtypes(int index) {
    if (topspecialistselect.contains(index)) {
      topspecialistselect.remove(index);
      debugPrint("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-remove$topspecialistselect");
    } else {
      topspecialistselect.add(index);
      debugPrint("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-add$topspecialistselect");
    }
  }
}
