import 'package:doctor_appointment/widgets/buttons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../controllers/home/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);
    return Scaffold(
        backgroundColor: controller.notifier.getBgColor,
        appBar: AppBar(
          backgroundColor: controller.notifier.getBgColor,
          title: Text(
            'Category',
            style: TextStyle(
              color: controller.notifier.text,
              fontSize: Get.height / 40,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
          leading: MyBackButtons(context),
        ),
        body: GridView.builder(
          shrinkWrap: true,
          itemCount: controller.image.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: Get.width / 50,
            mainAxisSpacing: Get.height / 90,
            mainAxisExtent: Get.height / 9,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: Get.width / 25,
            vertical: Get.height / 50,
          ),
          itemBuilder: (context, index) {
            return SizedBox(
              width: Get.width / 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: Get.height / 13,
                    padding: EdgeInsets.all(Get.height / 70),
                    decoration: BoxDecoration(
                      color: controller.notifier.getbluelightcolor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset(
                        controller.image[index],
                        color: const Color(0xff0165FC),
                      ),
                    ),
                  ),
                  Text(
                    controller.name[index],
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: controller.notifier.text,
                      fontSize: Get.height / 55,
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
