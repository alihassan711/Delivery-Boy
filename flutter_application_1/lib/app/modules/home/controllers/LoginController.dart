import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/app/routes/app_pages.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // Login Controller
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  RxBool check = false.obs;
  var loginformkey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
}
