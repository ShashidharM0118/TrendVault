import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:t_store/features/shop/screens/cart/cart.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../personalization/controllers/user_controller.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey),
          ),
          Obx(() {
            // if(controller.profileLoading.value ){
            //   return TShimmerEffect()  //flutter crud -22:54
            // }
            return Text(
              controller.user.value.fullName,
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: TColors.white),
            );
          }),
        ],
      ),
      actions: [
        TCartCounter(onPressed: ()=>Get.to(()=>const CartScreen()), iconColor: TColors.white),
      ],
    );
  }
}
