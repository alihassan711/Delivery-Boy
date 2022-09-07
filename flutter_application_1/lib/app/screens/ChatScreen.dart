import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/constant/Color.dart';
import 'package:flutter_application_1/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Abstract.btnColor,
        title: Text(
          "Inbox",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("messages").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.data == null) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int i) {
                return snapshot.data!.docs[i]['rider_id'] ==
                        FirebaseAuth.instance.currentUser!.uid
                    ? InkWell(
                        onTap: () {
                          Get.toNamed(
                            Routes.USERCHATSCREEN,
                            arguments: [
                              snapshot.data!.docs[i]['name'],
                              snapshot.data!.docs[i]['id'],
                            ],
                          );
                        },
                        child: Container(
                          height: 70,
                          child: Card(
                            elevation: 0,
                            child: Center(
                              child: Row(
                                children: [
                                  SizedBox(width: 5),
                                  // CircleAvatar(
                                  //   backgroundColor: Colors.white,
                                  //   radius: 25,
                                  //   child: data[0]['url'] == ""
                                  //       ? Image.asset(
                                  //           "images/profile1.png")
                                  //       : Image.network(
                                  //           data[i]['url']),
                                  // ),
                                  SizedBox(width: 15),
                                  Text(
                                    snapshot.data!.docs[i]['name'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container();
              });
        },
      ),
    );
  }
}

class User {
  String? id;
  String? name;
  String? url;
  User({
    this.id,
    this.name,
    this.url,
  });
}
