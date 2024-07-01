import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:get/get.dart';

class PatientDetailsController extends GetxController {
  late ColorNotifier notifier;

  final _selectperson = 'Self'.obs;
  get selectperson => _selectperson.value;
  set selectperson(value) => _selectperson.value = value;

  final _selectgender = 'Male'.obs;
  get selectgender => _selectgender.value;
  set selectgender(value) => _selectgender.value = value;

  final _selectage = '24 Years'.obs;
  get selectage => _selectage.value;
  set selectage(value) => _selectage.value = value;
}
