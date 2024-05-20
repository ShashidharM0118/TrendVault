import 'package:flutter/material.dart';

class TProductPriceText extends StatelessWidget {
  const TProductPriceText({

    super.key,
    this.currencySign = '\$',

    required this.price,
    this.islarge = false,

    this.maxLines = 1,
    this.lineThrough = false,

  });

  final String currencySign, price;
  final int maxLines;

  final bool islarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price,

      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,

      style: islarge ? Theme
          .of(context)
          .textTheme
          .headlineMedium!
          .apply(decoration: lineThrough ? TextDecoration.lineThrough : null)
          : Theme
          .of(context)
          .textTheme
          .titleLarge!
          .apply(decoration: lineThrough ? TextDecoration.lineThrough : null),
    );
  }
}



