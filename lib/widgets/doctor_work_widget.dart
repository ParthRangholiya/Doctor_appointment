import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorWorkWidget extends StatefulWidget {
  const DoctorWorkWidget({super.key});

  @override
  State<DoctorWorkWidget> createState() => _DoctorWorkWidgetState();
}

class _DoctorWorkWidgetState extends State<DoctorWorkWidget> {
  late ColorNotifier notifier;

   List icons = [
    "assets/images/users.png",
    "assets/images/bag.png",
    "assets/images/starrating.png",
    "assets/images/reviewIcon.png",
  ];

  List text = ["7500+", "10+", "4.9+", "4,956"];

  List subtext = ["Patients", "Years Exp.", "Rating", "Review"];


  @override
  Widget build(BuildContext context) {
    notifier = Provider.of(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height / 8.3,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: icons.length,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return SizedBox(
            width: width / 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: height / 15,
                  padding: EdgeInsets.all(height / 70),
                  decoration: BoxDecoration(
                    color: notifier.getbluelightcolor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      icons[index],
                      color: const Color(0xff0165FC),
                    ),
                  ),
                ),
                Text(
                  text[index],
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff0165FC),
                    fontSize: height / 50,
                  ),
                ),
                Text(
                  subtext[index],
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: height / 60,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: width / 25);
        },
      ),
    );
  }
}
