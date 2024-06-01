import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';

import '../../../../common/widgets/loaders/full_screen_loader.dart';
import '../../../../common/widgets/loaders/loaders.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';

class LoginController extends GetxController {
  // Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    String? storedEmail = localStorage.read("REMEMBER_ME_EMAIL");
    String? storedPassword = localStorage.read("REMEMBER_ME_PASSWORD");

    if (storedEmail != null) {
      email.text = storedEmail;
    }

    if (storedPassword != null) {
      password.text = storedPassword;
    }

    super.onInit();
  }




  /// Email and Password Signin
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Logging you in', TImages.doccerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (loginFormKey.currentState!.validate()) {
        // Save Data if Remember Me is selected
        if (rememberMe.value) {
          localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
          localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
        }

        // Login user using Email & Password Authentication
        final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

        // Remove Loader
        TFullScreenLoader.stopLoading();

        // Redirect
        AuthenticationRepository.instance.screenRedirect();
      } else {
        TFullScreenLoader.stopLoading();
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// Google SignIn Authentication
  Future<void> googleSignIn() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.doccerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();


        // Save User Record
        await userController.saveUserRecord(userCredentials);

        // Remove Loader
        TFullScreenLoader.stopLoading();

        // Redirect
        AuthenticationRepository.instance.screenRedirect();
      } catch (e) {
        // Remove Loader
        TFullScreenLoader.stopLoading();

        TLoaders.errorSnackBar(
          title: 'Oh Snap',
          message: e.toString(),
        );
      }
  }

}
