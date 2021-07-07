import 'package:chaliar_delivery_app/ui/styles/chaliar_color.dart';
import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_font_size.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_font.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_font_size.dart';

class AppTextStyle {
  static TextStyle header1({Color? color}) {
    return TextStyle(
      color: color,
      fontSize: AppFontSize.largest,
      fontFamily: AppFontFamilly.montserrat,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle headerApp1({Color? color,String fontFamilly=AppFontFamilly.montserrat,FontWeight fontWeight=FontWeight.bold}) {
    return TextStyle(
      color: color,
      fontSize: 27,
      fontFamily: fontFamilly,
      fontWeight: fontWeight,
      fontStyle: FontStyle.normal,

    );
  }

  static TextStyle appBarHeader({FontWeight fontWeight=FontWeight.w500,double size=18.0, Color? color,String fontFamily=AppFontFamilly.montserrat}) {
    return TextStyle(
      color: color,
      fontSize: size,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle cardTailleHeader({Color? color}) {
    return TextStyle(
      color: color,
      fontSize: 15.0,
      fontFamily: AppFontFamilly.montserrat,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle cardTaillePrice({Color? color}) {
    return TextStyle(
      color: color,
      fontSize: 15.0,
      fontFamily: AppFontFamilly.montserrat,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle cardTailleDescription({Color? color}) {
    return TextStyle(
      color: color,
      fontSize: 09.0,
      fontFamily: AppFontFamilly.avenirNext,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    );
  }
  static TextStyle tutorialHeader({Color? color}) {
    return TextStyle(
      color: Color(0XFF042C5C),
      fontSize: 18.0,
      fontFamily: AppFontFamilly.avenirHeavy,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle tutorialDescription({Color? color}) {
    return TextStyle(
      color: Color(0xFF77869E),
      fontSize: 13.0,
      fontFamily: AppFontFamilly.avenirLight,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle header1_title({Color? color}) {
    return TextStyle(
      color: color,
      fontSize: AppFontSize.large2_1_1,
      fontFamily: AppFontFamilly.montserrat,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle tabHeader({Color? color}) {
    return TextStyle(
      color: Color(0xffB0B0C3),
      fontSize: 16,
      fontFamily: AppFontFamilly.avenirNext,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle header2({Color? color}) {
    return TextStyle(
      color: color,
      fontSize: AppFontSize.larger,
      fontFamily: AppFontFamilly.montserrat,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle header3({Color? color}) {
    return TextStyle(
      color: color,
      fontSize: AppFontSize.large2_1,
      fontFamily: AppFontFamilly.montserrat,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle header3_light({Color? color, bool isUnderlined = false}) {
    return TextStyle(
        color: color,
        fontSize: AppFontSize.large2_1_1,
        fontFamily: AppFontFamilly.montserrat,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
        decoration: isUnderlined ? TextDecoration.underline : null);
  }

  static TextStyle addPhotodesc({Color? color, bool isUnderlined = false}) {
    return TextStyle(
        color: color,
        fontSize: 16,
        fontFamily: AppFontFamilly.avenirNext,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        decoration: isUnderlined ? TextDecoration.underline : null);
  }

  static TextStyle addPhotoBtn({Color? color, bool isUnderlined = false}) {
    return TextStyle(
        color: color,
        fontSize: 14,
        fontFamily: AppFontFamilly.montserrat,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        decoration: isUnderlined ? TextDecoration.underline : null);
  }

  static TextStyle addPhotoCaption({Color? color, bool isUnderlined = false}) {
    return TextStyle(
        color: color,
        fontSize: 13,
        fontFamily: AppFontFamilly.montserrat,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        decoration: isUnderlined ? TextDecoration.underline : null);
  }

  static TextStyle header4({Color? color}) {
    return TextStyle(
      color: Color(0xff2F3547),
      fontSize: 17,
      fontFamily: AppFontFamilly.avenirLight,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle body({Color? color}) {
    return TextStyle(
      color: Color(0xffBCB8B1),
      fontSize: 16.2,
      fontFamily: AppFontFamilly.avenirNext,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle bodyfooter({Color? color}) {
    return TextStyle(
      color: Color(0xffBBD3EB),
      fontSize: 14,
      fontFamily: AppFontFamilly.montserrat,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle bodyfooterField({Color? color}) {
    return TextStyle(
      color: color,
      fontSize: 10.56,
      fontFamily: AppFontFamilly.montserrat,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    );
  }
  static TextStyle bodyApp1({Color? color,bool isUnderlined=false}) {
    return TextStyle(
      decoration: isUnderlined?TextDecoration.underline:null,
      color: color,
      fontSize: 13,
      fontFamily: AppFontFamilly.montserrat,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    );
  }
  static TextStyle formComDesc({Color? color,bool isUnderlined=false}) {
    return TextStyle(
      decoration: isUnderlined?TextDecoration.underline:null,
      color: color,
      fontSize: 10.56,
      fontFamily: AppFontFamilly.montserrat,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle tailleCaption({Color? color,bool isUnderlined=false}) {
    return TextStyle(
      decoration: isUnderlined?TextDecoration.underline:null,
      color: color,
      fontSize: 10.56,
      fontFamily: AppFontFamilly.montserrat,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle cardbodyApp1({Color? color,bool isUnderlined=false}) {
    return TextStyle(
      decoration: isUnderlined?TextDecoration.underline:null,
      color: color,
      fontSize: 14,
      fontFamily: AppFontFamilly.montserrat,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle button({Color? color,double size=14}) {
    return TextStyle(
      color: color,
      fontSize: size,
      fontFamily: AppFontFamilly.montserrat,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle caption({Color? color}) {
    return TextStyle(
      color: Color(0xff98A2C0)==ChaliarColors.blackColor?Color(0xff98A2C0):color,
      fontSize: 12,
      fontFamily: AppFontFamilly.avenirLight,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle headerCaption({Color? color,double? size,String? assetFont}) {
    return TextStyle(
      color: Color(0xff98A2C0)==ChaliarColors.blackColor?Color(0xff98A2C0):color,
      fontSize: size,
      fontFamily: assetFont,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle captionPreCommande({Color? color}) {
    return TextStyle(
      color: Color(0xff98A2C0)==ChaliarColors.blackColor?Color(0xff98A2C0):color,
      fontSize: 10.1,
      fontFamily: AppFontFamilly.montserrat,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    );
  }
}
