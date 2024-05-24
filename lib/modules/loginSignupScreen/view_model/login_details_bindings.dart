import 'package:get/get.dart';
import 'package:nxcar_test/modules/loginSignupScreen/view_model/login_details_controller.dart';

class LoginDetailsBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(LoginDetailsController());
  }
}
