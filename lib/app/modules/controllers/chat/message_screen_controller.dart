import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:get/get.dart';

class MessageScreenController extends GetxController {
  late ColorNotifier notifier;

  final drprofile = Get.arguments["drprofile"];
  final drname = Get.arguments["drname"];
}
