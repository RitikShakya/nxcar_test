import 'package:get/get.dart';
import 'package:nxcar_test/modules/welcomeScreen/view_model/welcome_screen_controller.dart';

class WelcomeScreenBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(WelcomeController());
  }
}
