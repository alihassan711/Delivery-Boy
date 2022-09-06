import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/constant/Color.dart';

class EcoTextField extends StatelessWidget {
  String labeltext;
  TextEditingController controller;
  IconData? icon;
  bool? obsecure;
  Function()? onPressed;
  Function(String)? onChanged;
  String? Function(String?)? validator;
  BorderSide borderSide;
  Color? fillColor;
  IconData? imgIcon;
  Function()? onpressedImg;
  TextInputType? keyboardType;
  bool focus;

  EdgeInsetsGeometry? contentPadding;
  EcoTextField(
      {required this.labeltext,
      required this.controller,
      this.icon,
      this.obsecure,
      this.onChanged,
      this.onPressed,
      required this.validator,
      required this.borderSide,
      this.fillColor,
      this.imgIcon,
      this.onpressedImg,
      this.focus = false,
      this.contentPadding,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      validator: validator,
      autofocus: focus,
      onChanged: onChanged,
      obscureText: obsecure!,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        hintText: labeltext,
        labelStyle: TextStyle(color: Colors.grey),
        fillColor: fillColor,
        filled: true,
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: Abstract.btnColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: borderSide,
          borderRadius: BorderRadius.circular(25.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      controller: controller,
    );
  }
}
