import 'package:flutter/material.dart';
import 'package:izistock/common/widgets/brands/brand_model.dart';
import 'package:izistock/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:izistock/common/widgets/images/t_circular_image.dart';
import 'package:izistock/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:izistock/utils/constants/colors.dart';
import 'package:izistock/utils/constants/image_strings.dart';
import 'package:izistock/utils/helpers/helper_functions.dart';

import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    Key? key,
    required this.showBorder,
    required this.brand,
    this.onTap,
  }) : super(key: key);

  final BrandModel brand;
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(TSizes.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: TCircularImage(
                isNetWorkImage: false,
                image: TImages.darkAppLogo,
                backgroundColor: Colors.transparent,
                overlayColor: isDark ? TColors.white : TColors.black,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TBrandTitleWithVerifiedIcon(
                    title: brand.name,
                    brandTextSizes: TextSizes.large,
                    maxLines: 1,
                    brandTextSize: TextSizes.large, // Taille de texte par défaut pour le titre de la marque
                  ),
                  Text(
                    '${brand.productsCount ?? 0} products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
