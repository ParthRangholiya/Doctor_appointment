import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:get/get.dart';

import 'book_appointment_controller.dart';

class ReviewSummaryController extends GetxController {


  BookAppointmentController bookAppointmentController =
      Get.find<BookAppointmentController>();
  late ColorNotifier notifier;

  List<String> reviewtitle = [
    "Date & Hour",
    "Package",
    "Duration",
    "Booking for",
    "Amount",
    "Duration (30 mins)",
    "Duration",
    "Total",
  ].obs;

  List<String> reviewvalue = [
    "August 24,2023 | 10:00 Am",
    "Messaging",
    "30 minutes",
    "Self",
    "\$20",
    "1 × \$20",
    "30 minutes",
    "\$20",
  ].obs;
}
