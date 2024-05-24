import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:math' as math;

import '../utils/utils.dart';

class CustomButtonNewV2 extends StatefulWidget {
  final double? width;
  final double? height;
  final String? centerText;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback? onPressed;
  final IconData? icon;
  final double? radius;
  final bool? hasBorder;
  const CustomButtonNewV2(
      {this.width,
      this.height,
      this.centerText,
      this.backgroundColor,
      this.textColor,
      this.onPressed,
      this.icon,
      this.radius = 8,
      this.hasBorder});

  @override
  State<CustomButtonNewV2> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButtonNewV2> {
  @override
  Widget build(BuildContext context) {
    var maxHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        alignment: Alignment.center,
        height: this.widget.height == null ? 40 : this.widget.height,
        width: this.widget.width == null
            ? MediaQuery.of(context).size.width
            : this.widget.width,
        decoration: BoxDecoration(
            color: widget.backgroundColor ?? ColorUtils.BRAND_COLOR,
            borderRadius: BorderRadius.all(Radius.circular(widget.radius!)),
            border: Border.all(
                width: 2,
                color: widget.hasBorder == true
                    ? ColorUtils.BRAND_COLOR
                    : Colors.transparent)),
        child: Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null)
                Icon(
                  widget.icon,
                  color: Colors.white,
                ),
              SizedBox(width: 4),
              Text(
                widget.centerText == null ? "" : widget.centerText!,
                style: TextStyle(
                    color: widget.textColor == null
                        ? Colors.white
                        : widget.textColor!,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    fontFamily: "NotoSans-regular"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
