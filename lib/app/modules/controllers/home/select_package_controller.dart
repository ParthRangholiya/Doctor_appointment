import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:get/get.dart';

class SelectPackageController extends GetxController {
  late ColorNotifier notifier;

  var selectPackage = 0.obs;

  final _selectvalue = '15 minute'.obs;
  get selectvalue => _selectvalue.value;
  set selectvalue(value) => _selectvalue.value = value;

  List time = ['15 minute', '30 minute', '45 minute', '1 Houre'].obs;

  List<String> selectPackegeimag = [
    "assets/images/reviewIcon.png",
    "assets/images/phoneIcon.png",
    "assets/images/videocallIcon.png",
    "assets/images/user.png",
  ].obs;

  List<String> selectPackagetitle = [
    "Messaging",
    "Voice Call",
    "Video Call",
    "In Person",
  ].obs;

  List<String> selectPackageprice = ["\$20", "\$40", "\$60", "\$100"].obs;

  List<String> selectPackagesubtitle = [
    "Chat with Doctor",
    "Voice call with doctor",
    "Video call with doctor",
    "In Person visit with doctor",
  ].obs;

  void updateSelectPackagevalue(int value) {
    selectPackage.value = value;
  }
}
