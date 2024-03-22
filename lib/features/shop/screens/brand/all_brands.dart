import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:izistock/common/widgets/appbar/appbar.dart';
import 'package:izistock/common/widgets/brands/brand_card.dart';
import 'package:izistock/common/widgets/layouts/grid_layout.dart';
import 'package:izistock/common/widgets/products/sortable/sortable_products.dart';
import 'package:izistock/common/widgets/texts/section_heading.dart';
import 'package:izistock/features/shop/screens/brand/brand_products.dart';

import '../../../../utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Heading
              TSectionHeading(title: 'Brands'),
              SizedBox(height: TSizes.spaceBtwItems),
              // Brands
              TGridLayout(
                itemCount: 10,
                mainAxisExtent: 80,
                itemBuilder: (context, index) => TBrandCard(
                  showBorder: true,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BrandProducts()),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
