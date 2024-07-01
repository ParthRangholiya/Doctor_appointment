import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'filter_screen_controller.dart';

class HomeController extends GetxController {
  late ColorNotifier notifier;

  TextEditingController searchcontroller = TextEditingController();
  final FilterScreenController filterScreenController =
      Get.put(FilterScreenController());

  final _rating = 4.8.obs;
  double get rating => _rating.value;
  set rating(double value) => _rating.value = value;

  List specialitytext = [
    "Dentist",
    "Cardiologist",
    "Orthopedic",
    "Neurological",
  ].obs;

  List doctorSpeciality = [
    "assets/images/dentistIcon.png",
    "assets/images/cardiologyIcon.png",
    "assets/images/orthopedicIcon.png",
    "assets/images/neurologicalIcon.png",
  ].obs;

  List hospitalstext = [
    "ElevateDental",
    "DentaCare Clinic",
    "ElevateDental",
    "DentaCare Clinic",
  ].obs;

  List hospitaltime = [
    "15 min, 1.5km",
    "10 min, 2.5km",
    "15 min, 1.5km",
    "10 min, 2.5km",
  ].obs;

  List nearbyhospitalsname = [].obs;
  List nearbyhospitalspotos = [].obs;

  List nearbyhospitals = [
    "assets/images/dentalhospital.jpg",
    "assets/images/Dental-Clinic02.jpg",
    "assets/images/dentacareclinic.jpg",
    "assets/images/elevatedental.jpg",
  ].obs;

  List topsecialistdname = [
    "Dr. Jane Cooper",
    "Dr. Robert Fox",
    "Dr. Jacob Jones",
    "Dr. Carla Schoen",
    "Dr. Armoando Ferry",
    "Dr. Jane Cooper",
    "Dr. Carla Schoen",
  ].obs;

  List topspefavname = [].obs;
  List topspefavphotos = [].obs;

  List topspecialistdrphotos = [
    "assets/images/drJacobJones.jpg",
    "assets/images/drRobertFox.jpg",
    "assets/images/drJaneCooper.png",
    "assets/images/images.png",
    "assets/images/doctor1.png",
    "assets/images/doctor2.png",
    "assets/images/dranshul.png",
  ].obs;

  void nearbyhospitalslickebuttton(int index) {
    if (nearbyhospitalspotos.contains(nearbyhospitals[index]) != true) {
      nearbyhospitalspotos.add(nearbyhospitals[index]);
      nearbyhospitalsname.add(hospitalstext[index]);
    }
  }

  void topspecialistlikebutton(int index) {
    if (topspefavphotos.contains(topspecialistdrphotos[index]) != true) {
      topspefavphotos.add(topspecialistdrphotos[index]);
      topspefavname.add(topsecialistdname[index]);
    }
  }
}
