import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/app/utils.dart/DeliveryButton.dart';
import 'package:flutter_application_1/app/utils.dart/DeliveryTextfield.dart';
import 'package:flutter_switch/flutter_switch.dart';

class AddDAta extends StatefulWidget {
  @override
  State<AddDAta> createState() => _AddDAtaState();
}

class _AddDAtaState extends State<AddDAta> {
  TextEditingController delivery = TextEditingController();
  TextEditingController orderAmound = TextEditingController();
  TextEditingController OrderID = TextEditingController();
  TextEditingController paymentType = TextEditingController();
  TextEditingController pickUp = TextEditingController();
  TextEditingController productid = TextEditingController();
  TextEditingController productName = TextEditingController();
  TextEditingController productQuality = TextEditingController();
  TextEditingController riderID = TextEditingController();
  TextEditingController userID = TextEditingController();
  TextEditingController userNAme = TextEditingController();
  TextEditingController userphone = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool order = false;
  bool status = false;
  var data = 12345;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DeliveryTextField(
                  labeltext: "Deliver",
                  controller: delivery,
                  validator: (v) {},
                  borderSide: BorderSide.none,
                  obsecure: false,
                ),
                DeliveryTextField(
                  labeltext: "OrderAmount",
                  controller: orderAmound,
                  validator: (v) {},
                  borderSide: BorderSide.none,
                  obsecure: false,
                ),
                DeliveryTextField(
                  labeltext: "paymentType",
                  controller: paymentType,
                  validator: (v) {},
                  borderSide: BorderSide.none,
                  obsecure: false,
                ),
                DeliveryTextField(
                  labeltext: "pickUp",
                  controller: pickUp,
                  validator: (v) {},
                  borderSide: BorderSide.none,
                  obsecure: false,
                ),
                DeliveryTextField(
                  labeltext: "productid",
                  controller: productid,
                  validator: (v) {},
                  borderSide: BorderSide.none,
                  obsecure: false,
                ),
                DeliveryTextField(
                  labeltext: "productName",
                  controller: productName,
                  validator: (v) {},
                  borderSide: BorderSide.none,
                  obsecure: false,
                ),
                DeliveryTextField(
                  labeltext: "productQuality",
                  controller: productQuality,
                  validator: (v) {},
                  borderSide: BorderSide.none,
                  obsecure: false,
                ),
                DeliveryTextField(
                  labeltext: "riderID",
                  controller: riderID,
                  validator: (v) {},
                  borderSide: BorderSide.none,
                  obsecure: false,
                ),
                DeliveryTextField(
                  labeltext: "userID",
                  controller: userID,
                  validator: (v) {},
                  borderSide: BorderSide.none,
                  obsecure: false,
                ),
                DeliveryTextField(
                  labeltext: "userNAme",
                  controller: userNAme,
                  validator: (v) {},
                  borderSide: BorderSide.none,
                  obsecure: false,
                ),
                DeliveryTextField(
                  labeltext: "userphone",
                  controller: userphone,
                  validator: (v) {},
                  borderSide: BorderSide.none,
                  obsecure: false,
                ),
                FlutterSwitch(
                    value: status,
                    onToggle: (v) {
                      setState(() {
                        status = !status;
                      });
                    }),
                FlutterSwitch(
                    value: order,
                    onToggle: (v) {
                      setState(() {
                        order = !order;
                      });
                    }),
                DeliveryButton(
                  text: "Submit",
                  textcolor: Colors.black,
                  ontap: () async {
                    await FirebaseFirestore.instance.collection("order").add({
                      "Delivery": delivery.text,
                      "Order_amount": orderAmound.text,
                      "Order_id": data++,
                      "Order_time": DateTime.now(),
                      "Payment_type": paymentType.text,
                      "PickUp": pickUp.text,
                      "Product_id": "2131231321",
                      "Product_name": productName.text,
                      "Product_quantity": productQuality.text,
                      "Rider_id": riderID.text,
                      "User_id": userID.text,
                      "User_name": userNAme.text,
                      "User_phone": userphone.text,
                      "order": order,
                      "status": status,
                    });
                    print("object");
                  },
                  width: 90,
                  height: 30,
                  color: Colors.amber,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
