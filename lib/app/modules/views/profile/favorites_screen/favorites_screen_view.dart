import 'package:doctor_appointment/app/modules/views/profile/favorites_screen/favorites_doctors_view.dart';
import 'package:doctor_appointment/app/modules/views/profile/favorites_screen/favorites_hospitals_view.dart';
import 'package:doctor_appointment/widgets/buttons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../controllers/profile/favorites_screen_controller.dart';

class FavoritesScreenView extends GetView<FavoritesScreenController> {
  const FavoritesScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      appBar: AppBar(
        backgroundColor: controller.notifier.getBgColor,
        centerTitle: true,
        title: Text(
          'Favorites',
          style: TextStyle(
            color: controller.notifier.text,
            fontSize: Get.height / 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: MyBackButtons(context),
        actions: [searchButton(context)],
        bottom: TabBar(
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
          indicatorColor: const Color(0xff0165FC),
          controller: controller.tabController,
          labelColor: Colors.grey,
          dividerColor: controller.notifier.getfillborder,
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: TextStyle(
            fontSize: Get.height / 60,
            color: controller.notifier.text,
            fontWeight: FontWeight.w500,
          ),
          tabs: const [
            Tab(
              child: Text(
                "Doctors",
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Tab(
              child: Text(
                "Hospitals",
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
          mouseCursor: MouseCursor.uncontrolled,
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: const [
          FavoritesDoctorsView(),
          FavoritesHospitalsView(),
        ],
      ),
    );
  }
}
