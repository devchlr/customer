import 'package:flutter/material.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'dart:ui';

class InputField extends StatelessWidget {
  final String? placeholder;
  final String? label;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function()? onTap;
  final void Function(String val)? onChanged;
  final void Function(String val)? onSubmitted;
  final TextEditingController? controller;
  final bool? autofocus;
  final Color? borderColor;
  final Color? fillColor;
  final Color? textFillColor;
  final Color? textLabelColor;
  final int? maxlenght;
  final bool? isBorder;
  final double? fieldSize;
  final double? raduis;
  final Color? backgroundColor;
  final bool? obscureText;
  final TextInputType? typeInput;
  final int? minlent;

  InputField(
      {this.obscureText=false,
        this.typeInput,
        this.placeholder,
      this.label,
      this.suffixIcon,
      this.prefixIcon,
      this.onTap,
      this.onChanged,
      this.onSubmitted,
      this.fillColor = ChaliarColors.primaryColors,
      this.autofocus = false,
      this.borderColor = ChaliarColors.whiteGreyColor,
      this.textFillColor,
      this.textLabelColor,
      this.controller,
      this.isBorder = false,
      this.fieldSize,
      this.raduis = 6.0,
      this.backgroundColor,
      this.maxlenght,
        this.minlent
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.0,
      child: TextField(
        maxLengthEnforced: false,
        keyboardType: typeInput,
        obscureText: obscureText!,
        cursorColor: ChaliarColors.whiteColor,
        onTap: onTap,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        controller: controller,
        autofocus: autofocus!,
        style: AppTextStyle.header2(
            color: textFillColor==null
                ? ChaliarColors.blackColor
                : textFillColor!),
        textAlignVertical: TextAlignVertical(y: 0.6),
        decoration: InputDecoration(
          border: isBorder!
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(raduis!),
                  borderSide: BorderSide(
                      color: borderColor!, width: 0.5, style: BorderStyle.solid))
              : null,
          hintText: label == null ? 'label' : label,
          hintStyle: AppTextStyle.bodyfooterField(
              color: textLabelColor == null
                  ? ChaliarColors.blackColor
                  : textLabelColor!),
          filled: true,
          fillColor: backgroundColor == null
              ? ChaliarColors.whiteColor
              : backgroundColor,
          // hintStyle: AppTextStyle.body(
          //     color: textFillColor == null
          //         ? ChaliarColors.blackColor
          //         : textFillColor!),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          enabledBorder: isBorder!
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(raduis!),
                  borderSide: BorderSide(
                      color: borderColor!, width: 0.5, style: BorderStyle.solid))
              : null,
          // isDense: true, // Added this
          contentPadding: EdgeInsets.only(
              top: fieldSize == null ? 10 : fieldSize!,
              bottom: fieldSize == null ? 10 : fieldSize!,
              left: 20,
              right: 20),
        ),
      ),
    );
  }
}
