import 'package:doctor_appointment/app/modules/views/home/doctor_details/about_text_view.dart';
import 'package:doctor_appointment/app/modules/views/home/doctor_details/address_view.dart';
import 'package:doctor_appointment/app/modules/views/home/doctor_details/clinicimage.dart';
import 'package:doctor_appointment/app/modules/views/home/doctor_details/reviews_view.dart';
import 'package:doctor_appointment/app/modules/views/home/doctor_details/visiter_person_view.dart';
import 'package:doctor_appointment/app/modules/views/home/doctor_details/working_hours_view.dart';
import 'package:doctor_appointment/app/routes/app_pages.dart';
import 'package:doctor_appointment/widgets/buttons.dart';
import 'package:doctor_appointment/widgets/bottombar_widget.dart';
import 'package:doctor_appointment/widgets/doctor_work_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../../widgets/doctor_info_widget.dart';
import '../../../controllers/home/doctor_details_controller.dart';

class DoctorDetailsView extends GetView<DoctorDetailsController> {
  const DoctorDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      appBar: AppBar(
        backgroundColor: controller.notifier.getBgColor,
        title: Text(
          'Doctor Details',
          style: TextStyle(
            color: controller.notifier.text,
            fontSize: Get.height / 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        leading: MyBackButtons(context),
        actions: [
          shareButton(context),
          Obx(
            () => GestureDetector(
              onTap: () {
                if (controller.homeController.topspefavphotos
                    .contains(controller.imag)) {
                  controller.homeController.topspefavphotos
                      .remove(controller.imag);
                  controller.homeController.topspefavname
                      .remove(controller.name);
                } else {
                  controller.homeController.topspefavphotos
                      .add(controller.imag);
                  controller.homeController.topspefavname.add(controller.name);
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: Get.width / 45,
                ),
                padding: EdgeInsets.all(Get.width / 55),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: controller.homeController.topspefavphotos
                        .contains(controller.imag)
                    ? SvgPicture.asset(
                        "assets/images/heartIcon.svg",
                        color: const Color(0xff0165FC),
                      )
                    : SvgPicture.asset(
                        "assets/images/heartoutlineIcon.svg",
                        color: controller.notifier.text,
                      ),
              ),
            ),
          ),
          SizedBox(width: Get.width / 30),
        ],
      ),
      bottomNavigationBar: MyBottomBar(
        context,
        "Book Appointment",
        () {
          Get.toNamed(Routes.BOOK_APPOINTMENT, arguments: {
            "drphoto": controller.imag,
            "drname": controller.name,
          });
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Get.height / 80,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width / 25,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // doctor Information

                    DoctorInfoWidget(
                      image: controller.imag ?? "",
                      name: controller.name ?? "",
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: Get.height / 70),
                      child: Divider(
                        color: controller.notifier.getfillborder,
                      ),
                    ),

                    // doctorWorking Information

                    const DoctorWorkWidget(),
                    SizedBox(height: Get.height / 50),

                    // doctor About Information

                    const AboutTextView(),
                    SizedBox(height: Get.height / 50),

                    // doctor Working Time Information
                    const WorkingHoursView(),
                    SizedBox(height: Get.height / 50),

                    // doctor Clinic Address Information
                    const AddressView(),
                    SizedBox(height: Get.height / 50),
                  ],
                ),
              ),

              //  doctor Review Information
              const ReviewsView(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Get.height / 70),
                child: Divider(
                  color: controller.notifier.getfillborder,
                ),
              ),

              //  doctor Visiter Person Information
              const VisiterPersonView(),
              SizedBox(height: Get.height / 50),
              const ClinicimageView(),
            ],
          ),
        ),
      ),
    );
  }
}
