import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/routes/routing_name_constants.dart';

class LoginDetailsController extends GetxController {
  RxBool phoneNumberHandler = false.obs;
  RxBool nameHandler = false.obs;
  RxBool emailHandler = false.obs;
  RxBool vehicleNumberHandler = false.obs;

  RxBool hasErrorNumber = false.obs;
  RxBool hasErrorName = false.obs;
  RxBool hasErrorEmail = false.obs;
  RxBool hasErrorVehicleNumber = false.obs;
  TextEditingController? phoneNumberController = TextEditingController();
  TextEditingController? nameController = TextEditingController();
  TextEditingController? emailController = TextEditingController();
  TextEditingController? vehicleNumberController = TextEditingController();
  GlobalKey<FormState> registrationFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  sendOTP() {
    bool validated = registrationFormKey.currentState!.validate();
    if (!hasErrorVehicleNumber.value &&
        !hasErrorEmail.value &&
        !hasErrorName.value &&
        !hasErrorNumber.value) {
      Get.toNamed(RoutingNameConstants.OTP_SCREEN,
          arguments: [phoneNumberController!.text]);
      registrationFormKey.currentState!.save(); // Save form data (optional)
    } else {
      print("Form contains errors."); // Or display errors to the user
    }
  }

  String? validatePhoneNumber(String? text) {
    if (validateMobileNumber(text.toString()) == false) {
      // labelColor.value = ColorUtils.RED_LABLES;
      return "Enter valid Phone Number".tr;
    } else {}
    return null;
  }

  String? validateEmailID(String? text) {
    if (text.toString().isEmpty ||
        text.toString().trim().isEmpty ||
        validateEmail(text.toString()) == false) {
      // labelColor.value = ColorUtils.RED_LABLES;
      return "Enter a valid email".tr;
    } else {}
    return null;
  }

  static bool validateEmail(String value) {
    if (value == null) return false;
    Pattern emailPattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    final regexEmail = RegExp(emailPattern.toString());
    return regexEmail.hasMatch(value) ? true : false;
  }

  static bool validateMobileNumber(String value) {
    if (value == null || value == "") return false;
    const Pattern phonePattern = r'^[6-9]\d{2}\d{3}\d{4}$';
    final regexPhone = RegExp(phonePattern.toString());
    return regexPhone.hasMatch(value) ? true : false;
  }

  String? carNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Car number is required';
    }

    // Define the regular expression for a valid car number (uppercase letters and digits)
    final RegExp carNumberRegExp =
        RegExp(r'^[A-Z]{2}[ -][0-9]{1,2}(?: [A-Z])?(?: [A-Z]*)? [0-9]{4}$');

    if (!carNumberRegExp.hasMatch(value)) {
      return 'Invalid car number format';
    }

    return null; // Return null if the input is valid
  }

  String? validateName(String? text) {
    if (text.toString().isEmpty || text.toString().trim().isEmpty) {
      // labelColor.value = ColorUtils.RED_LABLES;
      return "Enter a valid name".tr;
    } else {}
    return null;
  }
}
