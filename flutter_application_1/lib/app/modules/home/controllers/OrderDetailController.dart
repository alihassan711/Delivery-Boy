import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OrderDetailController extends GetxController {
  RxBool ischeck = false.obs;
  TextEditingController messgC = TextEditingController();
  RxBool check = false.obs;
  var d;

  @override
  void onInit() {
    d = Get.arguments;
    check.value = d[7];
    ischeck.value = d[8];
    super.onInit();
  }
}
