import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/app/addData.dart';
import 'package:flutter_application_1/app/constant/Color.dart';
import 'package:flutter_application_1/app/modules/home/controllers/LandingController.dart';
import 'package:flutter_application_1/app/routes/app_pages.dart';
import 'package:flutter_application_1/app/widget/PersonORderDetail.dart';
import 'package:flutter_application_1/app/widget/dottedLIne.dart';
import 'package:get/get.dart';

class DashBoard extends GetView<LandingController> {
  DashBoard({Key? key}) : super(key: key);
  bool v = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.black26,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            backgroundColor: Abstract.btnColor,
            title: Text("Dashboard"),
            automaticallyImplyLeading: false,
            centerTitle: true,
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => AddDAta()));
                },
                child: Icon(Icons.abc),
              ),
            ],
          ),
        ),
        body: Obx(() => controller.loader.value
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : ListView.builder(
                itemCount: controller.snapshot!.docs.length,
                itemBuilder: (BuildContext context, int i) {
                  var data = controller.snapshot!.docs[i];
                  Timestamp timestamp = data["Order_time"] as Timestamp;
                  final DateTime dateTime = timestamp.toDate();

                  return data['order'] == false
                      ? Column(
                          children: [
                            PersonOrderDetails(
                              OrderAmount: data["Order_amount"],
                              delivery: data['Delivery'],
                              orderId: data["Order_id"],
                              paymentType: data['Payment_type'],
                              pickUp: data["PickUp"],
                              time: dateTime,
                              userName: data["User_name"],
                              phone: data["User_phone"],
                              uid: "5fgDYXmpX8MdatjYpC9MfazZ65N2",
                              status: data['status'],
                              order: data['order'],
                            )
                          ],
                        )
                      : Container();
                },
              )));
  }
}
