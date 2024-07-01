import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:get/get.dart';

class MyAppointmentController extends GetxController {
  late ColorNotifier notifier;

  final profile = Get.arguments["profile"];
  final doctor = Get.arguments["doctor"];

  List appointmentdata = [
    "Date",
    "Time",
    "Booking for",
    "Full Name",
    "Gender",
    "Age",
    "Problem",
  ].obs;

  List appointmentdatavalue = [
    "August 24, 2023",
    "10:00 - 10:30(30mintes)",
    "self",
    "Esther Howard",
    "Male",
    "27",
    "Lorem Ipsum dolor",
  ].obs;
}
