import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/constant/Color.dart';
import 'package:flutter_application_1/app/modules/home/controllers/LandingController.dart';
import 'package:flutter_application_1/app/routes/app_pages.dart';
import 'package:flutter_application_1/app/screens/DashBoard.dart';
import 'package:flutter_application_1/app/widget/PersonORderDetail.dart';
import 'package:flutter_application_1/app/widget/dottedLIne.dart';
import 'package:get/get.dart';

class HisotryOrder extends GetView<LandingController> {
  HisotryOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Abstract.btnColor,
          title: Text(
            "History",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                child: Text("Today"),
              ),
              Tab(
                child: Text("Older"),
              )
            ],
            controller: controller.tabController,
          ),
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: [
          Obx(() => controller.loader.value
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: controller.snapshot!.docs.length,
                  itemBuilder: (BuildContext context, int i) {
                    var data = controller.snapshot!.docs[i];
                    Timestamp timestamp = data["Order_time"] as Timestamp;
                    final DateTime dateTime = timestamp.toDate();
                    return data['order'] == true
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
                )),
          Obx(
            () => controller.loader.value
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: controller.snapshot!.docs.length,
                    itemBuilder: (BuildContext context, int i) {
                      var data = controller.snapshot!.docs[i];
                      Timestamp timestamp = data["Order_time"] as Timestamp;
                      final DateTime dateTime = timestamp.toDate();
                      return data['Order_com'] != DateTime.now()
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
                  ),
          ),
        ],
      ),
    );
  }
}
