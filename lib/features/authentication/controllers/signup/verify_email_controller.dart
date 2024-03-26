import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:izistock/common/widgets/success_screen/success_screen.dart';
import 'package:izistock/utils/constants/image_strings.dart';
import 'package:izistock/utils/constants/text_String.dart';
import 'package:izistock/utils/popups/loaders.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';

class VerifyEmailController extends GetxController{
  static VerifyEmailController get instance => Get.find();

  /// Send Email whenever Verify Screen appears and set timer for auto redirect
  @override
  void onInit(){
    sendEmailVerification();
    setTimerAutoRedirect();
    super.onInit();
  }
   ///Send Email verification link
  sendEmailVerification() async {
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(title: 'Email Sent',message:'Please Check your Inbox and verify your email.');
    } catch(e){
      TLoaders.errorSnackBar(title: 'On Snap',message: e.toString());
    }
  }
  /// Timer to automatically redirect on Email verification
  setTimerAutoRedirect(){
    Timer.periodic(
        const Duration(seconds: 1),
            (timer) async {
          await FirebaseAuth.instance.currentUser?.reload();
          final user = FirebaseAuth.instance.currentUser;
          if(user?.emailVerified ?? false){
            timer.cancel();
            Get.off(() => SuccessScreen(
                image: TImages.successFullRegisterScreen,
                title: TTexts.yourAccountCreatedTitle,
                subTitle: TTexts.yourAccountCreatedSubTitle,
                onPressed: () => AuthenticationRepository.instance.screenRedirect(),
            ),
            );
          }
        });
  }
  /// Manually check if Email Verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified){
      Get.off(
          () => SuccessScreen(
              image: TImages.successfullRegisterAnimation,
              title: TTexts.yourAccountCreatedTitle,
              subTitle: TTexts.yourAccountCreatedSubTitle,
              onPressed: () => AuthenticationRepository.instance.screenRedirect()
          ),
      );
    }
  }
}