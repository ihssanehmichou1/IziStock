import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izistock/features/shop/screens/all_products/all_products.dart';
import 'package:izistock/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:izistock/features/shop/screens/home/widgets/home_categories.dart';
import 'package:izistock/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:izistock/utils/constants/image_strings.dart';
import 'package:izistock/utils/constants/sizes.dart';

import '../../../../common/widgets/containers/primary_header_container.dart';
import '../../../../common/widgets/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../controllers/product/product_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  // Appbar
                  const THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  // Search Container
                  TSearchContainer(
                    text: 'Search in Store',
                    searchInStore: false,
                    showBackground: false,
                    padding: EdgeInsets.all(1),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),

                  // Popular Categories
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        // Heading
                        TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(height: TSizes.spaceBtwItems),

                        // Categories
                        const THomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Body
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

                  // Heading: Popular Products
                  TSectionHeading(
                    title: 'Popular Products',
                    onPressed: () {
                      Get.to(const AllProducts(title: 'Popular Products'));
                    },
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  Obx(() {
                    if (controller.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (controller.featuredProducts.isEmpty) {
                      return const Center(child: Text('No Data Found'));
                    }

                    return TGridLayout(
                      itemCount: 4,
                      itemBuilder: (_, index) => TProductCardVertical(product: controller.featuredProducts[index]),
                    );
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
