import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/constant/Color.dart';

class DeliveryTextField extends StatelessWidget {
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
  DeliveryTextField(
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          keyboardType: keyboardType,
          validator: validator,
          autofocus: focus,
          onChanged: onChanged,
          obscureText: obsecure!,
          decoration: InputDecoration(
            hintText: labeltext,
            labelStyle: TextStyle(color: Colors.grey),
            fillColor: fillColor,
            contentPadding: contentPadding,
            filled: true,
            suffixIcon: InkWell(
              onTap: onPressed,
              child: Icon(
                icon,
                color: Abstract.btnColor,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(8.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          controller: controller,
        ),
      ),
    );
  }
}
