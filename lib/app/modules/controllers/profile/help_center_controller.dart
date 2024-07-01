import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpCenterController extends GetxController
    with SingleGetTickerProviderMixin {
  late ColorNotifier notifier;

  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    selectvalue = faq[0];
    super.onInit();
  }

  final _selectvalue = ''.obs;
  get selectvalue => _selectvalue.value;
  set selectvalue(value) => _selectvalue.value = value;

  List faq = [
    "All",
    "Services",
    "General",
    "Accounts",
    "Services",
    "General",
    "Accounts",
  ].obs;

  List titlefaq = [
    "How do I schedule an appointment?",
    "Can I reschedule or cancel appointments?",
    "How do I receive appointment reminders?",
    "How to Checked Pre-Booked Appointment?",
    "How do I play for appointments?",
    "Is telemedicine available through the app?",
    "How to add review?",
  ].obs;

  List contactusleading = [
    "assets/images/headphones-with-mic.png",
    "assets/images/whatsapp.png",
    "assets/images/globe.png",
    "assets/images/facebook.png",
    "assets/images/twitter.png",
    "assets/images/social-media.png",
  ].obs;

  List contactustitle = [
    "Customer Service",
    "WhatsApp",
    "Website",
    "Facebook",
    "Twitter",
    "Instagram",
  ];

  List contactustext = [
    "408-555-0103",
    "(408) 555-0103",
    "www.example.com",
    "www.facebook.com",
    "www.twitter.com",
    "www.instagram.com",
  ].obs;

  void updatedvalue(value) {
    selectvalue = value.toString();
    debugPrint("---------------------$selectvalue--------------------");
  }
}
