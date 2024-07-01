import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/home_controller.dart';

class FavoritesScreenController extends GetxController
    with SingleGetTickerProviderMixin {
  late ColorNotifier notifier;

  late TabController tabController;

  
  final HomeController homeController = Get.find<HomeController>();

  final _rating = 4.8.obs;
  double get rating => _rating.value;
  set rating(double value) => _rating.value = value;

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
