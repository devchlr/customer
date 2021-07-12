import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_font.dart';
import 'package:chaliar_delivery_app/ui/styles/text_style.dart';

class CustomHearder extends StatelessWidget {
 final String? title;
 final double? size;
  final Color? textColor;
  final String? fontFamily;
  final String? description;
  final bool? isRed;
  const CustomHearder({Key? key,this.isRed=false,this.title,this.size=18.0,this.textColor=Colors.white,this.fontFamily=AppFontFamilly.montserrat,this.description=''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            image: isRed==true?AssetImage("assets/images/headerRed.png"):AssetImage("assets/images/header.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: description==''?MediaQuery.of(context).size.height*0.08:MediaQuery.of(context).size.height*0.05,
              ),
              Center(
                child: Text(
                  title!,
                  style: AppTextStyle.appBarHeader(size: size!, color: textColor,fontFamily: fontFamily!,),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.001,
              ),
              Center(
                child: Text(
                  description!,
                  style: AppTextStyle.caption(color: textColor),
                ),
              ),
              description!=''?Container(
                height: 20.0,
              ):SizedBox(
                height: 0.0,
              )
            ],
          ),
        ],
    ),
    );
  }
}
