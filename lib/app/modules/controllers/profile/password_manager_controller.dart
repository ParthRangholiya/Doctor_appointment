import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordManagerController extends GetxController {
  late ColorNotifier notifier;

  final TextEditingController currentpasswordController =
      TextEditingController();
  final TextEditingController newpasswordController = TextEditingController();
  final TextEditingController confirmnewpasswordController =
      TextEditingController();

  final _currentpassword = true.obs;
  bool get currentpassword => _currentpassword.value;
  set currentpassword(bool value) => _currentpassword.value = value;

  final _newpassword = true.obs;
  bool get newpassword => _newpassword.value;
  set newpassword(bool value) => _newpassword.value = value;

  final _confirmnewpassword = true.obs;
  bool get confirmnewpassword => _confirmnewpassword.value;
  set confirmnewpassword(bool value) => _confirmnewpassword.value = value;
}
