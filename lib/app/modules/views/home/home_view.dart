import 'package:doctor_appointment/app/modules/views/home/filter_screen_view.dart';
import 'package:doctor_appointment/app/routes/app_pages.dart';
import 'package:doctor_appointment/widgets/top_specialist_dr_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../controllers/home/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);

    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.height / 11),
        child: Stack(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: controller.notifier.getBgColor,
            ),
            Positioned(
              top: Get.height / 26,
              left: Get.width / 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Loction",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: Get.height / 45,
                    ),
                  ),
                  SizedBox(height: Get.height / 90),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.GET_DIRECTION);
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/location-pin.png",
                          height: Get.height / 40,
                          color: const Color(0xFF0165FC),
                        ),
                        SizedBox(width: Get.width / 90),
                        Text(
                          "New York, USA ",
                          style: TextStyle(
                            color: controller.notifier.text,
                            fontSize: Get.height / 43,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: Get.width / 30,
              top: Get.height / 25,
              child: GestureDetector(
                onTap: () => Get.toNamed(Routes.NOTIFICATION_SCREEN),
                child: Container(
                  height: Get.height / 18,
                  padding: EdgeInsets.all(Get.width / 40),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    "assets/images/bell.png",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Get.width / 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.SEARCH_SCREEN);
                    },
                    child: Container(
                      width: Get.width / 1.3,
                      height: Get.height / 20,
                      padding: EdgeInsets.symmetric(horizontal: Get.width / 70),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Get.height / 90),
                        border: Border.all(
                          color: controller.notifier.getfillborder,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/searchIcon.png",
                              color: const Color(0xFF0165FC),
                              height: Get.height / 35,
                            ),
                            SizedBox(width: Get.width / 80),
                            Text(
                              "Search",
                              style: TextStyle(
                                fontSize: Get.height / 55,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => const FilterScreenView(),
                        transition: Transition.downToUp,
                        duration: const Duration(milliseconds: 800),
                      );
                    },
                    child: Container(
                      height: Get.height / 20,
                      width: Get.width / 8,
                      padding: EdgeInsets.all(Get.width / 90),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0165FC),
                        borderRadius: BorderRadius.circular(Get.height / 80),
                      ),
                      child: Image.asset("assets/images/menu.png"),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: Get.height / 90,
                horizontal: Get.width / 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Upcomming Schedule",
                        style: TextStyle(
                          fontSize: Get.height / 45,
                          fontWeight: FontWeight.w500,
                          color: controller.notifier.text,
                        ),
                      ),
                      SizedBox(width: Get.width / 50),
                      Container(
                        padding: EdgeInsets.all(Get.width / 40),
                        decoration: const BoxDecoration(
                          color: Color(0xFF0165FC),
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          "8",
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      fontSize: Get.height / 55,
                      color: const Color(0xFF0165FC),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: Get.width,
              height: Get.height / 5,
              margin: EdgeInsets.symmetric(horizontal: Get.width / 25),
              padding: EdgeInsets.symmetric(vertical: Get.width / 30),
              decoration: BoxDecoration(
                color: const Color(0xFF0165FC),
                borderRadius: BorderRadius.circular(Get.height / 50),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListTile(
                    title: Text(
                      "Dr. Alana Rueter",
                      style: TextStyle(
                        color: const Color(0xFFFFFFFF),
                        fontSize: Get.height / 50,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    subtitle: Text(
                      "Dentist Consultation",
                      style: TextStyle(
                        color: const Color(0xFFFFFFFF),
                        fontSize: Get.height / 55,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    leading: Container(
                      padding: EdgeInsets.all(Get.width / 40),
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        "assets/images/doctor.jpg",
                      ),
                    ),
                    trailing: Container(
                      padding: EdgeInsets.all(Get.width / 40),
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.call,
                        color: Color(0xFF0165FC),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: Get.width / 30),
                    padding: EdgeInsets.symmetric(horizontal: Get.width / 20),
                    height: Get.height / 15,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(Get.height / 50),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/images/calendar.png",
                                color: const Color(0xFFFFFFFF),
                                height: Get.height / 40,
                              ),
                              SizedBox(width: Get.width / 50),
                              Text(
                                "Monday, 26 July",
                                style: TextStyle(
                                  color: const Color(0xFFFFFFFF),
                                  fontSize: Get.height / 55,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          VerticalDivider(
                            color: Colors.white38,
                            endIndent: Get.height / 80,
                            indent: Get.height / 80,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/images/clockoutlineIcon.png",
                                color: const Color(0xFFFFFFFF),
                                height: Get.height / 40,
                              ),
                              SizedBox(width: Get.width / 50),
                              Text(
                                "09:00 - 10:00",
                                style: TextStyle(
                                  color: const Color(0xFFFFFFFF),
                                  fontSize: Get.height / 55,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: Get.height / 90,
                horizontal: Get.width / 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Doctor Speciality",
                    style: TextStyle(
                      fontSize: Get.height / 45,
                      color: controller.notifier.text,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: Get.width / 50),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.CATEGORY);
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(
                        fontSize: Get.height / 55,
                        color: const Color(0xFF0165FC),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height / 10,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: controller.doctorSpeciality.length,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: Get.width / 5.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: Get.height / 15,
                          padding: EdgeInsets.all(Get.height / 70),
                          decoration: BoxDecoration(
                            color: controller.notifier.getbluelightcolor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Image.asset(
                              controller.doctorSpeciality[index],
                              color: const Color(0xff0165FC),
                            ),
                          ),
                        ),
                        Text(
                          controller.specialitytext[index],
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: controller.notifier.text,
                            fontSize: Get.height / 55,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: Get.width / 15);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: Get.height / 90,
                horizontal: Get.width / 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Nearby Hospitals",
                    style: TextStyle(
                      fontSize: Get.height / 45,
                      color: controller.notifier.text,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: Get.width / 50),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.NEARBY_HOSPITALS);
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(
                        fontSize: Get.height / 55,
                        color: const Color(0xFF0165FC),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height / 4,
              child: ListView.builder(
                itemCount: controller.nearbyhospitals.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    width: Get.width / 1.8,
                    margin: EdgeInsets.only(
                      top: Get.width / 92,
                      left: Get.width / 25,
                      bottom: Get.height / 50,
                    ),
                    decoration: BoxDecoration(
                      color: controller.notifier.getcontainer,
                      borderRadius: BorderRadius.circular(Get.height / 40),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(5, 6),
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                  Routes.HOSPITAL_DETAIL,
                                  arguments: {
                                    "himage": controller.nearbyhospitals[index],
                                    "hname": controller.hospitalstext[index]
                                  },
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(Get.height / 40),
                                  topRight: Radius.circular(Get.height / 40),
                                ),
                                child: Image.asset(
                                  controller.nearbyhospitals[index],
                                  fit: BoxFit.cover,
                                  height: Get.height / 6.5,
                                  width: Get.width,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    controller
                                        .nearbyhospitalslickebuttton(index);
                                  },
                                  child: Container(
                                    height: Get.height / 20,
                                    padding: EdgeInsets.all(Get.width / 40),
                                    decoration: const BoxDecoration(
                                      color: Colors.white38,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: controller.nearbyhospitalspotos
                                                  .contains(controller
                                                          .nearbyhospitals[
                                                      index]) !=
                                              true
                                          ? SvgPicture.asset(
                                              "assets/images/heartoutlineIcon.svg",
                                              color: const Color(0xFFFFFFFF),
                                            )
                                          : SvgPicture.asset(
                                              "assets/images/heartIcon.svg",
                                              color: const Color(0xff0165FC),
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: Get.width / 95,
                              right: Get.width / 80,
                              child: Container(
                                height: Get.height / 30,
                                width: Get.width / 7,
                                padding: EdgeInsets.symmetric(
                                  horizontal: Get.width / 70,
                                ),
                                decoration: BoxDecoration(
                                  color: controller.notifier.getBgColor,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                    bottomLeft: Radius.circular(12),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      "assets/images/starIcon.png",
                                      color: Colors.amber,
                                      height: Get.height / 50,
                                    ),
                                    Text(
                                      "4.8",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: Get.height / 55,
                                        color: controller.notifier.text,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Get.width / 40,
                            vertical: 7,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.hospitalstext[index],
                                style: TextStyle(
                                  fontSize: Get.height / 55,
                                  fontWeight: FontWeight.w500,
                                  color: controller.notifier.text,
                                ),
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/clock.svg",
                                    height: Get.height / 70,
                                    color: const Color(0xff0165FC),
                                  ),
                                  Text(
                                    " ${controller.hospitaltime[index]}",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: Get.height / 65,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Get.width / 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Specialist",
                    style: TextStyle(
                      fontSize: Get.height / 45,
                      color: controller.notifier.text,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: Get.width / 50),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.TOP_SPECIALIST);
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(
                        fontSize: Get.height / 55,
                        color: const Color(0xFF0165FC),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Get.height / 70),
              child: const TopSpecialistDrWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
