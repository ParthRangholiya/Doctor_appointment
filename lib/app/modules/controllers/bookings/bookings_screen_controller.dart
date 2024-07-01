import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingsScreenController extends GetxController
    with SingleGetTickerProviderMixin {
  late ColorNotifier notifier;

  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
  }

  List drphotos = [
    "assets/images/drJacobJones.jpg",
    "assets/images/drRobertFox.jpg",
    "assets/images/drJaneCooper.png",
    "assets/images/images.png",
    "assets/images/doctor1.png",
    "assets/images/doctor2.png",
    "assets/images/dranshul.png",
  ].obs;

  List drname = [
    "Dr. Jane Cooper",
    "Dr. Robert Fox",
    "Dr. Jacob Jones",
    "Dr. Carla Schoen",
    "Dr. Armoando Ferry",
    "Dr. Jane Cooper",
    "Dr. Carla Schoen",
  ].obs;

  var switches = <int, bool>{}.obs;

  void toggleSwitch(int index, bool value) {
    switches[index] = value;
  }
}
