import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/constant/Color.dart';
import 'package:flutter_application_1/app/modules/home/bindings/LandingPageBinding.dart';
import 'package:flutter_application_1/app/modules/home/controllers/LandingController.dart';
import 'package:flutter_application_1/app/modules/home/controllers/OrderDetailController.dart';
import 'package:flutter_application_1/app/screens/Rider_APP/ChatModule/SingleMessage.dart';
import 'package:flutter_application_1/app/utils.dart/DeliveryTextfield.dart';
import 'package:flutter_application_1/app/utils.dart/MessageTextField.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UserChatScreen extends GetView<LandingController> {
  UserChatScreen({super.key});
  var d = Get.arguments;
  String? message;

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
      appBar: AppBar(
        backgroundColor: Abstract.btnColor,
        title: Text("${d[0]}"),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("user")
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection("messages")
                    .doc(d[1])
                    .collection("chat")
                    .orderBy('date', descending: true)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.data == null) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                    physics: BouncingScrollPhysics(),
                    // controller: controller.controller2,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Message(
                          data: snapshot.data!.docs[i],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          Container(
            height: 70,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: EcoTextField(
                  labeltext: "Write a Message here..",
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 10.0),
                  controller: controller.messgC,
                  validator: (v) {},
                  borderSide: BorderSide.none,
                  obsecure: false,
                  icon: Icons.send,
                  onPressed: () async {
                    if (controller.messgC.text.isNotEmpty) {
                      FirebaseFirestore.instance
                          .collection("messages")
                          .doc(d[1] + FirebaseAuth.instance.currentUser!.uid)
                          .set({
                        "id": d[1],
                        "name": d[0],
                        "rider_id": FirebaseAuth.instance.currentUser!.uid,
                        "url": "",
                        "time": time,
                        "date": datee
                      });
                      message = controller.messgC.text;
                      controller.messgC.clear();
                      await FirebaseFirestore.instance
                          .collection("user")
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .collection("messages")
                          .doc(d[1])
                          .collection("chat")
                          .add({
                        "message": message,
                        'reciverId': d[1],
                        'senderId': FirebaseAuth.instance.currentUser!.uid,
                        'date': DateTime.now()
                      }).then((value) => {
                                FirebaseFirestore.instance
                                    .collection("user")
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .collection("messages")
                                    .doc(d[1])
                                    .set({
                                  'last_msg': message,
                                  'reciverId': d[1],
                                })
                              });
                      await FirebaseFirestore.instance
                          .collection("user")
                          .doc("5fgDYXmpX8MdatjYpC9MfazZ65N2")
                          .collection("messages")
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .collection("chat")
                          .add({
                        "message": message,
                        'reciverId': FirebaseAuth.instance.currentUser!.uid,
                        'senderId': "5fgDYXmpX8MdatjYpC9MfazZ65N2",
                        'date': DateTime.now()
                      }).then(
                        (value) => {
                          FirebaseFirestore.instance
                              .collection("user")
                              .doc(d[1])
                              .collection("messages")
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .set({
                            'last_msg': message,
                            "reciverId": FirebaseAuth.instance.currentUser!.uid,
                          })
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
