import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izistock/bindings/general_bindings.dart';
import 'package:izistock/features/authentication/screens/onboarding/onboarding.dart';
import 'package:izistock/utils/constants/colors.dart';
import 'package:izistock/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBinding(),
      home: const Scaffold(backgroundColor: TColors.primary,body: Center(child: CircularProgressIndicator(color: Colors.white))),
    );
  }
}