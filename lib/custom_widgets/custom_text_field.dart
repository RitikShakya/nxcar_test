import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';

class CustomTextFieldV2 extends StatelessWidget {
  RxBool stateHandler = true.obs;
  RxString? errorText = ''.obs;
  RxBool hasError;

  String? label;
  TextEditingController? controller;
  final String? Function(String?) validator;
  var keyBoardtype;
  var onChanged;
  var onSaved;
  var onTap;

  CustomTextFieldV2(
    this.hasError, {
    this.errorText,
    this.label,
    this.controller,
    required this.validator,
    required this.stateHandler,
    Key? key,
    this.keyBoardtype = TextInputType.text,
    this.onChanged,
    this.onSaved,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
        // height: 6, // Set a fixed height
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntrinsicHeight(
              child: Container(
                color: stateHandler.value
                    ? ColorUtils.BRAND_COLOR_LIGHT
                    : ColorUtils.GREY_COLOR_PLACEHOLDER,
                child: TextFormField(
                  onTap: () {
                    hasError.value = false;
                  },
                  textCapitalization: label == "Enter Your Vehicle Number"
                      ? TextCapitalization.characters
                      : TextCapitalization.none,
                  controller: controller,
                  cursorColor: ColorUtils.BRAND_COLOR,
                  decoration: InputDecoration(
                    focusColor: ColorUtils.BRAND_COLOR,
                    alignLabelWithHint: true,
                    focusedBorder: stateHandler.value
                        ? OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                width: 0.2, color: Colors.white))
                        : OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                width: 0.2, color: ColorUtils.GREY_BORDER)),
                    enabledBorder: stateHandler.value
                        ? OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                width: 0.2, color: Colors.white))
                        : OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                width: 0.2, color: ColorUtils.GREY_BORDER)),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 0.2,
                          color: ColorUtils.ERROR_RED), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 0.2,
                          color: ColorUtils.ERROR_RED), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(8),
                    ),
                    floatingLabelStyle:
                        const TextStyle(color: ColorUtils.GREY_TEXT),
                    isDense: false,
                    labelText: label,
                    labelStyle: TextStyle(
                      fontSize: 16,
                      color: ColorUtils.GREY_TEXT,
                    ),
                    contentPadding: EdgeInsets.only(left: 24),
                  ),
                  keyboardType: keyBoardtype,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      stateHandler.value = true;
                      hasError.value = false;
                    } else {
                      stateHandler.value = false;
                    }
                    onChanged;
                  },
                  validator: (value) {
                    errorText!.value = validator?.call(value) ?? '';
                    hasError.value = errorText!.value.isNotEmpty;
                    return null;
                  },
                ),
              ),
            ),
            Obx(
              () => Visibility(
                visible: hasError.value,
                child: Container(
                  margin: EdgeInsets.only(left: 24, top: 2),
                  child: Text(
                    errorText!.value,
                    style: TextStyle(
                      color: ColorUtils.ERROR_RED,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
