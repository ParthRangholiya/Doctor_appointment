import 'package:doctor_appointment/app/routes/app_pages.dart';
import 'package:doctor_appointment/widgets/buttons.dart';
import 'package:doctor_appointment/widgets/bottombar_widget.dart';
import 'package:doctor_appointment/widgets/dropdownfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../controllers/home/select_package_controller.dart';

class SelectPackageView extends GetView<SelectPackageController> {
  const SelectPackageView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      appBar: AppBar(
        backgroundColor: controller.notifier.getBgColor,
        title: Text(
          'Select Package',
          style: TextStyle(
            color: controller.notifier.text,
            fontSize: Get.height / 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        leading: MyBackButtons(context),
      ),
      bottomNavigationBar: MyBottomBar(
        context,
        "Next",
        () {
          Get.toNamed(Routes.PATIENT_DETAILS);
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width / 25,
          vertical: Get.height / 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Duration",
              style: TextStyle(
                color: controller.notifier.text,
                fontSize: Get.height / 40,
              ),
            ),
            SizedBox(height: Get.width / 70),
            MyDropdownButtonField(
              select: controller.selectvalue,
              items: const ['15 minute', '30 minute', '45 minute', '1 Houre'],
              onChanged: (value) {
                controller.selectvalue = value;
              },
              prefixIcon: Padding(
                padding: EdgeInsets.all(Get.height / 70),
                child: SvgPicture.asset(
                  "assets/images/clock.svg",
                  color: const Color(0xFF0165FC),
                  height: Get.height / 40,
                ),
              ),
            ),
            SizedBox(height: Get.height / 50),
            Text(
              "Select Package",
              style: TextStyle(
                color: controller.notifier.text,
                fontSize: Get.height / 40,
              ),
            ),
            SizedBox(height: Get.height / 70),
            ListView.separated(
              itemCount: controller.selectPackegeimag.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Obx(
                  () => Container(
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
                              controller.selectPackegeimag[index],
                              color: const Color(0xff0165FC),
                            ),
                          ),
                        ),
                        contentPadding: EdgeInsets.zero,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.selectPackagetitle[index],
                              style: TextStyle(
                                color: controller.notifier.text,
                                fontSize: Get.height / 60,
                              ),
                            ),
                            SizedBox(
                              width: Get.width / 8,
                              child: Text(
                                controller.selectPackageprice[index],
                                style: TextStyle(
                                  color: controller.notifier.text,
                                  fontSize: Get.height / 60,
                                ),
                              ),
                            ),
                          ],
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: Get.width / 2.6,
                              child: Text(
                                controller.selectPackagesubtitle[index],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: Get.height / 70,
                                ),
                              ),
                            ),
                            Text(
                              "/30 mins",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: Get.height / 70,
                              ),
                            ),
                          ],
                        ),
                        trailing: Radio(
                          hoverColor: Colors.transparent,
                          activeColor: const Color(0xFF0165FC),
                          value: index,
                          groupValue: controller.selectPackage.value,
                          onChanged: (value) {
                            controller.updateSelectPackagevalue(index);
                          },
                        ),
                        onTap: () {
                          controller.updateSelectPackagevalue(index);
                        },
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: Get.height / 40);
              },
            ),
          ],
        ),
      ),
    );
  }
}
