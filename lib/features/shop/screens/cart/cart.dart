import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(showBackArrow: true,title: Text('Cart',style: Theme.of(context).textTheme.headlineSmall,),),
    );
  }
}
