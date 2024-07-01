import 'package:flutter/material.dart';

class ColorNotifier with ChangeNotifier {
  bool isDark = false;
  set setIsDark(value) {
    isDark = value;
    notifyListeners();
  }

  get getIsDark => isDark;
  get getBgColor => isDark ? const Color(0xff030303) : const Color(0xffFFFFFF);
  get text => isDark ? const Color(0xffFFFFFF) : const Color(0xff202020);
  get getblucolor => isDark ? const Color(0xffFFFFFF) : const Color(0xFF0165FC);
  get getcontainer => isDark
      ? /* const Color(0xFF525254)*/ Colors.grey.shade900
      : const Color(0xFFFFFFFF);
  get getfillborder => isDark ? const Color(0xff414141) : Colors.grey.shade300;
  get getbluelightcolor => isDark
      ? const Color(0xFF0165FC).withOpacity(0.3)
      : const Color(0xFF0165FC).withOpacity(0.1);
  get getimagBgColor => isDark ? Colors.white12 : Colors.black12;
}
