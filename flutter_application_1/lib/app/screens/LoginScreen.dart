import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/app/Authentications/FirebaseAuthentications.dart';
import 'package:flutter_application_1/app/constant/Color.dart';
import 'package:flutter_application_1/app/constant/EmailValidation.dart';
import 'package:flutter_application_1/app/data/Services.dart';
import 'package:flutter_application_1/app/modules/home/controllers/LoginController.dart';
import 'package:flutter_application_1/app/routes/app_pages.dart';
import 'package:flutter_application_1/app/utils.dart/DeliveryButton.dart';
import 'package:flutter_application_1/app/utils.dart/DeliveryTextfield.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: controller.loginformkey,
            child: Column(
              children: [
                Image.asset("images/delivery.png"),
                SizedBox(height: 30),
                const Text(
                  "LOGIN",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                DeliveryTextField(
                  labeltext: "Email",
                  controller: controller.emailC,
                  obsecure: false,
                  validator: (v) {
                    return validateEmail(v);
                  },
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                SizedBox(height: 20),
                Obx(
                  () => DeliveryTextField(
                    labeltext: "Password",
                    controller: controller.passwordC,
                    icon: controller.check.value
                        ? Icons.remove_red_eye
                        : Icons.visibility_off,
                    obsecure: controller.check.value ? false : true,
                    onPressed: () {
                      controller.check.value = !controller.check.value;
                    },
                    validator: (v) {
                      if (v!.length <= 5) {
                        return "Password greater then or Equal to 6";
                      }
                    },
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Obx(() => DeliveryButton(
                      isLoading: controller.isLoading.value,
                      textcolor: Colors.white,
                      ontap: () {
                        if (controller.loginformkey.currentState!.validate()) {
                          controller.isLoading.value = true;
                          MyPrefferenc.saveEmail(controller.emailC.text);
                          Authentications.SignIn(controller.emailC.text,
                              controller.passwordC.text);
                          controller.isLoading.value = false;
                        }
                      },
                      width: MediaQuery.of(context).size.width,
                      text: "Login",
                      height: 45,
                      color: Abstract.btnColor,
                    )),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "New to Logistics? ",
                      style: TextStyle(fontSize: 14),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.SIGNUP);
                      },
                      child: Container(
                        color: Colors.white,
                        height: 40,
                        width: 70,
                        child: Center(
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: Abstract.btnColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
