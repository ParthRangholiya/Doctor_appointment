import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterScreenController extends GetxController {
  late ColorNotifier notifier;

  var currentRangeValues = const SfRangeValues(30, 60).obs;

  @override
  void onInit() {
    selectdrspecialty = doctorspecialty[0];
    super.onInit();
  }

  final _rating = 5.0.obs;
  double get rating => _rating.value;
  set rating(double value) => _rating.value = value;

  final _selectdrspecialty = ''.obs;
  get selectdrspecialty => _selectdrspecialty.value;
  set selectdrspecialty(value) => _selectdrspecialty.value = value;

  var selectreviews = 0.obs;

  final _swich = false.obs;
  bool get swich => _swich.value;
  set swich(bool value) => _swich.value = value;

  List ratings = [4.5, 4.0, 3.0, 2.0, 1.0].obs;

  List doctorspecialty = [
    "All",
    "General",
    "Dentist",
    "Cardiologist",
    "Orthopedic",
    "Neurological",
  ].obs;

  List reviews = [
    "4.5 and above",
    "4.0 - 4.5",
    "3.5 - 4.0",
    "3.0 - 3.5",
    "2.5 - 3.0",
  ].obs;

  void updatespecialty(value) {
    selectdrspecialty = value.toString();
    debugPrint("---------------------$selectdrspecialty--------------------");
  }

  void updateviews(value) {
    selectreviews.value = value;
    debugPrint("---------------------$selectreviews--------------------");
  }
}
