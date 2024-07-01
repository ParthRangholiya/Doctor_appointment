import 'package:doctor_appointment/app/routes/app_pages.dart';
import 'package:doctor_appointment/widgets/buttons.dart';
import 'package:doctor_appointment/widgets/bottombar_widget.dart';
import 'package:doctor_appointment/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../controllers/home/add_card_controller.dart';

class AddCardView extends GetView<AddCardController> {
  const AddCardView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      appBar: AppBar(
        backgroundColor: controller.notifier.getBgColor,
        title: Text(
          'Add Card',
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
        "Add Card",
        () {
          Get.toNamed(Routes.REVIEW_SUMMARY);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Get.width / 25,
            vertical: Get.height / 50,
          ),
          child: Column(
            children: [
              Obx(
                () => Container(
                  height: Get.height / 4.5,
                  width: Get.width,
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.width / 20,
                    vertical: Get.height / 70,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0165FC),
                    borderRadius: BorderRadius.circular(Get.width / 30),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            "assets/images/logo-visa-card.png",
                            height: Get.height / 27,
                            color: Colors.white,
                          )
                        ],
                      ),
                      SizedBox(height: Get.height / 18),
                      Text(
                        controller.cardnumber,
                        style: TextStyle(
                          letterSpacing: 2,
                          color: Colors.white,
                          fontSize: Get.height / 35,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Card holder name",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: Get.height / 75,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              SizedBox(
                                width: Get.width / 3,
                                child: Text(
                                  controller.cardname,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Get.height / 55,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Expiry date",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: Get.height / 75,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                controller.expirydate,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Get.height / 55,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: Get.width / 28),
                          Image.asset(
                            "assets/images/cardscanner.png",
                            height: Get.height / 30,
                            color: Colors.white60,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: Get.height / 50),
              MyTextField(
                titletext: "Card Holder Name",
                type: TextInputType.name,
                hintText: "name",
                controller: controller.cardnamecontroller,
                onChanged: (value) {
                  controller.cardname = value;
                },
              ),
              SizedBox(height: Get.height / 50),
              MyTextField(
                titletext: "Card Number",
                onChanged: (value) {
                  controller.cardnumber = value;
                },
                inputFormatter: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(16),
                  CardNumberInputFormatter(),
                ],
                type: TextInputType.number,
                hintText: controller.cardnumbercontroller.text,
                controller: controller.cardnumbercontroller,
              ),
              SizedBox(height: Get.height / 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width / 2.3,
                    child: MyTextField(
                      inputFormatter: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4),
                        ValidMonthInputFormatter(),
                      ],
                      titletext: "Expiry Date",
                      type: TextInputType.datetime,
                      onChanged: (value) {
                        controller.expirydate = value;
                      },
                      hintText: "02/30",
                      controller: controller.expirydatecontroller,
                    ),
                  ),
                  SizedBox(
                    width: Get.width / 2.3,
                    child: MyTextField(
                      inputFormatter: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(3)
                      ],
                      titletext: "CVV",
                      type: TextInputType.datetime,
                      hintText: "000",
                      controller: controller.expirydatecontroller,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                      value: controller.saveCard,
                      activeColor: const Color(0xFF0165FC),
                      onChanged: (value) {
                        controller.saveCard = value!;
                      },
                    ),
                  ),
                  Text(
                    "Save Card",
                    style: TextStyle(
                      fontSize: Get.height / 60,
                      color: controller.notifier.text,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
