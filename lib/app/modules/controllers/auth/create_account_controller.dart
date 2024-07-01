import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountController extends GetxController {
  late ColorNotifier notifier;

  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  final _createaccountpassword = false.obs;
  bool get createaccountpassword => _createaccountpassword.value;
  set createaccountpassword(bool value) => _createaccountpassword.value = value;

  final _isChecked = false.obs;
  bool get isChecked => _isChecked.value;
  set isChecked(bool value) => _isChecked.value = value;

  final _signupmethodelogo = [
    "assets/images/applelogo.png",
    "assets/images/google_logo.png",
    "assets/images/facebooklogo.png",
  ].obs;
  List<String> get signupmethodelogo => _signupmethodelogo;
  set signupmethodelogo(List<String> value) => _signupmethodelogo.value = value;
}
