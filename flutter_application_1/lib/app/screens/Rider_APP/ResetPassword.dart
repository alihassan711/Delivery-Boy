import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/app/Authentications/FirebaseAuthentications.dart';
import 'package:flutter_application_1/app/constant/Color.dart';
import 'package:flutter_application_1/app/modules/home/controllers/LandingController.dart';
import 'package:flutter_application_1/app/modules/home/controllers/ResetController.dart';
import 'package:flutter_application_1/app/routes/app_pages.dart';
import 'package:flutter_application_1/app/utils.dart/DeliveryButton.dart';
import 'package:flutter_application_1/app/utils.dart/DeliveryTextfield.dart';
import 'package:get/get.dart';

class ResetPassword extends GetView<ResetController> {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Abstract.btnColor,
        title: Text("Profile"),
        centerTitle: true,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            height: 30,
            width: 50,
            child: Center(
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 20,
              ),
            ),
          ),
        ),
      ),
      body: Form(
        key: controller.formkey,
        child: Column(
          children: [
            SizedBox(height: 20),
            Obx(
              () => DeliveryTextField(
                labeltext: "Old Password",
                controller: controller.oldC,
                icon: controller.check.value
                    ? Icons.remove_red_eye
                    : Icons.visibility_off,
                obsecure: controller.check.value ? false : true,
                onPressed: () {
                  controller.check.value = !controller.check.value;
                },
                validator: (v) {
                  // return validateEmail(v);
                },
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
            SizedBox(height: 10),
            Obx(
              () => DeliveryTextField(
                labeltext: "New Password",
                controller: controller.passwordC,
                icon: controller.recheck.value
                    ? Icons.remove_red_eye
                    : Icons.visibility_off,
                obsecure: controller.recheck.value ? false : true,
                onPressed: () {
                  controller.recheck.value = !controller.recheck.value;
                },
                validator: (v) {
                  if (v!.length <= 5) {
                    return "correct";
                  }
                },
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
            SizedBox(height: 10),
            Obx(
              () => DeliveryTextField(
                labeltext: "Confirm Password",
                controller: controller.repasswordC,
                icon: controller.reischeck.value
                    ? Icons.remove_red_eye
                    : Icons.visibility_off,
                obsecure: controller.reischeck.value ? false : true,
                onPressed: () {
                  controller.reischeck.value = !controller.reischeck.value;
                },
                validator: (v) {
                  if (controller.passwordC.text !=
                      controller.repasswordC.text) {
                    return "Does not match";
                  }
                },
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
            SizedBox(height: 20),
            DeliveryButton(
              textcolor: Colors.white,
              ontap: () {
                if (controller.formkey.currentState!.validate()) {
                  Authentications.changePassword(
                          controller.oldC.text, controller.passwordC.text)
                      .whenComplete(() {
                    controller.oldC.clear();
                    controller.passwordC.clear();
                    controller.repasswordC.clear();
                  });
                }
              },
              width: MediaQuery.of(context).size.width,
              text: "Change Password",
              height: 50,
              color: Abstract.btnColor,
            )
          ],
        ),
      ),
    );
  }
}
