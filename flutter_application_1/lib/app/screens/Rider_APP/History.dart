import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/constant/Color.dart';
import 'package:flutter_application_1/app/modules/home/controllers/LandingController.dart';
import 'package:flutter_application_1/app/routes/app_pages.dart';
import 'package:flutter_application_1/app/widget/PersonORderDetail.dart';
import 'package:flutter_application_1/app/widget/dottedLIne.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HisotryOrder extends GetView<LandingController> {
  HisotryOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    final today = DateFormat(
            "${date.year.toString()}-${date.month.toString()}-${date.day.toString()}")
        .format(date);
    print(
        "eeeeeeeee${date.year.toString()}-${date.month.toString()}-${date.day.toString()}");
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

                    return Column(
                      children: [
                        data['Order_comp_date'] == today
                            ? Column(
                                children: [
                                  PersonOrderDetails(
                                    OrderAmount: data["Order_amount"],
                                    delivery: data['Delivery'],
                                    orderId: data["Order_id"],
                                    paymentType: data['Payment_type'],
                                    pickUp: data["PickUp"],
                                    time: data['Order_comp_time'],
                                    userName: data["User_name"],
                                    phone: data["User_phone"],
                                    uid: "5fgDYXmpX8MdatjYpC9MfazZ65N2",
                                    status: data['status'],
                                    order: data['order'],
                                  )
                                ],
                              )
                            : Container()
                      ],
                    );
                  },
                )),
          Obx(
            () => controller.loader.value
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: controller.snapshot!.docs.length,
                    itemBuilder: (BuildContext context, int i) {
                      var data = controller.snapshot!.docs[i];
                      return data['order'] == true &&
                              data['Order_comp_date'] != today
                          ? Column(
                              children: [
                                PersonOrderDetails(
                                  OrderAmount: data["Order_amount"],
                                  delivery: data['Delivery'],
                                  orderId: data["Order_id"],
                                  paymentType: data['Payment_type'],
                                  pickUp: data["PickUp"],
                                  time: data['Order_comp_date'],
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
