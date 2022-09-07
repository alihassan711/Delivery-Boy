import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderDetailController extends GetxController {
  RxBool ischeck = false.obs;
  TextEditingController messgC = TextEditingController();
  RxBool check = false.obs;
  var d;
  // bool checking() {
  //   return
  // }

  @override
  void onInit() {
    d = Get.arguments;
    check.value = d[7];

    ischeck.value = d[8];
    print("view detail se wapis${d[7]}");

    super.onInit();
  }
}
