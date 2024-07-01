import 'package:doctor_appointment/widgets/bottombar_widget.dart';
import 'package:doctor_appointment/widgets/buttons.dart';
import 'package:doctor_appointment/widgets/doctor_info_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../routes/app_pages.dart';
import '../../controllers/home/my_appointment_controller.dart';

class MyAppointmentView extends GetView<MyAppointmentController> {
  const MyAppointmentView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      appBar: AppBar(
        backgroundColor: controller.notifier.getBgColor,
        title: Text(
          'My Appointment',
          style: TextStyle(
            color: controller.notifier.text,
            fontSize: Get.height / 40,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: MyBackButtons(context),
      ),
      bottomNavigationBar: MyBottomBar(
        context,
        "Message (Start at 16:00 PM)",
        () {
          Get.toNamed(
            Routes.MESSAGE_SCREEN,
            arguments: {
              "drprofile": controller.profile,
              "drname": controller.doctor,
            },
          );
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Get.width / 25,
            vertical: Get.width / 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DoctorInfoWidget(
                name: controller.doctor,
                image: controller.profile,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Get.height / 70),
                child: Divider(color: controller.notifier.getfillborder),
              ),
              Text(
                "Scheduled Appointment",
                style: TextStyle(
                  color: controller.notifier.text,
                  fontSize: Get.height / 40,
                ),
              ),
              ListView.separated(
                padding: EdgeInsets.symmetric(vertical: Get.height / 70),
                itemCount: controller.appointmentdata.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.appointmentdata[index],
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: Get.height / 55,
                        ),
                      ),
                      Text(
                        controller.appointmentdatavalue[index],
                        style: TextStyle(
                          color: controller.notifier.text,
                          fontSize: Get.height / 55,
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  if (index == 2) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: Get.height / 70),
                          child:
                              Divider(color: controller.notifier.getfillborder),
                        ),
                        Text(
                          "Patient Info.",
                          style: TextStyle(
                            color: controller.notifier.text,
                            fontSize: Get.height / 40,
                          ),
                        ),
                        SizedBox(height: Get.height / 70),
                      ],
                    );
                  } else {
                    return SizedBox(height: Get.height / 70);
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Get.height / 70),
                child: Divider(color: controller.notifier.getfillborder),
              ),
              Text(
                "Patient Info.",
                style: TextStyle(
                  color: controller.notifier.text,
                  fontSize: Get.height / 40,
                ),
              ),
              SizedBox(height: Get.height / 70),
              Container(
                height: Get.height / 10,
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: Get.width / 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Get.width / 40),
                  border: Border.all(
                    color: controller.notifier.getfillborder,
                  ),
                ),
                child: Center(
                  child: ListTile(
                    leading: Container(
                      height: Get.height / 15,
                      width: Get.height / 15,
                      padding: EdgeInsets.all(Get.height / 70),
                      decoration: BoxDecoration(
                        color: controller.notifier.getbluelightcolor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/images/reviewIcon.png",
                          color: const Color(0xff0165FC),
                        ),
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: Get.width / 50,
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Messaging",
                          style: TextStyle(
                            color: controller.notifier.text,
                            fontSize: Get.height / 60,
                          ),
                        ),
                        Text(
                          "\$20",
                          style: TextStyle(
                            color: controller.notifier.text,
                            fontSize: Get.height / 60,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Chat with Doctor",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: Get.height / 70,
                          ),
                        ),
                        Text(
                          "Pais",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: Get.height / 70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
