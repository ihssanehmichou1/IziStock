import 'package:flutter/material.dart';
import 'package:izistock/common/widgets/layouts/grid_layout.dart';

import '../../../../common/widgets/shimmer/shimmer.dart';

class TBrandShimer extends StatelessWidget {
  const TBrandShimer({super.key,  this.itemCount=4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      mainAxisExtent: 80,
        itemCount: itemCount,
        itemBuilder: (_, __) => const TShimmerEffect(width:300, height:80),
    );
  }
}
