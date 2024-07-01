import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home/filter_screen_controller.dart';

class ExploreScreenController extends GetxController {
  late ColorNotifier notifier;
  TextEditingController maplocationcontroller = TextEditingController();
  final FilterScreenController filterScreenController =
      Get.put(FilterScreenController());

  final _rating = 5.0.obs;
  double get rating => _rating.value;
  set rating(double value) => _rating.value = value;

  List imag = [
    "assets/images/runningIcons.png",
    "assets/images/Dentist.png",
  ].obs;

  List text = ["3.5km/50min", "Dentist"].obs;
}
