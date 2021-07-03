import 'package:flutter/material.dart';

class ButtonPadding{
  static EdgeInsets normal(){
    return EdgeInsets.only(
      left:5.96,
      right:5.96,
      top:5.0,
      bottom:5.0,
    );
  }
  static EdgeInsets medium(){
    return EdgeInsets.only(
      left:50.96,
      right:50.04,
      top:15.5,
      bottom:10.5,
    );
  }
  static EdgeInsets largest(){
    return EdgeInsets.only(
      left:50.96,
      right:50.04,
      top:15.5,
      bottom:10.5,
    );
  }
}

class ButtonWidth{
  static const normal=150;
  static const medium=250;
  static const largest=364;
}

class ButtonHeight{
  static const normal=40;
  static const medium=50;
  static const largest=60;
}