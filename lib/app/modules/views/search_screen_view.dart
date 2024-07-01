import 'package:doctor_appointment/widgets/buttons.dart';
import 'package:doctor_appointment/widgets/my_text_field.dart';
import 'package:doctor_appointment/widgets/nearby_hospital_widget.dart';
import 'package:doctor_appointment/widgets/top_specialist_dr_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../controllers/search_screen_controller.dart';

class SearchScreenView extends GetView<SearchScreenController> {
  const SearchScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      appBar: AppBar(
        backgroundColor: controller.notifier.getBgColor,
        title: MyTextField(
          type: TextInputType.name,
          hintText: "Search",
          controller: controller.searchController,
          prefixIcon: Container(
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              "assets/images/searchIcon.png",
              height: Get.height / 80,
              color: const Color(0xFF0165FC),
            ),
          ),
          suffixIcon: Container(
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              "assets/images/closeIcon.png",
              height: Get.height / 80,
              color: const Color(0xFF0165FC),
            ),
          ),
        ),
        centerTitle: true,
        leading: MyBackButtons(context),
        bottom: TabBar(
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
          dividerColor: controller.notifier.getfillborder,
          indicatorColor: const Color(0xff0165FC),
          labelColor: const Color(0xff0165FC),
          unselectedLabelColor: Colors.grey,
          controller: controller.tabController,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 5,
          labelStyle: TextStyle(
            fontSize: Get.height / 60,
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
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.tabController,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: Get.height / 70),
            child: const TopSpecialistDrWidget(),
          ),
          const NearbyHospitalWidget(),
        ],
      ),
    );
  }
}
