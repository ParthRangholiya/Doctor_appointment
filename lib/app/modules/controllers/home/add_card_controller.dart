import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddCardController extends GetxController {
  @override
  void onInit() {
    cardname = cardnamecontroller.text;
    cardnumber = cardnumbercontroller.text;
    expirydate = expirydatecontroller.text;
    super.onInit();
  }

  late ColorNotifier notifier;

  TextEditingController cardnamecontroller =
      TextEditingController(text: "Esther Howard");
  TextEditingController cardnumbercontroller =
      TextEditingController(text: "4716 9627 1635 8047");
  TextEditingController expirydatecontroller =
      TextEditingController(text: "02/30");
  TextEditingController cvvcontroller = TextEditingController();

  final _cardname = "".obs;
  String get cardname => _cardname.value;
  set cardname(String value) => _cardname.value = value;

  final _cardnumber = "".obs;
  String get cardnumber => _cardnumber.value;
  set cardnumber(String value) => _cardnumber.value = value;

  final _expirydate = "".obs;
  String get expirydate => _expirydate.value;
  set expirydate(String value) => _expirydate.value = value;

  final _saveCard = false.obs;
  bool get saveCard => _saveCard.value;
  set saveCard(bool value) => _saveCard.value = value;
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String inputData = newValue.text;
    StringBuffer buffer = StringBuffer();

    for (var i = 0; i < inputData.length; i++) {
      buffer.write(inputData[i]);
      int index = i + 1;

      if (index % 4 == 0 && inputData.length != index) {
        buffer.write(" ");
      }
    }
    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.toString().length),
    );
  }
}

class ValidMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String inputData = newValue.text;
    StringBuffer buffer = StringBuffer();

    for (var i = 0; i < inputData.length; i++) {
      buffer.write(inputData[i]);
      int index = i + 1;

      if (index % 2 == 0 && inputData.length != index) {
        buffer.write("/");
      }
    }
    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.toString().length),
    );
  }
}
