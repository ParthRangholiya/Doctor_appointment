import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/custombutton.dart';
import '../../../routes/app_pages.dart';

class ProfileScreenController extends GetxController {
  late ColorNotifier notifier;

  List leadingicon = [
    "assets/images/user.png",
    "assets/images/credit-card-outline.png",
    "assets/images/heartIcon.png",
    "assets/images/settingsIcon.png",
    "assets/images/exclamationIcon.png",
    "assets/images/privacy.png",
    "assets/images/logout.png",
  ].obs;

  List titletext = [
    "Your profile",
    "Payment Method",
    "Favourite",
    "Settings",
    "Help Center",
    "Privacy Policy",
    "Log out",
  ].obs;

  List routes = [
    Routes.YOUR_PROFILE,
    null,
    Routes.FAVORITES_SCREEN,
    Routes.SETTINGS,
    Routes.HELP_CENTER,
    Routes.PRIVACY_POLICY,
    null,
  ].obs;
}

showbottomsheetsLogout(context) {
  final ProfileScreenController profileScreenController = Get.find<ProfileScreenController>();

  showModalBottomSheet(
    context: context,
    backgroundColor: profileScreenController.notifier.getBgColor,
    builder: (context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: Get.width / 40,
            horizontal: Get.width / 20,
          ),
          width: Get.width,
          decoration: const BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: Get.width / 3,
                height: 4,
                decoration: BoxDecoration(
                  color: profileScreenController.notifier.getfillborder,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: Get.height / 40),
              Text(
                "Logout",
                style: TextStyle(
                  fontSize: Get.height / 40,
                  color: profileScreenController.notifier.text,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Divider(),
              SizedBox(height: Get.height / 80),
              Text(
                "Are you sure you want to log out?",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: Get.height / 50,
                ),
              ),
              SizedBox(height: Get.height / 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width / 2.3,
                    height: Get.height / 20,
                    child: OutlinedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Color(0xFF0165FC),
                        ),
                      ),
                      child: Text(
                        "Cancel",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: const Color(0xFF0165FC),
                          fontSize: Get.height / 50,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width / 2.3,
                    height: Get.height / 20,
                    child: CustomButton(
                      text: "Yes, Logout",
                      onPressed: () {},
                      color: const Color(0xFF0165FC),
                      textcolor: const Color(0xFFFFFFFF),
                      radius: BorderRadius.circular(Get.height / 20),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height / 80),
            ],
          ),
        ),
      );
    },
  );
}
