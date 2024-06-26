import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nxcar_test/modules/loginSignupScreen/view_model/login_details_repo.dart';
import 'package:nxcar_test/modules/loginSignupScreen/view_model/login_repo_impl.dart';
import 'package:otp_autofill/otp_autofill.dart';

import '../../../utils/routes/routing_name_constants.dart';

class OtpController extends GetxController {
  late OTPTextEditController controller;
  var phoneNumber;

  LoginSignupRepo? loginSignupRepo;

  @override
  void onInit() {
    loginSignupRepo = Get.put(LoginSignupRepoImpl());
    // TODO: implement onInit
    super.onInit();
    phoneNumber = Get.arguments[0] == null ? "9650373038" : Get.arguments[0];

    _otpListener();
  }

  veri_otp() {}

  _otpListener() {
    OTPInteractor()
        .getAppSignature()
        //ignore: avoid_print
        .then((value) => print('signature - $value'));
    controller = OTPTextEditController(
      codeLength: 4,
      //ignore: avoid_print
      onCodeReceive: (code) => print('Your Application receive code - $code'),
    )..startListenUserConsent(
        (code) {
          final exp = RegExp(r'(\d{4})');
          return exp.stringMatch(code ?? '') ?? '';
        },
      );
  }
}
