import 'package:flutter/material.dart';
import 'package:izistock/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:izistock/common/widgets/images/t_rounded_image.dart';
import 'package:izistock/common/widgets/texts/product_title_text.dart';
import 'package:izistock/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:izistock/utils/constants/enums.dart';
import 'package:izistock/utils/constants/image_strings.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../icons/t_circular_icon.dart';
import '../../texts/product_price_text.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key});

  get dark => null;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: dark ? TColors.darkerGrey : TColors.softGrey,
      ),
      child: Row(
        children: [
          TRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: TRoundedImage(
                    imageUrl: TImages.promoBanner1,
                    applyImageRadius: true,
                    onPressed: () {
                      print('hi');
                    },
                  ),
                ),
                const Positioned(
                  top: 12,
                  child: TRoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary,
                    padding: EdgeInsets.symmetric(
                        horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text(
                      '25%',
                      style: TextStyle(fontSize: 25),
                      // .apply(color: TColors.black),
                    ),
                  ),
                ),
                const Positioned(
                  top: 0,
                  right: 0,
                  child: TCircularIcon(icon: Icons.favorite, color: Colors.red),
                ),
              ],
            ),
          ),
          //Details
          const SizedBox(
            width: 172,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      Column(
                        children: [
                          TProductTitleText(
                              title: 'Green Nike half Sleeves Shirt',
                              smallSize: true),
                          SizedBox(height: TSizes.spaceBtwItems / 2),
                          TBrandTitleWithVerifiedIcon(
                            title: 'Nike',
                            maxLines: 3,
                            brandTextSizes: TextSizes.medium,
                            brandTextSize: TextSizes.medium,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          TProductPriceText(price: '35.0'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
