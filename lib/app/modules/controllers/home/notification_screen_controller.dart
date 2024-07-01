import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:get/get.dart';

class NotificationScreenController extends GetxController {
  late ColorNotifier notifier;

  List icon = [
    "assets/images/appointmentsuccs.png",
    "assets/images/calendar.png",
    "assets/images/videocallappointment.png",
    "assets/images/appointmentsuccs.png",
    "assets/images/newpaypal.png",
    "assets/images/videocallappointment.png",
  ].obs;

  List text = [
    "Appointment Success",
    "Schedule Changed",
    "Video Call Appointment",
    "Appointment Cancelled",
    "New Paypal Added",
    "Video Call Appointment",
  ].obs;

  List subtext = [
    "Congratulations - your appointment is confirmed! We're looking forward to meeting with you.",
    "You have successfully changes your appointment with Dr. Joshua Doe. Don't forgot to active your reminder",
    "We'll send a link to join the call at the booking details, so all you need is a computer or mobile device with a camera and an internet connection.",
    "You have successfully cancelled your appointment with Dr. Joshua Doe. 90% the funds will be returned to your account.",
    "You Paypal has been successfully linked with your account.",
    "We'll send a link to join the call at the booking details, so all you need is a computer or mobile device with a camera and an internet connection.",
  ].obs;
}
