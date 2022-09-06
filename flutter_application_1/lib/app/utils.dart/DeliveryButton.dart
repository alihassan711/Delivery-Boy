import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryButton extends StatelessWidget {
  String text;
  Color textcolor;
  Color? color;
  String imgUrl;
  double width;
  BoxFit? fit;
  double height;
  bool isLoading;
  void Function() ontap;
  DeliveryButton({
    required this.text,
    required this.textcolor,
    this.color,
    this.imgUrl = "",
    this.fit,
    required this.ontap,
    required this.width,
    required this.height,
    this.isLoading = false,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      // splashColor: Colors.white,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Visibility(
                visible: isLoading ? false : true,
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                        color: textcolor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Visibility(
                visible: isLoading,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
