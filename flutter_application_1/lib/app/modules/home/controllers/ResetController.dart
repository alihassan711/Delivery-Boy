import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ResetController extends GetxController {
  TextEditingController oldC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController repasswordC = TextEditingController();
  RxBool check = false.obs;
  RxBool recheck = false.obs;
  RxBool reischeck = false.obs;
  var formkey = GlobalKey<FormState>();
}
