import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/controllers/signup_controller.dart';
import 'package:t_store/features/authentication/screens/signup/verify_email.dart';
import 'package:t_store/utils/validators/validation.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(SignupController());
    return Form(
        key: controller.signupFormkey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.firstName,
                    validator: (value)=> TValidator.validateEmptyText('First name', value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.firstName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwInputFields,
                ),
                Expanded(
                  child: TextFormField(
                    validator: (value)=> TValidator.validateEmptyText('Last name', value),
                    controller: controller.lastName,
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.lastName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            ///username
            TextFormField(
              validator: (value)=> TValidator.validateEmptyText('username', value),
              controller: controller.username,
              expands: false,
              decoration: const InputDecoration(
                labelText: TTexts.username,
                prefixIcon: Icon(Iconsax.user_edit),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            ///Email
            TextFormField(
              controller: controller.email,
              validator: (value)=> TValidator.validateEmail(value),
              expands: false,
              decoration: const InputDecoration(
                labelText: TTexts.email,
                prefixIcon: Icon(Iconsax.direct),
              ),
            ),

            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            ///Phone NUmber
            TextFormField(
              controller: controller.phoneNumber,
              validator: (value)=> TValidator.validatePhoneNumber(value),
              expands: false,
              decoration: const InputDecoration(
                labelText: TTexts.phoneNo,
                prefixIcon: Icon(Iconsax.call),
              ),
            ),

            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            ///password
            Obx(
                  ()=>TextFormField(
                controller: controller.password,
                validator: (value)=> TValidator.validatePassword(value),
                expands: false,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            ///terms and condition
            Row(

              children: [
                SizedBox(
                    width: 24,
                    height: 24,
                    child: Obx(()=> Checkbox(value: controller.privacyPolicy.value, onChanged: (value)=> controller.privacyPolicy.value = !controller.privacyPolicy.value))),
                const SizedBox(
                  width: TSizes.spaceBtwItems/2,
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: '${TTexts.iAgreeTo} ',
                      style: Theme.of(context).textTheme.bodySmall!.apply(
                          fontSizeFactor: 0.8
                      )),
                  TextSpan(
                      text: TTexts.privacyPolicy,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? TColors.white : TColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? TColors.white : TColors.primary,
                          fontSizeFactor: 0.8
                      )),
                  TextSpan(
                      text: TTexts.and,
                      style: Theme.of(context).textTheme.bodySmall!.apply(
                          fontSizeFactor: 0.8
                      )),
                  TextSpan(
                      text: ' ${TTexts.termsOfUse}',
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? TColors.white : TColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? TColors.white : TColors.primary,
                        fontSizeFactor: 0.8
                      )),
                ]))
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            ///signup button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.signup(),
                child: const Text(TTexts.createAccount),
              ),
            )
          ],
        ));
  }
}
