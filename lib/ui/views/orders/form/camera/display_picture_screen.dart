import 'package:flutter/material.dart';
import 'dart:io';
import 'package:chaliar_delivery_app/ui/styles/chaliar_color.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_font.dart';
import 'package:chaliar_delivery_app/ui/styles/text_style.dart';
import 'package:chaliar_delivery_app/ui/widgets/button.dart';


class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  const DisplayPictureScreen({Key? key, required this.imagePath}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;
    return
      Scaffold(
        body: Stack(
          children: [
            Transform.scale(
              scale: 100.0,
              child: Center(
                child: AspectRatio(
                  aspectRatio: 50.0,
                  child:Image.file(File(imagePath)),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height*0.87
            ),
              child: Container(
                height: 130.0,
                padding: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0
                ),
                color: Color(0x6B242424),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Text('Reprendre',style: AppTextStyle.appBarHeader(
                          color: ChaliarColors.whiteColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppFontFamilly.montserrat,
                          size: 14
                      ),),
                    ),
                    ButtonChaliar(
                        onTap: () {
                          Navigator.pushNamed(context, '/resume_order_screen');
                        },
                        buttonText: 'Je Valide',
                        height: MediaQuery.of(context).size.height * 0.07,
                        mediaQueryWidth: 0.20,
                        borderRaduis: 41,
                        backgroundcolor: ChaliarColors.primaryColors,
                        bordercolor: ChaliarColors.primaryColors,
                        textStyle: AppTextStyle.button(
                            color: ChaliarColors.whiteColor)),
                  ],
                ),
              ),
            )
          ],
        ),
      );
  }
}