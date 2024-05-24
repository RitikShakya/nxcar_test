import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nxcar_test/modules/homeScreen/view/home_screen.dart';
import 'package:nxcar_test/modules/loginSignupScreen/view/login_details_screen.dart';
import 'package:nxcar_test/modules/otpScreen/view/otp_screen.dart';
import 'package:nxcar_test/modules/loginSignupScreen/view_model/login_details_bindings.dart';
import 'package:nxcar_test/modules/otpScreen/view_model/otpBindings.dart';
import 'package:nxcar_test/modules/welcomeScreen/view/welcome_screen.dart';
import 'package:nxcar_test/modules/welcomeScreen/view_model/welcome_screen_bindings.dart';
import 'package:nxcar_test/utils/routes/routing_name_constants.dart';

import 'modules/splashScreen/view/splash_screen.dart';
import 'modules/splashScreen/view_model/splash_screen_bindings.dart';

class MyAppHome extends StatelessWidget {
  const MyAppHome({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return GetMaterialApp(
      // // when there is no route defined it will redirect to this route
      unknownRoute: GetPage(
          name: RoutingNameConstants.SPLASH_SCREEN,
          page: () => const SplashScreen(),
          binding: SplashScreenBinding()),
      onGenerateRoute: (settings) {
        if (kDebugMode) {
          print("onGenerateRoute--${settings.name}");
        }
        return null;
      },
      routingCallback: (routing) {
        if (kDebugMode) {
          print("routingCallback--${routing?.current}");
        }
      },

      // theme: theme(),
      debugShowCheckedModeBanner: false,
      popGesture: true,
      navigatorKey: GlobalKey<NavigatorState>(),
      locale: Get.locale,

      // translationsKeys: AppTranslation.translationsKeys,  for different locales set the translation keys
      themeMode: ThemeMode.system,
      defaultTransition: Transition.leftToRight,
      initialRoute: RoutingNameConstants.SPLASH_SCREEN,
      getPages: [
        GetPage(
            name: RoutingNameConstants.SPLASH_SCREEN,
            page: () => const SplashScreen(),
            binding: SplashScreenBinding()),
        GetPage(
            name: RoutingNameConstants.WELCOME_SCREEN,
            page: () => WelcomeScreen(),
            binding: WelcomeScreenBindings()),
        GetPage(
            name: RoutingNameConstants.LOGIN_DETAILS_SCREEN,
            page: () => LoginDetailsScrewen(),
            binding: LoginDetailsBindings()),
        GetPage(
            name: RoutingNameConstants.LOGIN_DETAILS_SCREEN,
            page: () => LoginDetailsScrewen(),
            binding: LoginDetailsBindings()),
        GetPage(
            name: RoutingNameConstants.OTP_SCREEN,
            page: () => OtpScreen(),
            binding: OtpBindings()),
        GetPage(
          name: RoutingNameConstants.HOME_SCREEN,
          page: () => HomeScreen(),
        ),
      ],
    );
  }
}
