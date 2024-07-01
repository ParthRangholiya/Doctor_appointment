import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  late ColorNotifier notifier;

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  final _password = true.obs;
  bool get password => _password.value;
  set password(bool value) => _password.value = value;

  final _signinmethodelogo = [
    "assets/images/applelogo.png",
    "assets/images/google_logo.png",
    "assets/images/facebooklogo.png",
  ].obs;
  List<String> get signinmethodelogo => _signinmethodelogo;
  set signinmethodelogo(List<String> value) => _signinmethodelogo.value = value;
}
