import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';


class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(

    children:
    [
      TRoundedContainer(

        /// -- Selected Attribute Pricing & Description

        padding: const EdgeInsets.all(TSizes.md),

        backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
        child: const Column(

          children: [
            /// Title, Price and Stock Stous

          ],
        ),
      ),
    ],
    );
  }
}