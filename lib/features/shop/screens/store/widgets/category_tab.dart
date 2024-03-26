import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:izistock/common/widgets/layouts/grid_layout.dart';
import 'package:izistock/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:izistock/common/widgets/texts/section_heading.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key}); // corrected super.key

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding( // corrected the placement of Padding and Column
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Brands
              const TBrandShowcase(images: [
                TImages.promoBanner1,
                TImages.promoBanner1,
                TImages.promoBanner1
              ]),
              // Products
              const SizedBox(height: TSizes.spaceBtwItems),
              TSectionHeading(
                title: 'You might like',
                showActionButton: true,
                onPressed: () {},
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) => const TProductCardVertical(),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
            ],
          ),
        ), // removed the extra closing bracket here
      ],
    );
  }
}
