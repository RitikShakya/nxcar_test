import 'dart:async';

import 'package:get/get.dart';
import 'package:nxcar_test/utils/routes/routing_name_constants.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() async {
    super.onInit();

    startTime();
  }

  void navigateToOtherScreen() {
    Get.offAllNamed(RoutingNameConstants.WELCOME_SCREEN);
  }

  startTime() async {
    var duration = const Duration(milliseconds: 3000);
    return Timer(duration, navigateToOtherScreen);
  }
}
