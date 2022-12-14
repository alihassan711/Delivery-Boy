import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserDetail {
  String id;
  String name;
  String email;
  String phone;
  String type;
  String address;
  String url;
  UserDetail({
    required this.email,
    required this.id,
    required this.name,
    required this.phone,
    required this.type,
    required this.address,
    required this.url,
  });
  UserfromSnap(DocumentSnapshot snapshot) {
    var snap = snapshot.data() as Map<String, dynamic>;
    return UserDetail(
      email: snap['id'],
      id: snap['id'],
      name: snap['name'],
      phone: snap['phone'],
      type: snap['type'],
      address: snap['address'],
      url: snap['url'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'phone': phone,
      'type': type,
      'address': address,
      'url': url,
    };
  }
}
