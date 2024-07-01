import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:get/get.dart';

class DoctorReviewScreenController extends GetxController {
  late ColorNotifier notifier;

   final _rating = 5.0.obs;
  double get rating => _rating.value;
  set rating(double value) => _rating.value = value;
}
