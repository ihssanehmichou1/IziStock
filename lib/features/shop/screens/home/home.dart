import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izistock/features/shop/screens/all_products/all_products.dart';
import 'package:izistock/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:izistock/features/shop/screens/home/widgets/home_categories.dart';
import 'package:izistock/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:izistock/utils/constants/image_strings.dart';

import '../../../../common/widgets/containers/primary_header_container.dart';
import '../../../../common/widgets/containers/search_container.dart';

import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  ///appbar
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  ///search
                  TSearchContainer(
                    text: 'Search in Store',
                    searchInStore: false,
                    showBackground: false,
                    padding: EdgeInsets.all(1),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),

                  ////catego
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(children: [
                      ///heading
                      TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: Colors.white),
                      SizedBox(height: TSizes.spaceBtwItems),

                      ///categories
                      THomeCategories(),
                    ]),
                  ),
                ],
              ),
            ),
            //Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(banners: [
                    TImages.promoBanner1,
                    TImages.promoBanner1,
                    TImages.promoBanner1,
                    TImages.promoBanner1
                  ]),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  //Heading
                  TSectionHeading(
                      title: 'Popular Product',
                      onPressed: () {
                        Get.to(const AllProducts());
                      }),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  TGridLayout(
                      itemCount: 4,
                      itemBuilder: (_, index) => const TProductCardVertical())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
