import 'package:get/get.dart';

class WelcomeController extends GetxController {
  late List<String> carouselList;

  @override
  void onInit() {
    carouselList = [
      "Buy a Pre Owned Car with Confidence",
      "Rev Up Your Dreams with Our Used Car Loans",
      "Simplified Used Car Financing with Nxcar"
    ];
    // TODO: implement onInit
    super.onInit();
  }
}
