import 'package:flutter_application_1/app/modules/home/controllers/LandingController.dart';
import 'package:flutter_application_1/app/modules/home/controllers/OrderDetailController.dart';
import 'package:get/get.dart';

class OrderDetailBindig extends Bindings {
  @override
  void dependencies() {
    Get.put(OrderDetailController());
  }
}
