import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:get/get.dart';

class OtpScreenController extends GetxController {
  late ColorNotifier notifier;

  final String? email = Get.arguments["email"];
  final String? password = Get.arguments["password"];
}
