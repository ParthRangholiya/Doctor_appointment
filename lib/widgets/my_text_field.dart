import 'package:doctor_appointment/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class MyTextField extends StatefulWidget {
  final String? titletext;
  final TextInputType type;
  final String hintText;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final List<TextInputFormatter>? inputFormatter;
  final ValueChanged<String>? onChanged;
  final String? initialValue;

  const MyTextField({
    super.key,
    this.titletext,
    required this.type,
    required this.hintText,
    required this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText,
    this.inputFormatter,
    this.onChanged,
    this.initialValue,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
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
        TextFormField(
          initialValue: widget.initialValue ?? "",
          keyboardType: widget.type,
          obscureText: widget.obscureText ?? false,
          inputFormatters: widget.inputFormatter ?? [],
          cursorColor: const Color(0xff0165FC),
          style: TextStyle(color: notifier.text),
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: width / 40),
            filled: true,
            fillColor: notifier.getBgColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(height / 90),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: notifier.getfillborder,
              ),
              borderRadius: BorderRadius.circular(height / 90),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xff0165FC),
              ),
              borderRadius: BorderRadius.circular(height / 90),
            ),
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontSize: height / 55,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
