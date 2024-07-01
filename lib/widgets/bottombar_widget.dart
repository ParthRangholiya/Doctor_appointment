import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:doctor_appointment/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget MyBottomBar(context, String text, VoidCallback onPressed) {
  late ColorNotifier notifier;

  notifier = Provider.of(context, listen: true);
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  return Container(
    height: height / 10,
    padding: EdgeInsets.symmetric(
      horizontal: width / 20,
      vertical: height / 60,
    ),
    decoration: BoxDecoration(
      color: notifier.getBgColor,
      border: Border(
        top: BorderSide(
          color: notifier.getfillborder,
        ),
        left: BorderSide(
          color: notifier.getfillborder,
        ),
        right: BorderSide(
          color: notifier.getfillborder,
        ),
      ),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(width / 25),
        topRight: Radius.circular(width / 25),
      ),
    ),
    child: CustomButton(
      text: text,
      onPressed: onPressed,
      color: const Color(0xFF0165FC),
      textcolor: Colors.white,
      radius: BorderRadius.circular(width / 10),
    ),
  );
}
