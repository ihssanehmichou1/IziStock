import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:izistock/common/widgets/appbar/appbar.dart';
import 'package:izistock/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:izistock/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key})  : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: TAppBar(showBackArrow: true,title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body:Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),


        ///items in cart
        child: TCartItems(),
      ),


      /// checkout button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(() => const CheckoutScreen()), child: const Text('Chekout \$256.0')),
      ),
    );
  }
}



