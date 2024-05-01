import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:izistock/common/widgets/appbar/appbar.dart';
import 'package:izistock/features/shop/models/product_model.dart';

import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../controllers/all_products_controller.dart';
import '../screens/product_details/widgets/vertical_product_shimmer.dart';

class AllProducts extends StatelessWidget {
  const AllProducts(
      {super.key, required this.title, this.query, this.futureMethod, required Future<List<ProductModel>> futureMethode}); // corrected super.key

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
// Initialize controller for managing product fetching
    final controller = Get.put(AllProductsController());

    return Scaffold(

      /// AppBar
      appBar: TAppBar(title: Text(title),
          showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
              future: futureMethod ?? controller.fetchProductsByQuery(query),
              builder: (context, snapshot) {
// Check the state of the FutureBuilder snapshot
                const loader = TVerticalProductShimmer();
                final widget = TCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot, loader: loader);
// Return appropriate widget based on snapshot state
                if (widget != null) return widget;
// Products found!
                final products = snapshot.data!;

                return TSortableProducts(products: products);
              }),
        ),
      ),
    );
  }
}