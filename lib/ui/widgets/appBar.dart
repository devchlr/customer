import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_color.dart';
import 'package:chaliar_delivery_app/ui/styles/text_style.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_font.dart';

class ChaliarMenu{

  static AppBar topBar({double size=18.0,String fontFamily=AppFontFamilly.montserrat,Widget? leading,Color textColor=ChaliarColors.whiteColor , String? imageBackground,String? title,Color? bgColor,String description=''}) {
    return AppBar(
      shadowColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      leading: leading,
      automaticallyImplyLeading: false,
      backwardsCompatibility: false,
      elevation: 0.0,
      backgroundColor:bgColor,
      flexibleSpace: Image(
        image: AssetImage(imageBackground!,),
        filterQuality: FilterQuality.high,
        fit: BoxFit.fitWidth,
      ),
      title: Column(
        children: [
          Text(
            title!,
            style: AppTextStyle.appBarHeader(size: size, color: textColor,fontFamily: fontFamily),
          ),
          Text(
            description,
            style: AppTextStyle.caption(color: textColor),
          ),
          description!=''?Container(
            height: 20.0,
          ):SizedBox(
            height: 0.0,
          )
        ],
      ),
      centerTitle: true,
    );
  }
}

