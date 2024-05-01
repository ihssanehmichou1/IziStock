import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:izistock/common/widgets/containers/primary_header_container.dart';
import 'package:izistock/common/widgets/images/t_circular_image.dart';
import 'package:izistock/features/personalization/screens/profile/profile.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../profile/widgets/user_profile_title.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  ///AppBar
                  const TAppBar(
                      title: Text('Account',
                          style: TextStyle(fontFamily: AutofillHints.birthdayDay))),
                  // user Profile card
                  TUserProfileTitle(onPressed: () => Get.to(() =>   const ProfileScreen())),

                  // user Profile
                   ListTile(
                    leading: const TCircularImage(image: TImages.user, width: 50, height: 50, padding: 0, isNetWorkImage: true),
                    title: Text('iZiStock', style: Theme.of(context).textTheme.headlineSmall!.apply(color:TColors.white)),
                    subtitle:Text('iZiStock', style: Theme.of(context).textTheme.bodyMedium!.apply(color:TColors.white)),
                    trailing: IconButton(onPressed: (){}, icon: const Icon(Iconsax.edit,color: TColors.white)),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
            /// body
            /// body
            Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
            children: [
            const TSectionHeading(title: ' Account sitting',showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwSections),
            TSittingsMenuTile(
              icon: Iconsax.safe_home,
              title: 'My Address',
              subTitle: 'Set shopping delivery address',
              onTap: (){},
            ),
          ],
        ),
      ),
      ],
    ),
    ));
  }
}