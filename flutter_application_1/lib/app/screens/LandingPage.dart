import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/constant/Color.dart';
import 'package:flutter_application_1/app/modules/home/controllers/LandingController.dart';
import 'package:flutter_application_1/app/screens/DashBoard.dart';
import 'package:flutter_application_1/app/screens/History.dart';
import 'package:flutter_application_1/app/screens/ChatScreen.dart';
import 'package:flutter_application_1/app/screens/Profile.dart';
import 'package:get/get.dart';

class LandingPage extends GetView<LandingController> {
  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          onTap: landingPageController.changeTabIndex,
          currentIndex: landingPageController.bottomTabIndex.value,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.black38,
          selectedItemColor: Colors.black,
          selectedIconTheme: IconThemeData(color: Abstract.btnColor),
          selectedLabelStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 20.0,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.history,
                size: 20.0,
              ),
              label: 'History',
              // backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_pin,
                size: 20.0,
              ),
              label: 'Profile',
              // backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                size: 20.0,
              ),
              label: 'Chat',
              // backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: buildBottomNavigationMenu(context, controller),
      body: Obx(() => IndexedStack(
            index: controller.bottomTabIndex.value,
            children: [
              DashBoard(),
              HisotryOrder(),
              ProfilePage(),
              ChatScreen(),
            ],
          )),
    ));
  }
}
