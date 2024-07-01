import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:get/get.dart';

class PaymentMethodsController extends GetxController {
  late ColorNotifier notifier;

  bool payment = Get.arguments["boolean"];

  var selectpaymethod = 0.obs;

  void updateSelectpaymethodevalue(int value) {
    selectpaymethod.value = value;
  }
}
