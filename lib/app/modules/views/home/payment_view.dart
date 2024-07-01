import 'package:doctor_appointment/app/routes/app_pages.dart';
import 'package:doctor_appointment/widgets/buttons.dart';
import 'package:doctor_appointment/widgets/custombutton.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../controllers/home/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);

    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      appBar: AppBar(
        backgroundColor: controller.notifier.getBgColor,
        title: Text(
          'Payment',
          style: TextStyle(
            color: controller.notifier.text,
            fontSize: Get.height / 40,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: MyBackButtons(context),
      ),
      bottomNavigationBar: Container(
        height: Get.height / 6.5,
        padding: EdgeInsets.symmetric(
          horizontal: Get.width / 20,
          vertical: Get.height / 55,
        ),
        decoration: BoxDecoration(
          color: controller.notifier.getBgColor,
          border: Border(
            top: BorderSide(
              color: controller.notifier.getfillborder,
            ),
            left: BorderSide(
              color: controller.notifier.getfillborder,
            ),
            right: BorderSide(
              color: controller.notifier.getfillborder,
            ),
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Get.width / 25),
            topRight: Radius.circular(Get.width / 25),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: Get.width,
              height: Get.height / 17,
              child: CustomButton(
                text: "View Appointment",
                onPressed: () {
                  Get.toNamed(
                    Routes.MY_APPOINTMENT,
                    arguments: {
                      "profile": controller.bookAppointmentController.drphoto,
                      "doctor": controller.bookAppointmentController.drname,
                    },
                  );
                },
                color: const Color(0xFF0165FC),
                textcolor: Colors.white,
                radius: BorderRadius.circular(Get.width / 10),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.offAllNamed(Routes.BOTTOM_NAVIGATION_BAR);
              },
              child: Text(
                "Go to Home",
                style: TextStyle(
                  color: const Color(0xFF0165FC),
                  fontSize: Get.height / 50,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Get.width / 25,
            vertical: Get.height / 50,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/check-circle.png",
                color: const Color(0xFF0165FC),
                height: Get.height / 7,
              ),
              SizedBox(height: Get.height / 50),
              Text(
                "Payment Successful!",
                style: TextStyle(
                  color: controller.notifier.text,
                  fontSize: Get.height / 35,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: Get.height / 80),
              Text(
                "You have successfully booked appointment with",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: Get.height / 60,
                ),
              ),
              Text(
                "Dr.Jonny Wilson",
                style: TextStyle(
                  color: controller.notifier.text,
                  fontSize: Get.height / 55,
                  fontWeight: FontWeight.w500,
                ),
              ),
              GridView.builder(
                itemCount: controller.imag.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: Get.width / 50,
                  mainAxisSpacing: Get.height / 90,
                  mainAxisExtent: Get.height / 20,
                ),
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Image.asset(
                        controller.imag[index],
                        color: const Color(0xFF0165FC),
                        height: Get.height / 50,
                      ),
                      SizedBox(width: Get.width / 80),
                      Text(
                        controller.text[index],
                        style: TextStyle(
                          color: controller.notifier.text,
                          fontSize: Get.height / 65,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
