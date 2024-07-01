import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class DoctorInfoWidget extends StatefulWidget {
  const DoctorInfoWidget({super.key, required this.name, required this.image});

  final String name;
  final String image;

  @override
  State<DoctorInfoWidget> createState() => _DoctorInfoWidgetState();
}

class _DoctorInfoWidgetState extends State<DoctorInfoWidget> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          children: [
            Container(
              height: height / 8,
              width: height / 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: notifier.getimagBgColor,
                image: DecorationImage(
                  image: AssetImage(widget.image),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: height / 80,
              child: SvgPicture.asset(
                "assets/images/shieldtrustIcon.svg",
                height: height / 40,
                color: const Color(0xff0165FC),
              ),
            ),
          ],
        ),
        SizedBox(
          width: width / 1.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.name,
                style: TextStyle(
                  fontSize: height / 45,
                  fontWeight: FontWeight.w500,
                  color: notifier.text,
                ),
              ),
              Text(
                "Dentist",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: height / 55,
                ),
              ),
              SizedBox(height: height / 80),
              Row(
                children: [
                  Image.asset(
                    "assets/images/location-pin.png",
                    color: const Color(0xff0165FC),
                    height: height / 55,
                  ),
                  Text(
                    " New York, United Stats ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: height / 55,
                    ),
                  ),
                  Image.asset(
                    "assets/images/unitedstate.png",
                    color: const Color(0xff0165FC),
                    height: height / 50,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
