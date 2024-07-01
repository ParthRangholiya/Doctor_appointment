import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NewPasswordScreenController extends GetxController {
  late ColorNotifier notifier;

  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmPasswordcontroller = TextEditingController();

  final _newpassword = false.obs;
  bool get newpassword => _newpassword.value;
  set newpassword(bool value) => _newpassword.value = value;

  final _confirmpassword = false.obs;
  bool get confirmpassword => _confirmpassword.value;
  set confirmpassword(bool value) => _confirmpassword.value = value;
}
