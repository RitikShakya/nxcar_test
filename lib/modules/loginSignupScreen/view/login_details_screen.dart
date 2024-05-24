import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nxcar_test/custom_widgets/custom_button.dart';
import 'package:nxcar_test/custom_widgets/custom_text_field.dart';
import 'package:nxcar_test/modules/loginSignupScreen/view_model/login_details_controller.dart';
import 'package:nxcar_test/utils/utils.dart';

class LoginDetailsScrewen extends StatelessWidget {
  LoginDetailsController loginDetailsController = Get.find();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: width,
        height: height,
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: loginDetailsController.registrationFormKey,
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
                        "Welcome Back!",
                        style: TextStyleUtils.textStyleh24w400black,
                      ),
                      Text(
                        "Please fill out the details",
                        style: TextStyleUtils.textStyleh16w500black,
                      )
                    ],
                  ),
                ),
                CustomTextFieldV2(
                  loginDetailsController.hasErrorNumber,
                  stateHandler: loginDetailsController.phoneNumberHandler,
                  validator: loginDetailsController.validatePhoneNumber,
                  label: "Enter Your Phone Number",
                  controller: loginDetailsController.phoneNumberController,
                  keyBoardtype: TextInputType.number,
                  errorText: "".obs,
                ),
                SizedBox(
                  height: 12,
                ),
                CustomTextFieldV2(
                  loginDetailsController.hasErrorName,
                  stateHandler: loginDetailsController.nameHandler,
                  validator: loginDetailsController.validateName,
                  label: "Enter Your Name",
                  controller: loginDetailsController.nameController,
                  keyBoardtype: TextInputType.text,
                  errorText: "".obs,
                ),
                SizedBox(
                  height: 12,
                ),
                CustomTextFieldV2(
                  loginDetailsController.hasErrorEmail,
                  stateHandler: loginDetailsController.emailHandler,
                  validator: loginDetailsController.validateEmailID,
                  label: "Enter Your Email",
                  controller: loginDetailsController.emailController,
                  errorText: "".obs,
                ),
                SizedBox(
                  height: 12,
                ),
                CustomTextFieldV2(
                  loginDetailsController.hasErrorVehicleNumber,
                  stateHandler: loginDetailsController.vehicleNumberHandler,
                  validator: loginDetailsController.carNumberValidator,
                  errorText: "".obs,
                  controller: loginDetailsController.vehicleNumberController,
                  label: "Enter Your Vehicle Number",
                ),
                SizedBox(
                  height: 24,
                ),
                CustomButtonNewV2(
                  centerText: "Next",
                  onPressed: () {
                    loginDetailsController.sendOTP();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
