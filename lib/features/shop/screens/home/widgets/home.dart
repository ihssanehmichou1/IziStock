import 'package:flutter/material.dart';

import '../../../../../common/widgets/containers/search_container.dart';
import '../../../../../utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  ///appbar
                  const THomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  ///search
                  const TSearchContainer(text: 'Search in Store'),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  ////catego
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child:Column(
                        children: [

                          ///heading
                          TSectionHeading(title: 'Popular Categories', showActionButton: false ,textColor: Colors.white),
                          const SizedBox(height: TSizes.spaceBtwItems),

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
