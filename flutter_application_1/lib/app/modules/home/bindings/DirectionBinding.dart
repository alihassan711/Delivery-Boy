import 'package:flutter_application_1/app/modules/home/controllers/DirectionController.dart';
import 'package:get/get.dart';

class DirectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DirectionController());
  }
}
