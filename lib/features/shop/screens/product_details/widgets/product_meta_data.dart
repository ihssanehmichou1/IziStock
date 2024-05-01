import 'package:flutter/material.dart';
import 'package:izistock/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:izistock/common/widgets/images/t_circular_image.dart';
import 'package:izistock/common/widgets/texts/product_price_text.dart';
import 'package:izistock/common/widgets/texts/product_title_text.dart';
import 'package:izistock/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:izistock/features/shop/models/product_model.dart';
import 'package:izistock/utils/constants/enums.dart';
import 'package:izistock/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, required ProductModel product});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Price and Sale Price
        Row(
          children: [
            /// Sale Tag
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text('25%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: TColors.black)),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),

            /// Price
            Text('\$250',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: TSizes.spaceBtwItems),
            const TProductPriceText(price: '175', isLarge: true),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        ///Title
        const TProductTitleText(title: 'Green Nike Sports Shirt'),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        ///Stack Status
        Row(
          children: [
            const TProductTitleText(title: 'Status'),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        ///Brand
        Row(
          children: [
            TCircularImage(
              image: TImages.darkAppLogo,
              width: 32,
              height: 32,
              overlayColor: darkMode ? TColors.white : TColors.black,
              isNetWorkImage: false,
            ),
            const TBrandTitleWithVerifiedIcon(
              title: 'Nike',
              brandTextSize: TextSizes.medium,
              maxLines: 3,
              brandTextSizes: TextSizes.large,
            ),
          ],
        )
      ],
    );
  }
}
