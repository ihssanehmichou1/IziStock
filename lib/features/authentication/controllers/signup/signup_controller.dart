import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:izistock/data/repositories/authentication/authentication_repository.dart';
import 'package:izistock/data/repositories/user/user_repository.dart';
import 'package:izistock/features/authentication/screens/signup/verify_email.dart';
import 'package:izistock/utils/constants/image_strings.dart';
import 'package:izistock/utils/popups/full_screen_loader.dart';
import 'package:izistock/utils/popups/loaders.dart';
import 'package:izistock/common/widgets/network_manager.dart';

import '../../../../data/repositories/user/user_model.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  ///Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  ///Signup
  Future<void> signup() async {
    try {
      /// Start Loading
      TFullScreenLoader.openLoadingDialog('We are processing your information...', TImages.daceranimation);

      /// Check Internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      /// Form validation
      if (!signupFormKey.currentState!.validate()) return;

      /// Privacy Policy Check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'In order to create an account, you must have to read and accept the Privacy Policy & Terms of Use.',
        );
        return;
      }

      // Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Save Authentication user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);
      // show Success Message
      TLoaders.successSnackBar(title: 'Congratulations', message: 'Your account has been created Verify email to continue');

      // Move to Verify Email Screen
      Get.to(()=>  VerifyEmailScreen(email:email.text.trim()));
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }
}
