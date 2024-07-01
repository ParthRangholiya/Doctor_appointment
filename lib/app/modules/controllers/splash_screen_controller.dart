import 'dart:async';

import 'package:doctor_appointment/app/routes/app_pages.dart';
import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  late ColorNotifier notifier;

  @override
  void onInit() {
    weregoto();
    super.onInit();
  }

  void weregoto() {
    Timer(
      const Duration(seconds: 5),
      () {
        Get.offAllNamed(Routes.WELCOME_SCREEN);
      },
    );
  }
}
