import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDropdownButtonField extends StatefulWidget {
  final String? titletext;
  final String select;
  final List<String> items;
  final Widget? prefixIcon;
  final ValueChanged onChanged;
  const MyDropdownButtonField({
    super.key,
    this.titletext,
    required this.select,
    required this.items,
    this.prefixIcon,
    required this.onChanged,
  });

  @override
  State<MyDropdownButtonField> createState() => _MyDropdownButtonFieldState();
}

class _MyDropdownButtonFieldState extends State<MyDropdownButtonField> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.titletext != null
            ? Text(
                widget.titletext ?? "",
                style: TextStyle(
                  fontSize: height / 65,
                  color: notifier.text,
                ),
                textAlign: TextAlign.left,
              )
            : Container(),
        widget.titletext != null ? SizedBox(height: width / 80) : Container(),
        DropdownButtonFormField<String>(
          value: widget.select,
          style: TextStyle(
            color: notifier.text,
          ),
          dropdownColor: notifier.getBgColor,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Color(0xFF0165FC),
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: width / 40,
            ),
            prefixIcon: widget.prefixIcon,
            filled: true,
            fillColor: notifier.getBgColor,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: notifier.getfillborder,
              ),
              borderRadius: BorderRadius.circular(height / 90),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFF0165FC),
              ),
              borderRadius: BorderRadius.circular(height / 90),
            ),
          ),
          onChanged: widget.onChanged,
          items: widget.items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
