import 'package:doctor_appointment/app/routes/app_pages.dart';
import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

Widget MyBackButtons(context) {
  late ColorNotifier notifier;
  notifier = Provider.of(context, listen: true);

  return GestureDetector(
    onTap: () => Get.back(),
    child: Container(
      height: Get.height / 15,
      margin: EdgeInsets.only(
        top: Get.width / 90,
        left: Get.width / 35,
        right: Get.width / 90,
        bottom: Get.width / 90,
      ),
      decoration: BoxDecoration(
        color: notifier.getBgColor,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Center(
        child: Icon(
          Icons.arrow_back,
          color: notifier.text,
        ),
      ),
    ),
  );
}

Widget searchButton(context) {
  late ColorNotifier notifier;
  notifier = Provider.of(context, listen: true);

  return GestureDetector(
    onTap: () {
      Get.toNamed(Routes.SEARCH_SCREEN);
    },
    child: Container(
      height: Get.height / 15,
      margin: EdgeInsets.symmetric(
        vertical: Get.width / 50,
        horizontal: Get.width / 35,
      ),
      padding: EdgeInsets.all(Get.width / 60),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Center(
        child: Image.asset(
          "assets/images/searchIcon.png",
          color: notifier.text,
        ),
      ),
    ),
  );
}

Widget shareButton(context) {
  late ColorNotifier notifier;
  notifier = Provider.of(context, listen: true);

  return Container(
    height: Get.height / 15,
    margin: EdgeInsets.symmetric(
      vertical: Get.width / 45,
      horizontal: Get.width / 35,
    ),
    padding: EdgeInsets.all(Get.width / 65),
    decoration: BoxDecoration(
      color: notifier.getBgColor,
      shape: BoxShape.circle,
      border: Border.all(
        color: Colors.grey,
      ),
    ),
    child: Center(
      child: Icon(
        Icons.share,
        color: notifier.text,
      ),
    ),
  );
}
