import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIconButton extends StatelessWidget {
  final String? iconAsset;
  final Color? iconColor;
  final double? iconSize;
  final VoidCallback? onPressed;
  SvgIconButton(
      {this.iconAsset, this.iconColor, this.onPressed, this.iconSize});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SvgPicture.asset(
        iconAsset!,
        color: iconColor == null ? null : iconColor,
        height: iconSize,
        width: iconSize,
      ),
      onTap: onPressed,
    );
  }
}
