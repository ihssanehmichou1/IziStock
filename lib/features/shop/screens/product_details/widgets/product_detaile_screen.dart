import 'package:flutter/material.dart';
import 'package:izistock/features/shop/screens/product_details/widgets/product_attributs.dart';
import 'package:izistock/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:izistock/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:izistock/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:readmore/readmore.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../models/product_model.dart';
import '../../cart/widgets/bottom_add_to_cart.dart';


class TProductDetailScreen extends StatelessWidget {
  const TProductDetailScreen({super.key, required this.product});

  final ProductModel product; // Le produit à afficher sur l'écran

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1 - Product Image Slider
            TProductImageSlider(product: product),

            // 2 - Product Details
            Padding(
              padding: const EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  // - Rating & Share Button
                  const TRatingAndShare(),

                  // - Price, Title, Stock, & Brand
                  TProductMetaData(product: product),

                  // -- Attributes
                  if (product.productType == ProductType.variable.toString())
                    TProductAttributes(product: product),
                  if (product.productType == ProductType.variable.toString())
                    const SizedBox(height: TSizes.spaceBtwSections),

                  // -- Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                ],
              ),
            ),

            // 3 - Description
            const TSectionHeading(title: 'Description', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems),
            const ReadMoreText(
              // Définissez les propriétés du texte ici
            ),
            // 4 - Reviews
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TSectionHeading(title: 'Reviews (199)', showActionButton: false),
                IconButton(
                  icon: const Icon(Icons.arrow_right_alt_rounded, size: 18),
                  onPressed: () {
                    // Naviguez vers la page des avis du produit
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
