import 'package:flutter/material.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/containers/search_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';


class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: const TAppBar(),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                expandedHeight: 440,
                automaticallyImplyLeading: false,
                backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.spaceBtwItems),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),
                      const TSearchContainer(
                        searchInStore: true,
                        showBorder: true,
                        showBackGround: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      TSectionHeading(
                        title: 'Featured Brands',
                        onPressed: () => print('Pressed'),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),
                      GridLayout(
                        itemCount: 4,
                        mainAxisExtent: 88,
                        itemBuilder: (_, index) {
                          // In the Backend Tutorial, we will pass the Each Brand & onPress Event also.
                          return const BrandCard(showBorder: false);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    isScrollable: true,
                    indicatorColor: Colors.amber,
                    unselectedLabelColor: Colors.teal,
                    labelColor: THelperFunctions.isDarkMode(context) ? Colors.white : Colors.amber,
                    tabs: const [
                      Tab(child: Text('Sports')),
                      Tab(child: Text('Furniture')),
                      Tab(child: Text('Electroniques')),
                      Tab(child: Text('Clothes')),
                      Tab(child: Text('Cosmetics')),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: Container(), // Replace with the content of your screen
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent,
      ) {
    return _tabBar;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
