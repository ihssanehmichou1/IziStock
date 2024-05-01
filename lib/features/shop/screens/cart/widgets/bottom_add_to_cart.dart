import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:izistock/features/shop/controllers/product/cart_controller.dart';
import 'package:izistock/features/shop/models/cart_item_model.dart';
import 'package:izistock/features/shop/models/product_model.dart';
import '../../../../../common/widgets/icons/t_circular_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';// Assuming you have color constants defined

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({Key? key, required this.product}) : super(key: key); // Constructor needs a key parameter
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    final dark = THelperFunctions.isDarkMode(context); // Assuming you have a function to check dark mode
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? TColors.darkerGrey : TColors.lightGrey, // Assuming you have color constants defined
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRadiusLg),
          topRight: Radius.circular(TSizes.cardRadiusLg),
        ),
      ),
      child: Obx(
            () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                TCircularIcon(
                  icon: Iconsax.minus, // Assuming you have defined Icons.minus
                  backgroundColor: TColors.darkGrey,
                  width: 40,
                  height: 40, // You missed 'height'
                  color: Colors.white,
                  onPressed: () => controller.productQuantityInCart.value < 1 ? null : controller.productQuantityInCart.value -= 1,
                ),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text(controller.productQuantityInCart.value.toString(), style: Theme.of(context).textTheme.titleSmall,),
                const SizedBox(width: TSizes.spaceBtwItems),
                TCircularIcon(
                  icon: Iconsax.add, // Assuming you have defined Icons.add
                  backgroundColor: TColors.black,
                  width: 40,
                  height: 40, // You missed 'height'
                  color: TColors.white,
                  onPressed: () => controller.productQuantityInCart.value += 1,

                ),
              ],
            ),

            ElevatedButton(
              onPressed: controller.productQuantityInCart.value < 1 ? null : () => controller.addOneToCart(product as CartItemModel),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: TColors.black,
                side: const BorderSide(color: TColors.black),
              ),
              child: const Text('Add to Cart'),
            )
          ],
        ),
      ),
    );
  }
}
