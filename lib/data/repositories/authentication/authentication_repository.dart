
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';

import '../../../features/authentication/screens/onboarding/onboarding.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Called from main.dart on app Launch
  @override
  void onReady() {
    //removes the native splash screen
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


/*-----------------------------------------------Email and password sign in ----------------------------------------------*/
/// [EmailAuthentication] SignIn

  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


/// [EmailVerification] MAIL VERIFICATION

/// [ReAuthenticate] ReAuthenticate User

/// [EmailAuthentication] FORGET PASSWORD

/* -----------------------------------------------Federated identity & social sign-in--------------------------------------*/

/// [GoogleAuthentication]- 600GLE                                                                     I

/// [FacebookAuthentication] FACEBOOK

/*---------------------------------------------- ./end Federated identity & social sign-in-------------------------------*/

/// [LogoutUser) - Valid for any authentication.

/// [DeleteUser] - Remove user Auth and Firestore Account.


}