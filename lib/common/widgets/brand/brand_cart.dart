import 'package:flutter/material.dart';

import '../custom_shapes/containers/rounded_container.dart';
import '../images/circular_image.dart';
import '../text/brand_title_text_with_verified_icon.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';


class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key, required bool showBorder,
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){},
        child: TRoundedContainer(

          padding: const EdgeInsets.all(TSizes.sm),
          showBorder: false,
          backgroundColor: Colors.transparent,
          child: Row(
            children: [
              /// -- Icon
              Flexible(
                child: TCircularImage(
                  isNetworkImage: false,
                  image: TImages.clothIcon,
                  backgroundColor: Colors.transparent,
                  overlayColor: THelperFunctions.isDarkMode(context)
                      ? TColors.white
                      : TColors.black,
                ),
              ), // TCircularImage

              const SizedBox(width: TSizes.spaceBtwItems / 2),

              /// -- Text
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const TBrandTitleWithVerifiedIcon(title: 'Nike',brandTextSize: TextSizes.large,),
                    Text(
                      '256 product',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
