import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  // SingUp Controller
  TextEditingController nameSC = TextEditingController();
  TextEditingController emailSC = TextEditingController();
  TextEditingController passwordSC = TextEditingController();
  TextEditingController phoneSC = TextEditingController();
  TextEditingController address = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool check = false.obs;

  var signupformkey = GlobalKey<FormState>();
}
