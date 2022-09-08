import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class LandingController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxInt bottomTabIndex = 0.obs;
  RxBool chnage = false.obs;
  void changeTabIndex(int index) {
    bottomTabIndex.value = index;
  }

  QuerySnapshot? snapshot;
  RxBool loader = false.obs;
  late TabController tabController;
  @override
  void onInit() async {
    await getData();
    super.onInit();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  Future getData() async {
    loader.value = true;
    snapshot = await FirebaseFirestore.instance
        .collection("order")
        .get()
        .whenComplete(() => {loader.value = false});
  }

  // Profile
  RxString reload = "".obs;
  var dowurl;
  final ImagePicker picker = ImagePicker();
  Reference ref = FirebaseStorage.instance.ref().child("images/");
  Future upLoadPic() async {
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    await ref.putData(await image!.readAsBytes());
    dowurl = await ref.getDownloadURL();
    SettableMetadata(contentType: "images/jpeg");
  }

  RxBool ischeck = false.obs;
  TextEditingController messgC = TextEditingController();
  RxBool check = false.obs;
}
