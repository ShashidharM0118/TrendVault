
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/screens/password_configuratoin/forgot_password.dart';
import 'package:t_store/features/authentication/screens/signup/signup.dart';
import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';


///login form
class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: TSizes.spaceBtwSections),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: TTexts.email),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  labelText: TTexts.password,
                  suffixIcon: Icon(Iconsax.eye_slash),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields / 2),

              ///Remember me and forget password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///Remeber me
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      const Text(TTexts.rememberMe),
                    ],
                  ),

                  ///Forgot password
                  TextButton(
                      onPressed: ()=> Get.to(()=>const ForgotPassword()),
                      child: const Text(TTexts.forgetPassword)),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///Sign in Button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () =>Get.to(()=>const NavigationMenu() ), child: Text(TTexts.signIn))),

              const SizedBox(height: TSizes.spaceBtwItems),

              ///Create Account button
              SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () =>Get.to(()=>const SignupScreen()),
                      child: Text(TTexts.createAccount))),
            ],
          ),
        ));
  }
}


