import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/constant/Color.dart';
import 'package:flutter_application_1/app/modules/home/controllers/LandingController.dart';
import 'package:flutter_application_1/app/routes/app_pages.dart';
import 'package:flutter_application_1/app/utils.dart/DeliveryButton.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<LandingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Abstract.btnColor,
        title: Text("Profile"),
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection("user")
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.data == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                controller.reload.value = "${snapshot.data!.get("url")}";

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      color: Abstract.btnColor,
                      child: Center(
                          child: Obx(
                        () => CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40,
                          child: controller.reload.value == ""
                              ? InkWell(
                                  onTap: () {
                                    controller.upLoadPic();
                                  },
                                  child: Image.asset("images/profile1.png"),
                                )
                              : ClipOval(
                                  child: ClipOval(
                                  child: Image.network(controller.reload.value),
                                )
                                  // CachedNetworkImage(

                                  //   imageUrl: controller.reload.value,
                                  //   height: 100,
                                  //   width: 100,
                                  //   fit: BoxFit.fill,
                                  //   progressIndicatorBuilder: (context, url,
                                  //           downloadProgress) =>
                                  //       CircularProgressIndicator(
                                  //           value: downloadProgress.progress),
                                  // ),
                                  ),
                        ),
                      )),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Employee Details",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 15),
                              Text(
                                snapshot.data!.get("name"),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 15),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Abstract.btnColor,
                                    size: 20,
                                  ),
                                  SizedBox(width: 14),
                                  Text(
                                    "Address",
                                    style: TextStyle(color: Abstract.lowColor),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 35),
                                child: Text(
                                  snapshot.data!.get("address"),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 5),
                              Divider(
                                indent: 5,
                                endIndent: 10,
                                color: Colors.black12,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.phone,
                                    color: Abstract.btnColor,
                                    size: 20,
                                  ),
                                  SizedBox(width: 14),
                                  Text(
                                    "Mobile",
                                    style: TextStyle(color: Abstract.lowColor),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 35),
                                child: Text(
                                  snapshot.data!.get("phone"),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: DeliveryButton(
                        text: "Change Password",
                        textcolor: Colors.white,
                        ontap: () {
                          Get.toNamed(Routes.RESETPASSWORD);
                        },
                        width: 240,
                        height: 50,
                        color: Abstract.btnColor,
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: DeliveryButton(
                        text: "Log Out",
                        textcolor: Colors.white,
                        ontap: () {
                          FirebaseAuth.instance.signOut();
                          Get.back();
                        },
                        width: 240,
                        height: 50,
                        color: Abstract.btnColor,
                      ),
                    ),
                  ],
                );
              })),
    );
  }
}
