import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/data/Services.dart';
import 'package:flutter_application_1/app/routes/app_pages.dart';
import 'package:flutter_application_1/app/screens/LandingPage.dart';
import 'package:flutter_application_1/app/screens/LoginScreen.dart';
import 'package:get/get.dart';

class CheckingScreen extends StatelessWidget {
  Future<FirebaseApp> initilize = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initilize,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (BuildContext context, AsyncSnapshot streamSnapshot) {
              if (streamSnapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("${streamSnapshot.error}"),
                  ),
                );
              }
              if (streamSnapshot.connectionState == ConnectionState.active) {
                User? user = streamSnapshot.data;
                if (user == null) {
                  return LoginScreen();
                } else if (MyPrefferenc.getId() == user.email) {
                  Get.toNamed(Routes.LANDINGPAGE);
                }
              }
              return Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "CHECKING AUTHENTICATION...",
                        textAlign: TextAlign.center,
                        // style: EcoStyle.boldStyle,
                      ),
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
              );
            },
          );
        }
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "INITIALIZATION...",
                  // style: EcoStyle.boldStyle,
                ),
                CircularProgressIndicator(),
              ],
            ),
          ),
        );
      },
    );
  }
}
