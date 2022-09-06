import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/constant/Color.dart';
import 'package:flutter_application_1/app/modules/home/controllers/LandingController.dart';
import 'package:flutter_application_1/app/routes/app_pages.dart';
import 'package:flutter_application_1/app/widget/dottedLIne.dart';
import 'package:get/get.dart';

class PersonOrderDetails extends GetView<LandingController> {
  String userName;
  DateTime time;
  String orderId;
  String OrderAmount;
  String paymentType;
  String pickUp;
  String delivery;
  String uid;
  String phone;
  bool status;
  bool order;
  PersonOrderDetails({
    required this.OrderAmount,
    required this.delivery,
    required this.orderId,
    required this.paymentType,
    required this.pickUp,
    required this.time,
    required this.userName,
    required this.phone,
    required this.uid,
    required this.status,
    required this.order,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            elevation: 0,
            child: Container(
              height: 290,
              child: Column(
                children: [
                  Container(
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.person_outline_outlined,
                                color: Abstract.lowColor,
                              ),
                              SizedBox(width: 5),
                              Text(
                                userName,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                Icons.timer_outlined,
                                color: Abstract.lowColor,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Time:",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "$time",
                                style: TextStyle(
                                  color: Abstract.lowColor,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomPaint(painter: DrawDottedhorizontalline()),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 60,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Order Id:",
                                  style: TextStyle(color: Abstract.lowColor),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  orderId,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        VerticalDivider(
                          thickness: 1,
                          indent: 15,
                          endIndent: 15,
                          color: Colors.grey,
                        ),
                        Expanded(
                          child: Container(
                            height: 60,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Order Amount:",
                                  style: TextStyle(color: Abstract.lowColor),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  OrderAmount,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        VerticalDivider(
                          thickness: 1,
                          indent: 15,
                          endIndent: 15,
                          color: Colors.grey,
                        ),
                        Expanded(
                          child: Container(
                            height: 60,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Payment Type",
                                  style: TextStyle(color: Abstract.lowColor),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  paymentType,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  CustomPaint(painter: DrawDottedhorizontalline()),
                  SizedBox(height: 5),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 80,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_off,
                                        size: 20,
                                      ),
                                      SizedBox(width: 3),
                                      Text(
                                        "Pick Up",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                    //
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 23),
                                    child: Text(
                                      pickUp,
                                      maxLines: 3,
                                      style:
                                          TextStyle(color: Abstract.lowColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        VerticalDivider(
                          thickness: 1,
                          indent: 15,
                          endIndent: 15,
                          color: Colors.grey,
                        ),
                        Expanded(
                          child: Container(
                            height: 80,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 7),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        size: 20,
                                      ),
                                      SizedBox(width: 2),
                                      Text(
                                        "Delivery",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                    //
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 23),
                                    child: Text(
                                      delivery,
                                      maxLines: 3,
                                      style:
                                          TextStyle(color: Abstract.lowColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  CustomPaint(painter: DrawDottedhorizontalline()),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 55,
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(
                                  Routes.ORDERDETAIL,
                                  arguments: [
                                    orderId,
                                    time,
                                    userName,
                                    delivery,
                                    phone,
                                    paymentType,
                                    uid,
                                    status,
                                    order,
                                  ],
                                )?.then((value) async {
                                  if (value[0]["backvalue"] == "true") {
                                    await controller.getData();
                                  }
                                });
                              },
                              child: Center(
                                child: Text(
                                  "View Details",
                                  style: TextStyle(
                                      color: Abstract.btnColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                        VerticalDivider(
                          thickness: 1,
                          indent: 15,
                          endIndent: 15,
                          color: Colors.grey,
                        ),
                        Expanded(
                          child: Container(
                            height: 55,
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(Routes.DIRECTIONSCREEN);
                              },
                              child: Center(
                                child: Text(
                                  "Get Directions",
                                  style: TextStyle(
                                      color: Abstract.btnColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
