import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';

import '../../../common/widgets/loaders/full_screen_loader.dart';
import '../../../common/widgets/loaders/loaders.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../personalization/models/user_model.dart';
import '../screens/signup/verify_email.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables                             // Controller for email input
  final hidePassword = true.obs; //hide and show the password
  final privacyPolicy = true.obs; //to toggle terms and service checkbox
  final email= TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();

  // Controller for phone number input
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signupFormkey =GlobalKey<FormState>();
  // Form key for form validation

///  SIGNUP
  void signup() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog("We are processing your information...",TImages.doccerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        return;
      }
      // Form Validation
      if(!signupFormkey.currentState!.validate()){
        return;
      }
      // Privacy Policy Check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title:    'Accept Privacy Policy',
          message: 'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.',
        );
        return;
      }
      // Register user in the Firebase Authentication & Save user data in the Firebase

      // Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

// Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
    lastName: lastName.text.trim(),
    username: username.text.trim(),
    email: email.text.trim(),
    phoneNumber: phoneNumber.text.trim(),
    profilePicture:'',
    );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      TFullScreenLoader.stopLoading();
// Show Success Message
      TLoaders.successSnackBar(title: "Congratulations", message: "Your account has been created! Verify email to continue.");

// Move to Verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));


    } catch (e) {  // Move to Verify Email Screen
      TFullScreenLoader.stopLoading();
      // Show some Generic Error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap! ', message: 'this iss ${e.toString()}');
    }

  }
}
