import 'package:doctor_appointment/app/modules/views/home/hospital_detail/about_tabview.dart';
import 'package:doctor_appointment/app/modules/views/home/hospital_detail/gallery_tabview.dart';
import 'package:doctor_appointment/app/modules/views/home/hospital_detail/review_tabview.dart';
import 'package:doctor_appointment/app/modules/views/home/hospital_detail/sliverappbar.dart';
import 'package:doctor_appointment/app/modules/views/home/hospital_detail/specialist_tabview.dart';
import 'package:doctor_appointment/app/modules/views/home/hospital_detail/treatments_tabview.dart';
import 'package:doctor_appointment/widgets/bottombar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../routes/app_pages.dart';
import '../../../controllers/home/hospital_detail_controller.dart';

class HospitalDetailView extends GetView<HospitalDetailController> {
  const HospitalDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.profileInfoAddController.notifier = Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: controller.profileInfoAddController.notifier.getBgColor,
      bottomNavigationBar: MyBottomBar(
        context,
        "Book Appointment",
        () {},
      ),
      body: CustomScrollView(
        slivers: [
          const SliverappbarView(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.width / 25,
                    vertical: Get.height / 50,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.hname,
                        style: TextStyle(
                          color: controller.profileInfoAddController.notifier.text,
                          fontSize: Get.height / 40,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Dental, Skin Care, Eye Care,",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: Get.height / 60,
                        ),
                      ),
                      Divider(color: controller.profileInfoAddController.notifier.getfillborder),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/location-pin.png",
                            height: Get.height / 70,
                            color: const Color(0xff0165FC),
                          ),
                          Text(
                            " 8502 Preston Rd. Inglewood, Maine 98380",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: Get.height / 65,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/clock.svg",
                            height: Get.height / 70,
                            color: const Color(0xff0165FC),
                          ),
                          Text(
                            " 15 min, 1.5km,Mon Sun | 11 am - 11 pm",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: Get.height / 65,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Get.height / 50),
                      SizedBox(
                        width: Get.width,
                        height: Get.height / 10,
                        child: ListView.separated(
                          itemCount: controller.hospitalfacilitiesImage.length,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    if (index == 0) {
                                      launchUrl(
                                        Uri.parse(
                                            "https://sabkadentist.com/dentist-in-surat/"),
                                        mode: LaunchMode
                                            .externalNonBrowserApplication,
                                      );
                                    } else if (index == 1) {
                                      Get.toNamed(
                                        Routes.MESSAGE_SCREEN,
                                        arguments: {
                                          "drprofile": controller.himage,
                                          "drname": controller.hname,
                                        },
                                      );
                                    } else if (index == 2) {
                                      Get.toNamed(Routes.VIDEO_CALL_SCREEN);
                                    } else if (index == 3) {
                                      Get.toNamed(Routes.GET_DIRECTION);
                                    } else if (index == 4) {
                                      await FlutterShare.share(
                                          title: 'Doctor Appointments',
                                          text:
                                              'Hey! Now use our app to share with your family or friends.',
                                          linkUrl:
                                              "https://sabkadentist.com/dentist-in-surat/",
                                          chooserTitle: 'Doctor Appointments');
                                    }
                                  },
                                  child: Container(
                                    height: Get.height / 15,
                                    padding: EdgeInsets.all(Get.height / 60),
                                    decoration: BoxDecoration(
                                      color:
                                          controller.profileInfoAddController.notifier.getbluelightcolor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        controller
                                            .hospitalfacilitiesImage[index],
                                        color: const Color(0xff0165FC),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  controller.hospitalfacilitiesName[index],
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: controller.profileInfoAddController
                                    .notifier.text,
                                    fontSize: Get.height / 60,
                                  ),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(width: Get.width / 25);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                DefaultTabController(
                  length: controller.tabController.length,
                  initialIndex: controller.initialindex.toInt(),
                  child: TabBar(
                    isScrollable: true,
                    unselectedLabelColor: Colors.grey,
                    overlayColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    indicatorColor: const Color(0xff0165FC),
                    controller: controller.tabController,
                    labelColor: const Color(0xFF0165FC),
                    indicatorSize: TabBarIndicatorSize.label,
                    dividerColor: controller.profileInfoAddController.notifier.getfillborder,
                    labelStyle: TextStyle(
                      fontSize: Get.height / 53,
                      fontWeight: FontWeight.w400,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: Get.width / 35),
                    tabAlignment: TabAlignment.start,
                    tabs: const [
                      Tab(
                        child:
                            Text("Treatments", overflow: TextOverflow.ellipsis),
                      ),
                      Tab(
                        child:
                            Text("Specialist", overflow: TextOverflow.ellipsis),
                      ),
                      Tab(
                        child: Text("Gallery", overflow: TextOverflow.ellipsis),
                      ),
                      Tab(
                        child: Text("Review", overflow: TextOverflow.ellipsis),
                      ),
                      Tab(
                        child: Text("About", overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: Get.height * 2,
                  width: Get.width,
                  padding: EdgeInsets.symmetric(vertical: Get.height / 70),
                  child: Center(
                    child: TabBarView(
                      controller: controller.tabController,
                      children: const [
                        TreatmentsTabview(),
                        SpecialistTabview(),
                        GalleryTabview(),
                        ReviewTabview(),
                        AboutTabview(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
