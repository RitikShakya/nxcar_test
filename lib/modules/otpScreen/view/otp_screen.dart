import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nxcar_test/custom_widgets/custom_button.dart';
import 'package:nxcar_test/modules/otpScreen/view_model/otpController.dart';
import 'package:nxcar_test/utils/routes/routing_name_constants.dart';
import 'package:nxcar_test/utils/utils.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatelessWidget {
  OtpController otpController = Get.find();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: width,
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: Icon(
                  Icons.arrow_back,
                  color: ColorUtils.BLACK_COLOR,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter Your OTP",
                    style: TextStyleUtils.textStyleh24w400black,
                  ),
                  Text(
                    "${otpController.phoneNumber!.substring(0, 2)}*****${otpController.phoneNumber!.substring(otpController.phoneNumber!.length - 2, otpController.phoneNumber!.length)}",
                    style: TextStyleUtils.textStyleh16w500black,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 0, right: 100),
              child: PinCodeTextField(
                keyboardType: TextInputType.number,
                enablePinAutofill: true,
                appContext: context,
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                controller: otpController.controller,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(4),
                    fieldHeight: 48,
                    fieldWidth: 48,
                    activeBorderWidth: 1,
                    disabledBorderWidth: 1,
                    borderWidth: 1,
                    inactiveBorderWidth: 1,
                    selectedBorderWidth: 1,
                    selectedColor: ColorUtils.BRAND_COLOR,
                    inactiveColor: ColorUtils.GREY_BORDER,
                    activeColor: ColorUtils.BRAND_COLOR,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    errorBorderColor: ColorUtils.ERROR_RED),
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                onCompleted: (v) {
                  // otpController.onOTPCompletion(v);
                },
                onChanged: (value) {
                  if (kDebugMode) {
                    print(value);
                  }
                  if (value.length == 4) {
                    FocusScope.of(context).unfocus();
                  } else {}
                },
                beforeTextPaste: (text) {
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
              ),
            ),
            InkWell(
              child: Text(
                "Resend",
                style: TextStyleUtils.textStyleh14w400branc,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            CustomButtonNewV2(
              centerText: "Next",
              onPressed: () {
                Get.toNamed(RoutingNameConstants.HOME_SCREEN);
              },
            ),
          ],
        ),
      ),
    ));
  }
}
