import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreenController extends GetxController
    with SingleGetTickerProviderMixin {
  late ColorNotifier notifier;

  final TextEditingController searchController = TextEditingController();

  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }
}
