import 'dart:async';

import 'package:flutter_application_1/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    nextScren();
    super.onInit();
  }

  nextScren() async {
    await Future.delayed(
        const Duration(
          seconds: 3,
        ),
        () => Get.offNamed(Routes.LOGINSCREEN));
  }
}
