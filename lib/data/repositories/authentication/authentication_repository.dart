
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';

import '../../../features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables

  final deviceStorage = GetStorage();

  /// Called from main.dart on app Launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to Show Relevant Screen
  screenRedirect() async {


    ///local storage
    deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime') != true? Get.offAll(() => const LoginScreen()) : Get.offAll(
        const OnBoardingScreen());
    if (kDebugMode) {
      print('===== GET STORAGE ======');
      print(deviceStorage.read('isFirstTime'));
    }
  }

}
/*-----------------------------------------------------Email & Password sign-in---------------------------------------------------*/

/// [EmailAuthentication] - SignIn

/// [EmailAuthentication] REGISTER

/// [ReAuthenticate] ReAuthenticate User





