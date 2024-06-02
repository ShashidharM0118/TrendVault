import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/circular_image.dart';
import '../../../../common/widgets/text/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const TCircularImage(
                    image: TImages.user,
                    width: 80,
                    height: 80,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Change Profile Picture'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),

            /// Details
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Heading Profile Info
            const TSectionHeading(
                title: 'Profile Information', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems),
            TProfileMenu(
                title: 'Name', value: controller.user.value.fullName, onPressed: (() => Get.to(() => ChangeName()))),
            TProfileMenu(
                title: "Username", value: controller.user.value.username, onPressed: () {}),
            const SizedBox(height: TSizes.spaceBtwItems),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Heading Personal. Info
            const TSectionHeading(
                title: 'Personal Information', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems),
            TProfileMenu(
              title: "User ID", value: controller.user.value.id, icon: Iconsax.copy, onPressed: () {},
            ),
            TProfileMenu(
                title: "E-mail", value: controller.user.value.email, onPressed: () {}),
            TProfileMenu(
                title: 'Phone No.',
                value: controller.user.value.phoneNumber,
                onPressed: () {}),
            TProfileMenu(title: "Gender", value: 'Male', onPressed: () {}),
            TProfileMenu(
                title: 'Date of Birth', value: '18 Oct, 1994', onPressed: () {}),
            const Divider(),

            const SizedBox(height: TSizes.spaceBtwItems),

            Center(
              child: TextButton(
                onPressed: () => controller.deleteAccountWarningPopup(),
                child: const Text('Close Account', style: TextStyle(color: Colors.red)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
