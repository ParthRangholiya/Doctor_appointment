import 'package:doctor_appointment/app/modules/views/bookings/bookings_screen/bookings_screen_view.dart';
import 'package:doctor_appointment/app/modules/views/chat/chat_screen_view.dart';
import 'package:doctor_appointment/app/modules/views/explore_screen_view.dart';
import 'package:doctor_appointment/app/modules/views/home/home_view.dart';
import 'package:doctor_appointment/app/modules/views/profile/profile_screen_view.dart';
import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController
    with SingleGetTickerProviderMixin {
  late TabController tabController;
  late ColorNotifier notifier;

  final _selectIndex = 0.obs;
  get selectIndex => _selectIndex.value;
  set selectIndex(value) => _selectIndex.value = value;

  List bottomtab = [
    const HomeView(),
    const ExploreScreenView(),
    const BookingsScreenView(),
    const ChatScreenView(),
    const ProfileScreenView(),
  ].obs;
}
