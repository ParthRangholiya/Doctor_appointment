import 'package:doctor_appointment/app/routes/app_pages.dart';
import 'package:doctor_appointment/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../controllers/home/doctor_details_controller.dart';

class ReviewsView extends GetView<DoctorDetailsController> {
  const ReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width / 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Reviews",
                style: TextStyle(
                  color: controller.notifier.text,
                  fontSize: Get.height / 40,
                ),
              ),
              GestureDetector(
                onTap: () => Get.toNamed(Routes.HOSPITAL_REVIEW_SCREEN),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/edit.png",
                      height: Get.height / 50,
                      color: const Color(0xFF0165FC),
                    ),
                    Text(
                      " add review",
                      style: TextStyle(
                        color: const Color(0xff0165FC),
                        fontSize: Get.height / 55,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width / 25),
          child: MyTextField(
            type: TextInputType.name,
            hintText: "Search in reviews",
            controller: controller.searchcontroller,
            prefixIcon: Container(
              padding: EdgeInsets.all(Get.width / 40),
              height: Get.height / 70,
              child: Image.asset(
                "assets/images/searchIcon.png",
                color: const Color(0xFF0165FC),
              ),
            ),
          ),
        ),
        SizedBox(height: Get.height / 50),
        Row(
          children: [
            Obx(
              () => Padding(
                padding: EdgeInsets.only(left: Get.width / 25),
                child: Container(
                  height: Get.height / 25,
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.width / 40,
                    vertical: 0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Get.width / 10),
                    border: Border.all(
                      color: controller.notifier.getfillborder,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: controller.selectedValue.value == 'Filter'
                          ? null
                          : controller.selectedValue.value,
                      hint: Row(
                        children: [
                          Image.asset(
                            "assets/images/menu.png",
                            color: controller.notifier.text,
                            height: Get.height / 60,
                          ),
                          SizedBox(width: Get.width / 98),
                          Text(
                            controller.selectedValue.value,
                            style: TextStyle(
                              color: controller.notifier.text,
                              fontSize: Get.height / 55,
                            ),
                          ),
                        ],
                      ),
                      icon: const Icon(Icons.arrow_drop_down),
                      items: controller.items.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          controller.updateSelectedValue(newValue);
                        }
                      },
                      dropdownColor: controller.notifier.getBgColor,
                      style: TextStyle(
                        color: controller.notifier.text,
                        fontSize: Get.height / 55,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: Get.height / 25,
                width: Get.width,
                child: ListView.separated(
                  itemCount: controller.buttontext.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: Get.width / 40),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Obx(
                      () => OutlinedButton(
                        onPressed: () {
                          controller.addlistvalue(index);
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor:
                              controller.buttonselect.contains(index)
                                  ? const Color(0xFF0165FC)
                                  : controller.notifier.getBgColor,
                          side: BorderSide(
                            color: controller.buttonselect.contains(index)
                                ? const Color(0xFF0165FC)
                                : controller.notifier.getfillborder,
                          ),
                          minimumSize: Size(Get.width / 4, Get.height / 25),
                        ),
                        child: Text(
                          controller.buttontext[index],
                          style: TextStyle(
                            fontSize: Get.height / 60,
                            color: controller.buttonselect.contains(index)
                                ? Colors.white
                                : controller.notifier.text,
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: Get.width / 50);
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
