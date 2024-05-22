import 'package:flutter/material.dart';
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
                title: 'Name', value: 'Coding with T', onPressed: () {}),
            TProfileMenu(
                title: "Username", value: 'coding_with_t', onPressed: () {}),
            const SizedBox(height: TSizes.spaceBtwItems),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Heading Personal. Info
            const TSectionHeading(
                title: 'Personal Information', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems),
            TProfileMenu(
              title:
                  "User ID', value: 45689', icon: Iconsax.copy, onPressed: (00)",
              onPressed: () {},
              value: '',
            ),
            TProfileMenu(
                title: "E-mail", value: "coding_with_t", onPressed: () {}),
            TProfileMenu(
                title: 'Phone Number',
                value: '+92-317-8859528',
                onPressed: () {}),
            TProfileMenu(title: "Gender", value: 'Male', onPressed: () {}),
            TProfileMenu(
                title: 'Date of Birth', value: '10 Oct, 1994', onPressed: () {})


          ],
        ),
      ),
    );
  }
}
