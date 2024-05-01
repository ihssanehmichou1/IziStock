import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:izistock/common/widgets/appbar/appbar.dart';
import 'package:izistock/common/widgets/brands/brand_card.dart';
import 'package:izistock/features/shop/controllers/brand_controller.dart';

import '../../../../common/widgets/brands/brand_model.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../product_details/widgets/vertical_product_shimmer.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return  Scaffold(
      appBar: TAppBar(title: Text(brand.name)),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                //Brand
                TBrandCard(showBorder: true , brand:brand),
                SizedBox(height: TSizes.spaceBtwSections),

                FutureBuilder(
                    future: controller.getBrandProducts(brand.id),
                    builder: (context, snapshot) {

                      const loader = TVerticalProductShimmer();
                      final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot:snapshot, loader:loader);
                      if(widget != null) return widget;


                      final brandProducts = snapshot.data!;
                      return  TSortableProducts(products :brandProducts);


                    }
                ),
              ],
            )),
      ),
    );
  }
}
