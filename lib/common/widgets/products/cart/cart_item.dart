import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';


class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///image
        TRoundedImage(
          imageUrl: TImages.productImage1,
          width:60,
          height:60,
          padding : const EdgeInsets.all(TSizes.sm),
          backgroundcolor : THelperFunctions.isDarkMode(context)? TColors.darkerGrey :TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        ///title price sizes
        Expanded(
            child:Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TBrandTitleWithVerifiedIcon(title :'Nike'),
                const Flexible(child:TProductTitleText(title :'Black Sports shoes',maxlines:1)),
                ///attributes
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'Color' , style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: 'Green' , style: Theme.of(context).textTheme.bodyLarge),
                      TextSpan(text: 'Size' , style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: 'UK 08' , style: Theme.of(context).textTheme.bodyLarge),

                    ],
                  ),
                ),

              ],
            )
        ),
      ],
    );
  }
}