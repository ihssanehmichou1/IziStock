// import 'package:flutter/cupertino.dart';
// import 'package:izistock/common/widgets/appbar/appbar.dart';
// import 'package:izistock/common/widgets/images/t_rounded_image.dart';
//
// import '../../../../utils/constants/sizes.dart';
//
// Positioned(
// right: 0,
// bottom: 30,
// left: TSizes.defaultSpace,
// child: SizedBox(
// height: 80,
// child: ListView.separated(
// itemCount: images.length,
// shrinkWrap: true,
// scrollDirection: Axis.horizontal,
// physics: const AlwaysScrollableScrollPhysics(),
// separatorBuilder: (_, __) => const SizedBox(width: TSizes.spaceBtwItems),
// itemBuilder: (_, index) => 0bx (
// (){
// final imageSelected =controller.selectedProductImage.value == images[index];
// return TRoundedImage(
// width: 80,
// isNetworkImage: true,
// imageUrl: images[index],
// padding: const EdgeInsets.all(TSizes.sm),
// backgroundColor: dark ? TColors.dark : TColors.white,
// onPressed: () => controller.selectedProductImage.value == images[index];,
// border: Border.all(color: imageSelected ? Colors.primary : Colors.transparent,
//
// );
// },
// ),
// ),
// ),
// ),
//
//  TAppBar(
// showBackArrow:true;
// actions:[TFavouriteIcon(productId:product.id)],
// )
