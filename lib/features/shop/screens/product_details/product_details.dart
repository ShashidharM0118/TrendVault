import 'package:flutter/material.dart';
import 'package:t_store/features/shop/screens/product_details/widget/product_detail_image_slider.dart';
import 'package:t_store/features/shop/screens/product_details/widget/products_meta_data.dart';
import 'package:t_store/features/shop/screens/product_details/widget/rating_share_widget.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product Image Slider
            TProductImageSlider(dark: dark),

            /// Product Details
            Padding(
              padding: const EdgeInsets.only(
                right: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  /// Rating & Share Button
                  TRatingAndShare(),

                  ///price, title
                  TProductMetaData(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
