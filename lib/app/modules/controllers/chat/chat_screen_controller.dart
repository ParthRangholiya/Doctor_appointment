import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:get/get.dart';

class ChatScreenController extends GetxController {
  late ColorNotifier notifier;

  List drimages = [
    "assets/images/drJacobJones.jpg",
    "assets/images/drRobertFox.jpg",
    "assets/images/drJaneCooper.png",
    "assets/images/images.png",
    "assets/images/doctor1.png",
    "assets/images/doctor2.png",
    "assets/images/dranshul.png",
  ].obs;

  List drname = [
    "Carla Schoen",
    "Mrs. Sheila Lemke",
    "Deanna Botsford V",
    "Mr. Katie Bergnaum",
    "Dr. Armoando Ferry",
    "Annette Fritsch",
    "Dr. Jane Cooper",
    "Dr. Robert Fox",
    "Dr. Jacob Jones",
  ].obs;

  List subtitle = [
    "Perfect, will check it",
    "Thanks",
    "Welcome!",
    "Good Morning!",
    "Can i check that?",
    "Thanks!",
    "Perfect, will check it",
    "Thanks",
    "Welcome!",
    "Good Morning!",
    "Can i check that?",
    "Thanks!",
    "Good Morning!",
  ];
}
