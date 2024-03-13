import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:izistock/common/styles/spacing_styles.dart';
import 'package:izistock/common/styles/widgets/login_signup/form_divider.dart';
import 'package:izistock/features/authentication/screens/login/widgets/login_form.dart';
import 'package:izistock/features/authentication/screens/login/widgets/login_header.dart';
import 'package:izistock/common/styles/widgets/login_signup/social_buttons.dart';
import 'package:izistock/utils/constants/colors.dart';
import 'package:izistock/utils/constants/sizes.dart';
import 'package:izistock/utils/constants/text_strings.dart';
import 'package:izistock/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/image_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingwithAppBarHeight,
          child: Column(
            children: [
              TLoginHeader(dark: dark),
              const TLoginForm(),
              ///divider
              TFormDivider(dividerText: TTexts.orSignInwith.capitalize!),
              const SizedBox(width: TSizes.spaceBtwSections,),
              ///footer
              const TSocialButton()
            ],
          ),
          ),
        ),
    );
  }
}
