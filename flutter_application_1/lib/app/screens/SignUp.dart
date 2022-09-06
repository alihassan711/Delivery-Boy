import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/app/Authentications/FirebaseAuthentications.dart';
import 'package:flutter_application_1/app/UserModel/UserModel.dart';
import 'package:flutter_application_1/app/constant/Color.dart';
import 'package:flutter_application_1/app/constant/EmailValidation.dart';
import 'package:flutter_application_1/app/modules/home/controllers/LoginController.dart';
import 'package:flutter_application_1/app/modules/home/controllers/SignupController.dart';
import 'package:flutter_application_1/app/routes/app_pages.dart';
import 'package:flutter_application_1/app/utils.dart/DeliveryButton.dart';
import 'package:flutter_application_1/app/utils.dart/DeliveryTextfield.dart';
import 'package:get/get.dart';

class SignUpScreen extends GetView<SignupController> {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: controller.signupformkey,
            child: Column(
              children: [
                Image.asset("images/delivery.png"),
                SizedBox(height: 30),
                const Text(
                  "Sing up",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                DeliveryTextField(
                  labeltext: "Name",
                  keyboardType: TextInputType.name,
                  controller: controller.nameSC,
                  obsecure: false,
                  validator: (v) {
                    if (v!.length <= 2) {
                      return "Letter greater then or Equal to 3";
                    }
                  },
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                SizedBox(height: 20),
                DeliveryTextField(
                  labeltext: "Email",
                  controller: controller.emailSC,
                  obsecure: false,
                  validator: (v) {
                    return validateEmail(v);
                  },
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                SizedBox(height: 20),
                DeliveryTextField(
                  labeltext: "phone Number",
                  controller: controller.phoneSC,
                  keyboardType: TextInputType.number,
                  obsecure: false,
                  validator: (v) {
                    if (v!.length <= 10) {
                      return "Length Should be 11";
                    }
                  },
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                SizedBox(height: 20),
                Obx(
                  () => DeliveryTextField(
                    labeltext: "Password",
                    controller: controller.passwordSC,
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
                        if (controller.signupformkey.currentState!.validate()) {
                          controller.isLoading.value = true;
                          Authentications.SignUp(controller.emailSC.text,
                                  controller.passwordSC.text)
                              .whenComplete(
                            () => {
                              Authentications.AddUser(
                                UserDetail(
                                    email: controller.emailSC.text,
                                    id: FirebaseAuth.instance.currentUser!.uid,
                                    name: controller.nameSC.text,
                                    phone: controller.phoneSC.text,
                                    type: "rider"),
                              ),
                              controller.isLoading.value = false,
                              controller.emailSC.clear(),
                              controller.nameSC.clear(),
                              controller.passwordSC.clear(),
                              controller.phoneSC.clear(),
                            },
                          );
                        }
                      },
                      width: MediaQuery.of(context).size.width,
                      text: "Continue",
                      height: 45,
                      color: Abstract.btnColor,
                    )),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Joined as before?",
                      style: TextStyle(fontSize: 14),
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 40,
                        width: 70,
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            "Login",
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
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
