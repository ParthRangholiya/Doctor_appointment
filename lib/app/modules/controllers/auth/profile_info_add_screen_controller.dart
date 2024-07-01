import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileInfoAddScreenController extends GetxController {
  late ColorNotifier notifier;

  TextEditingController namecontroller = TextEditingController();

  final _selectImage = Rx<XFile?>(null);

  XFile? get selectImage => _selectImage.value;
  set selectImage(XFile? value) => _selectImage.value = value;
  ImagePicker picker = ImagePicker();

  final _gender = ["Male", "Female"].obs;
  List<String> get gender => _gender;
  set gender(List<String> value) => _gender.value = value;

  var selectedValue = "Male".obs;

  void setSelected(String value) {
    selectedValue.value = value;
  }

  Future pickedImage(ImageSource sources) async {
    try {
      final picked = await picker.pickImage(source: sources);

      if (picked != null) {
        selectImage = picked;
      } else {
        debugPrint("did not pick an image!!");
      }
    } catch (e) {
      debugPrint("=======================${e.toString()}");
    }
  }

  void showimagepicker(context) {
    List selectimagetypes = ["Gallery", "Camera"];

    List<IconData> icons = [Icons.photo, Icons.camera];

    Get.bottomSheet(
      Container(
        height: Get.height / 9,
        width: Get.width,
        decoration: BoxDecoration(
          color: notifier.getcontainer,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Get.height / 35),
            topRight: Radius.circular(Get.height / 35),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: Get.height / 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListView.separated(
                itemCount: selectimagetypes.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          index == 0
                              ? pickedImage(ImageSource.gallery)
                              : pickedImage(ImageSource.camera);
                          Get.back();
                        },
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: Get.width / 30),
                          padding: EdgeInsets.all(Get.width / 60),
                          decoration: const BoxDecoration(
                            color: Color(0xFF0165FC),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            icons[index],
                            color: const Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                      Text(
                        selectimagetypes[index],
                        style: TextStyle(
                          fontSize: Get.height / 60,
                          color: notifier.text,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return VerticalDivider(
                    endIndent: Get.height / 90,
                    indent: Get.height / 90,
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
