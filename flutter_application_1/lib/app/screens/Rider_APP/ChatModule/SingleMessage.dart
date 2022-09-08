// import 'package:audioplayer/audioplayer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/constant/Color.dart';

class Message extends StatefulWidget {
  QueryDocumentSnapshot<Object?> data;

  Message({
    required this.data,
  });

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  bool isRecording = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var d = widget.data['reciverId'] == FirebaseAuth.instance.currentUser!.uid;
    return Align(
      alignment: d ? Alignment.bottomRight : Alignment.bottomLeft,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(
          color: d ? Abstract.btnColor : Colors.black12,
          borderRadius:
              d ? BorderRadius.circular(10) : BorderRadius.circular(7),
        ),
        constraints: BoxConstraints(
            maxWidth: size.width / 2, maxHeight: size.height / 2),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 07, vertical: 5),
          child: Container(
            child: Text(
              widget.data["message"],
              style: TextStyle(
                  fontSize: 16, color: d ? Colors.white : Colors.black),
            ),
          ),
        ),
      ),
    ); //
  }
}
