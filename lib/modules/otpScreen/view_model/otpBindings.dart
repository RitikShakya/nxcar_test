import 'package:get/get.dart';
import 'package:nxcar_test/modules/loginSignupScreen/view_model/login_details_controller.dart';
import 'package:nxcar_test/modules/otpScreen/view_model/otpController.dart';
import 'package:nxcar_test/modules/welcomeScreen/view_model/welcome_screen_controller.dart';

class OtpBindings extends Bindings {
  @override
  void dependencies() async {
    // TODO: implement dependencies
    var awaiting = await Get.put(OtpController());
  }
}
