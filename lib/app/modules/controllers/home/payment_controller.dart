import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:get/get.dart';

import 'book_appointment_controller.dart';

class PaymentController extends GetxController {
  late ColorNotifier notifier;

   BookAppointmentController bookAppointmentController =
      Get.find<BookAppointmentController>();

  List<String> text = ["Esther Howard", "\$20", "16 Aug, 2023", "10:00 Am"].obs;

  List<String> imag = [
    "assets/images/user.png",
    "assets/images/dollar.png",
    "assets/images/calendar.png",
    "assets/images/clockoutlineIcon.png",
  ].obs;
}
