import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/app/UserModel/UserModel.dart';
import 'package:flutter_application_1/app/data/Services.dart';
import 'package:flutter_application_1/app/routes/app_pages.dart';
import 'package:get/get.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class Authentications {
  // SignUp User
  static Future SignUp(String email, String password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Get.snackbar("SignUp", "User is Signed Up");
        Get.offAllNamed(Routes.LOGINSCREEN);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar("Strength", "Password is week");
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("Message", "This email is already in use");
      }
    }
  }

  // SignIn User
  static Future SignIn(String email, String password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                Get.snackbar("Login", "User is Logged in"),
                Get.toNamed(Routes.LANDINGPAGE),
                MyPrefferenc.saveId(FirebaseAuth.instance.currentUser!.uid),
              });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Get.snackbar("Login Authentication", "User Not Found");
      } else if (e.code == 'wrong-password') {
        return Get.snackbar("Wrong-Passwod", "Incorrect-Password");
      }
    }
  }

  // change password

  static Future changePassword(String oldpassword, String newpassword) async {
    try {
      final user = await FirebaseAuth.instance.currentUser;
      final cred = EmailAuthProvider.credential(
          email: "${user!.email}", password: oldpassword);
      user.reauthenticateWithCredential(cred).then((value) {
        user.updatePassword(newpassword).then(
          (value) {
            Get.snackbar("Message", "Password Changed");
          },
        ).catchError((e) {
          Get.snackbar("Message", "Password Can't Be channged${e.toString()}");
        });
      }).catchError((e) {
        Get.snackbar("Old Passwprd", "${e}");
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        Get.snackbar("Old Passwprd", "${e.code}");
      }
    }
  }

  // Add User Data to Firebase
  static Future<dynamic> AddUser(UserDetail userDetail) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    await db
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(userDetail.toMap());
  }
}
