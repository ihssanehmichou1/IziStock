import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:izistock/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:izistock/features/shop/screens/home/widgets/home_categories.dart';


import '../../../../common/widgets/containers/primary_header_container.dart';
import '../../../../common/widgets/containers/search_container.dart';


import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
                child: Column(
                children: [
                  ///appbar
                 THomeAppBar(),
                 SizedBox(height: TSizes.spaceBtwSections),

                  ///search
                  TSearchContainer(text: 'Search in Store'),
                  SizedBox(height: TSizes.spaceBtwSections),

                  ////catego
                  Padding(
                      padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child:Column(
                      children: [
                        
                        ///heading
                        TSectionHeading(title: 'Popular Categories', showActionButton: false ,textColor: Colors.white),
                        SizedBox(height: TSizes.spaceBtwItems),

                        ///categories
                        THomeCategories(),
                      ]
                    ),
                  ),

                ],
                ),
            ),
          ],
        ),
      ) ,
    );
  }
}











