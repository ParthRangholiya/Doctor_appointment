import 'package:doctor_appointment/app/routes/app_pages.dart';
import 'package:doctor_appointment/widgets/bottombar_widget.dart';
import 'package:doctor_appointment/widgets/buttons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../controllers/home/payment_methods_controller.dart';

class PaymentMethodsView extends GetView<PaymentMethodsController> {
  const PaymentMethodsView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);

    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      appBar: AppBar(
        backgroundColor: controller.notifier.getBgColor,
        title: Text(
          'Payment Methods',
          style: TextStyle(
            color: controller.notifier.text,
            fontSize: Get.height / 50,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: MyBackButtons(context),
      ),
      bottomNavigationBar: MyBottomBar(
        context,
        "Next",
        () {
          Get.toNamed(Routes.ADD_CARD);
        },
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: Get.width / 25,
          vertical: Get.height / 50,
        ),
        children: [
          Text(
            "Credit & Debit Card",
            style: TextStyle(
              color: controller.notifier.text,
              fontSize: Get.height / 45,
              fontWeight: FontWeight.w500,
            ),
          ),
          Card(
            color: controller.notifier.getBgColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Get.width / 30),
              side: BorderSide(
                color: controller.notifier.getfillborder,
              ),
            ),
            child: GestureDetector(
              onTap: () {
                controller.updateSelectpaymethodevalue(0);
                Get.toNamed(Routes.ADD_CARD);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/credit-cardIcons.png",
                          height: Get.height / 40,
                          color: const Color(0xFF0165FC),
                        ),
                        SizedBox(width: Get.width / 50),
                        Text(
                          "Add New Card",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: Get.height / 55,
                          ),
                        ),
                      ],
                    ),
                  ),
                  controller.payment == true
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Get.width / 30,
                            vertical: Get.width / 30,
                          ),
                          child: Text(
                            "Lisnk",
                            style: TextStyle(
                                color: const Color(0xFF0165FC),
                                fontSize: Get.height / 50),
                          ),
                        )
                      : Obx(
                          () => Radio(
                            hoverColor: Colors.transparent,
                            activeColor: const Color(0xFF0165FC),
                            value: 0,
                            groupValue: controller.selectpaymethod.value,
                            onChanged: (value) {
                              controller.updateSelectpaymethodevalue(value!);
                              Get.toNamed(Routes.ADD_CARD);
                            },
                          ),
                        ),
                ],
              ),
            ),
          ),
          SizedBox(height: Get.height / 50),
          Text(
            "More Payment Options",
            style: TextStyle(
              color: controller.notifier.text,
              fontSize: Get.height / 45,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: Get.height / 50),
          Card(
            color: controller.notifier.getBgColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Get.width / 30),
              side: BorderSide(
                color: controller.notifier.getfillborder,
              ),
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    controller.updateSelectpaymethodevalue(1);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width / 30),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/paypal.png",
                              height: Get.height / 40,
                            ),
                            SizedBox(width: Get.width / 50),
                            Text(
                              "Paypal",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: Get.height / 55,
                              ),
                            ),
                          ],
                        ),
                      ),
                      controller.payment == true
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Get.width / 30,
                                vertical: Get.width / 30,
                              ),
                              child: Text(
                                "Lisnk",
                                style: TextStyle(
                                    color: const Color(0xFF0165FC),
                                    fontSize: Get.height / 50),
                              ),
                            )
                          : Obx(
                              () => Radio(
                                hoverColor: Colors.transparent,
                                activeColor: const Color(0xFF0165FC),
                                value: 1,
                                groupValue: controller.selectpaymethod.value,
                                onChanged: (value) {
                                  controller
                                      .updateSelectpaymethodevalue(value!);
                                },
                              ),
                            ),
                    ],
                  ),
                ),
                Divider(
                  color: controller.notifier.getfillborder,
                ),
                GestureDetector(
                  onTap: () {
                    controller.updateSelectpaymethodevalue(2);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width / 30),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/applelogo.png",
                              height: Get.height / 40,
                              color: controller.notifier.text,
                            ),
                            SizedBox(width: Get.width / 50),
                            Text(
                              "Apple Pay",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: Get.height / 55,
                              ),
                            ),
                          ],
                        ),
                      ),
                      controller.payment == true
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Get.width / 30,
                                vertical: Get.width / 30,
                              ),
                              child: Text(
                                "Lisnk",
                                style: TextStyle(
                                    color: const Color(0xFF0165FC),
                                    fontSize: Get.height / 50),
                              ),
                            )
                          : Obx(
                              () => Radio(
                                hoverColor: Colors.transparent,
                                activeColor: const Color(0xFF0165FC),
                                value: 2,
                                groupValue: controller.selectpaymethod.value,
                                onChanged: (value) {
                                  controller
                                      .updateSelectpaymethodevalue(value!);
                                },
                              ),
                            ),
                    ],
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
