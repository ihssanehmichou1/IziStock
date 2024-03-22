import 'package:flutter/cupertino.dart';

import '../../../utils/constants/sizes.dart';

class TGridLayout extends StatelessWidget{
  const TGridLayout({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.mainAxisExtent = 288,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context){
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SlverGridDelegateWithFixedCrossAxisCount(
        corssAxisCount: 2,
        mainAxisCount: TSizes.gridViewSpacing,
        crossAxisSpacing: TSizes.gridViewSpacing,
        mainAxisExtent: 288,
      ),
      itemBuilder: itemBuilder,
    );
  }
}

class SlverGridDelegateWithFixedCrossAxisCount {
}