import 'package:get/get.dart';

import '../../../theme/theme.dart';

class CategoryController extends GetxController {
  late ColorNotifier notifier;

  List image = [
    "assets/images/dentistIcon.png",
    "assets/images/cardiologyIcon.png",
    "assets/images/orthopedicIcon.png",
    "assets/images/neurologicalIcon.png",
    "assets/images/otology.png",
    "assets/images/gastroen.png",
    "assets/images/rhinology.png",
    "assets/images/utologys.png",
    "assets/images/plumonol.png",
    "assets/images/hepatolo.png",
    "assets/images/gynecolo.png",
    "assets/images/osteolog.png",
    "assets/images/otology1.png",
    "assets/images/plastics.png",
    "assets/images/radiolog.png",
    "assets/images/instestine.png",
    "assets/images/pediatric.png",
    "assets/images/Naturopa.png",
    "assets/images/herbal.png",
    "assets/images/general.png",
  ].obs;

  List name = [
    "Dentist",
    "Cardiologist",
    "Orthopedic",
    "Neurological",
    "Otology",
    "Gastroenterologist",
    "Rhinologist",
    "Utologist",
    "Pulmonologist",
    "hepatologist",
    "gynecologist",
    "osteolysis",
    "Otology",
    "plastic surgery",
    "radiologist",
    "intestinal surgery",
    "pediatric",
    "Naturopathy",
    "herbal",
    "General",
  ].obs;
}
