import 'package:flutter_application_1/app/modules/home/bindings/DirectionBinding.dart';
import 'package:flutter_application_1/app/modules/home/bindings/LandingPageBinding.dart';
import 'package:flutter_application_1/app/modules/home/bindings/LoginBinding.dart';
import 'package:flutter_application_1/app/modules/home/bindings/OrderDetailBinding.dart';
import 'package:flutter_application_1/app/modules/home/bindings/ResetBinding.dart';
import 'package:flutter_application_1/app/modules/home/bindings/SignupBinding.dart';
import 'package:flutter_application_1/app/screens/Checking.dart';
import 'package:flutter_application_1/app/screens/Rider_APP/ChatModule/ChatScreen.dart';
import 'package:flutter_application_1/app/screens/Rider_APP/ChatScreen.dart';
import 'package:flutter_application_1/app/screens/Rider_APP/DashBoard.dart';
import 'package:flutter_application_1/app/screens/Rider_APP/Directions.dart';
import 'package:flutter_application_1/app/screens/Rider_APP/History.dart';
import 'package:flutter_application_1/app/screens/Rider_APP/LandingPage.dart';
import 'package:flutter_application_1/app/screens/Rider_APP/LoginScreen.dart';
import 'package:flutter_application_1/app/screens/Rider_APP/OrderDetails.dart';
import 'package:flutter_application_1/app/screens/Rider_APP/Profile.dart';
import 'package:flutter_application_1/app/screens/Rider_APP/ResetPassword.dart';
import 'package:flutter_application_1/app/screens/Rider_APP/SignUp.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/RiderSplash.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGINSCREEN,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashBoard(),
      binding: LandingBinding(),
    ),
    GetPage(
      name: _Paths.ORDERDETAIL,
      page: () => OrderDetail(),
      binding: OrderDetailBindig(),
    ),
    GetPage(
      name: _Paths.DIRECTIONSCREEN,
      page: () => const DirectionScreen(),
      binding: DirectionBinding(),
    ),
    GetPage(
      name: _Paths.HISTORYORDER,
      page: () => HisotryOrder(),
      binding: LandingBinding(),
    ),
    GetPage(
      name: _Paths.LANDINGPAGE,
      page: () => LandingPage(),
      binding: LandingBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfilePage(),
      binding: LandingBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => ChatScreen(),
      binding: LandingBinding(),
    ),
    GetPage(
      name: _Paths.RESETPASSWORD,
      page: () => ResetPassword(),
      binding: ResetBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignUpScreen(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.USERCHATSCREEN,
      page: () => UserChatScreen(),
      binding: LandingBinding(),
    ),
  ];
}
