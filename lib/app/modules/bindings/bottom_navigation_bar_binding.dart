import 'package:doctor_appointment/app/modules/controllers/bookings/bookings_screen_controller.dart';
import 'package:doctor_appointment/app/modules/controllers/chat/chat_screen_controller.dart';
import 'package:doctor_appointment/app/modules/controllers/explore_screen_controller.dart';
import 'package:doctor_appointment/app/modules/controllers/home/home_controller.dart';
import 'package:doctor_appointment/app/modules/controllers/profile/profile_screen_controller.dart';
import 'package:get/get.dart';

import '../controllers/bottom_navigation_bar_controller.dart';

class BottomNavigationBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigationBarController>(
      () => BottomNavigationBarController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ExploreScreenController>(
      () => ExploreScreenController(),
    );
    Get.lazyPut<BookingsScreenController>(
      () => BookingsScreenController(),
    );
    Get.lazyPut<ChatScreenController>(
      () => ChatScreenController(),
    );
    Get.lazyPut<ProfileScreenController>(
      () => ProfileScreenController(),
    );
  }
}
