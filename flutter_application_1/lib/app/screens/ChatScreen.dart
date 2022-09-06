import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/constant/Color.dart';

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
        stream: FirebaseFirestore.instance.collection("user").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.data == null) {
            return Center(child: CircularProgressIndicator());
          }
          int data1 = snapshot.data!.docs.length;
          print("as${data1}");
          List data = [];
          return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                if (snapshot.data!.docs[index]['type'] == "rider") {
                  for (var element in snapshot.data!.docs[index]['users']) {
                    data.add(element);
                  }
                }
                print("aaaaaaaa${data.length}");
                return snapshot.data!.docs[index]['type'] == "rider"
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Container(
                          height: 40,
                          child: Card(
                            elevation: 0,
                            child: Center(child: Text(data[index]['name'])),
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
