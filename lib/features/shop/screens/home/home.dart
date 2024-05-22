import 'package:flutter/material.dart';

import 'package:t_store/features/shop/screens/home/widgets/home_catagories.dart';
import 'package:t_store/features/shop/screens/home/widgets/promo_slider.dart';
import '../../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';

import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layout/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/text/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import 'widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  ///APPBAR
                  THomeAppBar(),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  ///sEARCH BAR
                  TSearchContainer(
                    text: 'SEardch in Store',
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  ///Catergories
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),

                        ///srollable categories
                        HomeCategories(),
                        const SizedBox(height: TSizes.spaceBtwSections*2,),


                      ],
                    ),
                  )
                ],
              ),
            ),
            ///body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const PromoSlider(banners: [TImages.promoBanner1, TImages.promoBanner2, TImages.promoBanner3]),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  ///heading
                  TSectionHeading(title: 'Poputar Products', onPressed: (){}),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  ///grid
                  TGridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => const  ProductCardVertical(),
                  ),
                ],
              ),
            )


          ],
        ),
      ),
    );
  }
}
