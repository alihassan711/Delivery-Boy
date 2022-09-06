import 'package:flutter_application_1/app/modules/home/controllers/LoginController.dart';
import 'package:flutter_application_1/app/modules/home/controllers/ResetController.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class ResetBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ResetController());
  }
}
