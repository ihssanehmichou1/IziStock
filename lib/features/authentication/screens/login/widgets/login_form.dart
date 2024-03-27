import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:izistock/features/authentication/controllers/login/login_controller.dart';
import 'package:izistock/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:izistock/features/authentication/screens/signup/widgets/signup.dart';
import 'package:izistock/navigation_menu.dart';
import 'package:izistock/utils/validators/validation.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_String.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
          child: Column(
            children: [
              ///Email
              TextFormField(
                controller: controller.email,
                validator: (value) => TValidator.validateEmail(value),
                decoration:const InputDecoration(prefixIcon: Icon(Iconsax.direct_right),labelText: TTexts.email) ,
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          ///Password
              Obx(
                    () => TextFormField(
                      controller: controller.password,
                      validator: (value) => TValidator.validatePassword(value),
                      obscureText: controller.hidePassword.value,
                      decoration:  InputDecoration(
                        labelText: TTexts.password,
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                          icon:  Icon(controller.hidePassword.value ?Iconsax.eye_slash : Iconsax.eye),
                    ),
                  ),
                ),
              ),
          const SizedBox(height: TSizes.spaceBtwInputFields / 2),

          ///remember me and forget password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///remember me
              Row(
                children: [
                  Obx(() =>  Checkbox(
                      value: controller.rememberMe.value,
                      onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value ),
                  ),
                  const Text(TTexts.rememberMe),
                ],
              ),

              ///forget password
              TextButton(onPressed: () => Get.to(() => const ForgetPassword()), child:  const Text(TTexts.forgetPassword))
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwSections),

          ///sign in button
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => controller.emailAndPasswordSignup(), child: const Text(TTexts.signIn))),
          const SizedBox(height: TSizes.spaceBtwItems),
          ///create account button
          SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () => Get.to(() => const SignupScreen()), child: const Text(TTexts.createAccount))),
        ],
      ),
    )
    );
  }
}
