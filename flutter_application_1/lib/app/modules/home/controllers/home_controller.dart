import 'package:flutter_application_1/app/data/Services.dart';
import 'package:flutter_application_1/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    nextScren();
    UserNextScreen();
    super.onInit();
  }

  nextScren() async {
    var d = MyPrefferenc.getId();
    print("ccccccccc$d");
    await Future.delayed(
        const Duration(
          seconds: 3,
        ),
        () => d.isEmpty
            ? Get.offNamed(Routes.LOGINSCREEN)
            : Get.offNamed(Routes.LANDINGPAGE));
  }

  UserNextScreen() async {
    // var d = MyPrefferenc.getId();
    // print("ccccccccc$d");
    await Future.delayed(
        const Duration(
          seconds: 3,
        ),
        () => Get.offNamed(Routes.USERLOGIN));
  }
}
