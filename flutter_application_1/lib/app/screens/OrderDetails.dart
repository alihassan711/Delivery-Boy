import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/app/constant/Color.dart';
import 'package:flutter_application_1/app/modules/home/controllers/LandingController.dart';
import 'package:flutter_application_1/app/modules/home/controllers/OrderDetailController.dart';
import 'package:flutter_application_1/app/routes/app_pages.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderDetail extends GetView<OrderDetailController> {
  OrderDetail({Key? key}) : super(key: key);
  var d = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    final time = DateFormat(
            "${date.hour.toString()}-${date.minute.toString()}-${date.minute.toString()}")
        .format(date);
    final datee = DateFormat(
            "${date.year.toString()}-${date.month.toString()}-${date.day.toString()}")
        .format(date);
    return Scaffold(
      bottomSheet: Container(
        color: Abstract.btnColor,
        height: 60,
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    FlutterPhoneDirectCaller.callNumber(d[4]);
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    child: Center(
                      child: Text(
                        "Call",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
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
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.DIRECTIONSCREEN);
                  },
                  child: Text(
                    "Get Direction",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130),
        child: Container(
          color: Abstract.btnColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBar(
                leading: GestureDetector(
                  onTap: () {
                    Get.back(result: [
                      {"backvalue": "true"}
                    ]);
                  },
                  child: Container(
                      child: Center(child: Icon(Icons.arrow_back_ios))),
                ),
                backgroundColor: Abstract.btnColor,
                title: Text(d[0]),
                centerTitle: true,
                elevation: 0,
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.USERCHATSCREEN,
                            arguments: [d[2], d[6]]);
                      },
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(),
                        child: Image.asset(
                          "images/icon.png",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Text(
                "Delivery Time",
                style: TextStyle(color: Colors.white60),
              ),
              SizedBox(height: 5),
              Text(
                "${d[1]}",
                style: TextStyle(color: Colors.white, fontSize: 25),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 70,
                  child: Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Order Picked Up",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Obx(
                            () => FlutterSwitch(
                              width: 43.0,
                              height: 25.0,
                              valueFontSize: 15.0,
                              toggleSize: 20.0,
                              borderRadius: 40.0,
                              padding: 2.0,
                              activeColor: Abstract.btnColor,
                              value: controller.check.value,
                              onToggle: (v) async {
                                controller.check.value = true;

                                if (controller.check.value = true) {
                                  d[7] = controller.check.value;

                                  if (d[7] == true) {
                                    print("oooooo${d[0]}");
                                    await FirebaseFirestore.instance
                                        .collection('order')
                                        .doc(d[0])
                                        .update({
                                      'status': true,
                                    });
                                  }
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 70,
                  child: Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Order Delivered",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Obx(
                            () => FlutterSwitch(
                              width: 43.0,
                              height: 25.0,
                              valueFontSize: 15.0,
                              toggleSize: 20.0,
                              borderRadius: 40.0,
                              padding: 2.0,
                              activeColor: Abstract.btnColor,
                              value: controller.ischeck.value,
                              onToggle: (v) async {
                                if (controller.check.value == true) {
                                  controller.ischeck.value = true;
                                  d[8] = controller.check.value;

                                  await FirebaseFirestore.instance
                                      .collection('order')
                                      .doc(d[0])
                                      .update({
                                    'order': true,
                                    "Order_comp_time": time,
                                    "Order_comp_date": datee,
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Delivery Details",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 260,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15),
                          Text(
                            d[2],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 15),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Abstract.btnColor,
                                size: 20,
                              ),
                              SizedBox(width: 14),
                              Text(
                                "Address",
                                style: TextStyle(color: Abstract.lowColor),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: Text(
                              d[3],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 5),
                          Divider(
                            indent: 5,
                            endIndent: 10,
                            color: Colors.black12,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.phone,
                                color: Abstract.btnColor,
                                size: 20,
                              ),
                              SizedBox(width: 14),
                              Text(
                                "Mobile",
                                style: TextStyle(color: Abstract.lowColor),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: Text(
                              d[4],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 5),
                          Divider(
                            indent: 5,
                            endIndent: 10,
                            color: Colors.black12,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.payment,
                                color: Abstract.btnColor,
                                size: 20,
                              ),
                              SizedBox(width: 14),
                              Text(
                                "Payment Type",
                                style: TextStyle(color: Abstract.lowColor),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: Text(
                              d[5],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 5),
                          Divider(
                            indent: 5,
                            endIndent: 10,
                            color: Colors.black12,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
