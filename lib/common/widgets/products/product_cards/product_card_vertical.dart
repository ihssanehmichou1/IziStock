import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izistock/utils/constants/enums.dart';

import '../../../../features/shop/screens/product_details/product_detail.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../styles/shadows.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../icons/t_circular_icon.dart';
import '../../images/t_rounded_image.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';
import '../../texts/t_brand_title_text_with_verified_icon.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetail()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          children: [
            Container(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              color: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  TRoundedImage(
                    imageUrl: TImages.promoBanner1,
                    applyImageRadius: true,
                    onPressed: () {},
                  ),
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text('25%',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .apply(color: TColors.black)),
                    ),
                  ),
                  const Positioned(
                    top: 0,
                    right: 0,
                    child:
                        TCircularIcon(icon: Icons.favorite, color: Colors.red),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            const Padding(
              padding: EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(
                      title: 'Green Nike Air Shoes', smallSize: true),
                  SizedBox(height: TSizes.spaceBtwItems / 2),
                  TBrandTitleWithVerifiedIcon(
                    title: 'Nike',
                    brandTextSizes: TextSizes.large,
                    maxLines: 5,
                    brandTextSize: TextSizes.large,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Price
                const TProductPriceText(price: '35.0'),
                Container(
                  decoration: const BoxDecoration(
                    color: TColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSizes.cardRadiusMd),
                      bottomRight: Radius.circular(TSizes.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                    width: TSizes.iconLg * 1.2,
                    height: TSizes.iconLg * 1.2,
                    child: Icon(Icons.add, color: TColors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
