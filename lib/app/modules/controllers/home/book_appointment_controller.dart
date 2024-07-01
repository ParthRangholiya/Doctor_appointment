import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:get/get.dart';

class BookAppointmentController extends GetxController {
  late ColorNotifier notifier;

  final String drphoto = Get.arguments["drphoto"];
  final String drname = Get.arguments["drname"];

  @override
  void onInit() {
    selectday = days[0];
    selectTime = times[0];
    super.onInit();
  }

  final _selectday = "".obs;
  get selectday => _selectday.value;
  set selectday(value) => _selectday.value = value;

  final _selectTime = "".obs;
  get selectTime => _selectTime.value;
  set selectTime(value) => _selectTime.value = value;

  List<String> days = [
    "Today",
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
  ].obs;

  List<String> date = [
    "4 Oct",
    "5 Oct",
    "6 Oct",
    "7 Oct",
    "8 Oct",
    "9 Oct",
    "10 Oct",
    "11 Oct",
  ].obs;

  List times = [
    "7:00 PM",
    "7:30 PM",
    "8:00 PM",
    "8:30 PM",
    "9:00 PM",
    "9:30 PM",
    "10:00 PM",
    "10:30 PM",
    "11:00 PM",
    "11:30 PM",
  ].obs;

  onchangedays(value) {
    selectday = value.toString();
  }

  onchnagetime(value) {
    selectTime = value.toString();
  }
}
