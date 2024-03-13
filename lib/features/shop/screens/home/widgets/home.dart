// import 'package:flutter/material.dart';
// import '../../../../../common/widgets/appbar/appbar.dart';
// import '../../../../../utils/constants/colors.dart';
// import '../../../../../utils/constants/text_strings.dart';
//
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: TAppBar(
//         title: Column(
//           children: [
//             Text(
//               TTexts.homeAppbarTitle,
//               style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey),
//             ),
//             Text(
//               TTexts.homeAppbarSubTitle,
//               style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),
//             ),
//           ],
//         ),
//       ),
//       body: const SingleChildScrollView(
//         child: Column(
//           children: [
//             TPrimaryHeaderContainer(
//               child: Column(
//                 children: [
//                   // Add your content for the primary header container here
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
