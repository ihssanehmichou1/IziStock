import 'package:flutter/material.dart';
import 'package:izistock/common/widgets/images/t_rounded_image.dart';
import 'package:izistock/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:izistock/common/widgets/texts/section_heading.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sports Whirts'), // Set the title here
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Banner
              TRoundedImage(
                width: double.infinity,
                height: null,
                imageUrl: TImages.promoBanner1,
                applyImageRadius: true,
                onPressed: () {},
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Sub Categories
              Column(
                children: [
                  TSectionHeading(
                    title: 'Sports shirts',
                    onPressed: () {}, // Add onPressed function here
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections / 2),

                  // Horizontal Product Cards
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      separatorBuilder: (context,index) => const SizedBox(width: TSizes.spaceBtwItems),
                      itemBuilder: (context, index) => const TProductCardHorizontal(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
