import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../controllers/home/doctor_details_controller.dart';

class AboutTextView extends GetView<DoctorDetailsController> {
  const AboutTextView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About",
          style: TextStyle(
            color: controller.notifier.text,
            fontSize: Get.height / 40,
          ),
        ),
        Obx(
          () => RichText(
            text: TextSpan(
              text:
                  'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Atque, earum blanditiis eos itaque possimus excepturi ',
              style: TextStyle(
                color: Colors.grey,
                fontSize: Get.height / 55,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: controller.isReadMore != false
                      ? 'Harum fugiat officia architecto magnam omnis, ut, exercitationem amet unde qui, provident repellat. Fuga, numquam.'
                      : "",
                ),
                TextSpan(
                  text:
                      controller.isReadMore == false ? 'Readmore' : 'Show less',
                  style: const TextStyle(
                    color: Color(0xff0165FC),
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      controller.isReadMore = !controller.isReadMore;
                    },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
