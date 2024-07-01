import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  late ColorNotifier notifier;

  List leadingicon = [
    "assets/images/credit-card-outline.png",
    "assets/images/key.png",
    "assets/images/credit-card-outline.png",
  ].obs;

  List titletext=[
    "Notification Settings",
    "Password Manager",
    "Delete Account",
  ].obs;
}


