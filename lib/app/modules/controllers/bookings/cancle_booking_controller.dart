import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:get/get.dart';

class CancleBookingController extends GetxController {
  late ColorNotifier notifier;

  var selectReason = 0.obs;

  List cancellationsreason = [
    "Schedule Change",
    "Weather conditions",
    "Uncexpected Work",
    "childcare Issue",
    "Travel Delays",
    "Other",
  ];

  void updateReasonvalues(int value) {
    selectReason.value = value;
  }
}
