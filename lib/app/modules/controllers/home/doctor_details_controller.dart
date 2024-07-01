import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'home_controller.dart';

class DoctorDetailsController extends GetxController {
  final String? imag = Get.arguments["image"];
  final String? name = Get.arguments["name"];

  final HomeController homeController = Get.find<HomeController>();

  late ColorNotifier notifier;

  TextEditingController searchcontroller = TextEditingController();

  final _isReadMore = false.obs;
  bool get isReadMore => _isReadMore.value;
  set isReadMore(bool value) => _isReadMore.value = value;

  List days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ].obs;

  GoogleMapController? googleMapController;

  // Initial camera position
  final CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(21.2408, 72.8806),
    zoom: 13,
  );

  // Function to handle map creation
  void onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
  }

  @override
  void onClose() {
    googleMapController?.dispose();
    super.onClose();
  }

  var selectedValue = 'Filter'.obs;

  void updateSelectedValue(String value) {
    selectedValue.value = value;
  }

  List<String> items = ["Option 1", "Option 2", "Option 3", "Option 4"].obs;

  List buttontext = [
    "Verified",
    "Latest",
    "With Photos",
    "Verified",
    "Latest",
    "With Photos",
  ].obs;

  List buttonselect = [].obs;

  addlistvalue(int index) {
    if (buttonselect.contains(index)) {
      buttonselect.remove(index);
    } else {
      buttonselect.add(index);
    }
    debugPrint("=====================================$buttonselect");
  }

  List daletext = ["Dale Thiel", "Tiffany Nitzsche"].obs;

  List clinic = [
    "assets/images/clinicimage.jpg",
    "assets/images/clinicimage1.jpg",
    "assets/images/cascades_.jpg",
    "assets/images/hospitalbackground.jpg",
  ].obs;
}
