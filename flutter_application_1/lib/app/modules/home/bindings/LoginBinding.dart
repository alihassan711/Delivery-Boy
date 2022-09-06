import 'package:flutter_application_1/app/modules/home/controllers/LoginController.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
