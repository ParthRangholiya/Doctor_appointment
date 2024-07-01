import 'package:doctor_appointment/app/routes/app_pages.dart';
import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreenController extends GetxController {
  late ColorNotifier notifier;

  PageController pageController = PageController();

  final _activePage = 0.obs;
  int get activePage => _activePage.value;
  set activePage(int value) => _activePage.value = value;

  final _image = [
    "assets/images/rxdoctor.png",
    "assets/images/appoinment.png",
    "assets/images/doctors.png",
  ].obs;
  List<String> get image => _image;
  set image(List<String> value) => _image.value = value;

  final _text = [
    "Discover Experienced Docotrs",
    "Effortless Appointment Booking",
    "Learn About Your Docotrs",
  ].obs;
  List<String> get text => _text;
  set text(List<String> value) => _text.value = value;

  onPageChnage(int index) {
    activePage = index;
  }

  void controllervalueincrement() {
    if (activePage <= 1) {
      pageController.animateToPage(
        activePage + 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      Get.toNamed(Routes.SIGN_IN);
    }
  }

  void controllervaluedecrement() {
    if (activePage > 0) {
      pageController.animateToPage(
        activePage - 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}
