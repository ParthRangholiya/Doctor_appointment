import 'package:doctor_appointment/app/modules/controllers/auth/profile_info_add_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HospitalDetailController extends GetxController
    with SingleGetTickerProviderMixin {
  late TabController tabController;

  final ProfileInfoAddScreenController profileInfoAddController =
      Get.find<ProfileInfoAddScreenController>();

  @override
  void onInit() {
    tabController = TabController(length: 5, vsync: this);
    super.onInit();
  }

  final String himage = Get.arguments["himage"];
  final String hname = Get.arguments["hname"];

  final HomeController homeController = Get.find<HomeController>();

  var initialindex = 0.obs;

  List hospitalfacilitiesImage = [
    "assets/images/globe.png",
    "assets/images/reviewIcon.png",
    "assets/images/phoneIcon.png",
    "assets/images/unitedstate.png",
    "assets/images/sendIcon.png",
  ].obs;

  List hospitalfacilitiesName = [
    "Website",
    "Message",
    "Call",
    "Direction",
    "Share",
  ].obs;

  List tabbarTitle = [
    "Treatments",
    "Specialist",
    "Gallery",
    "Review",
    "About",
  ].obs;

  List treatmentTitle = ["Dental", "Skin Care", "Eye Care"].obs;

  var selecttreatment = 0.obs;

  void changeSelecttreatment(int index) {
    selecttreatment.value = index;
  }
}
