import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_color.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_font.dart';
import 'package:chaliar_delivery_app/ui/styles/text_style.dart';
import 'package:chaliar_delivery_app/ui/widgets/button.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomShowSnackBar{
  void initUserRequestAnimationSucess(BuildContext context, String successMessage){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: Colors.transparent,
          elevation: 50,
          content:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/add_photo_profile.png'),
                backgroundColor: Colors.transparent,
                child: Icon(Icons.check,size: 40,color: Colors.green,),
              ),
              SizedBox(height: 20,),
              Text(successMessage,style: AppTextStyle.appBarHeader(
                  color: Colors.white,
                  size: 14.0
              ),),
            ],
          )
      ),
    );
  }
  void initUserRequestAnimationError(BuildContext context, String errorLabel){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: Colors.transparent,
          elevation: 50,
          content:Container(
            height: 400,
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.cancel,size: 40,color: Colors.red,),
                SizedBox(height: 20,),
                Text(errorLabel,style: AppTextStyle.appBarHeader(
                    color: Colors.white,
                    size: 14.0
                ),),
              ],
            ),
          )
      ),
    );
  }
  void initUserRequestAnimation(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 50,
        content:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Patienter...',style: AppTextStyle.appBarHeader(
              color: ChaliarColors.whiteColor,
            ),),
            SizedBox(height: 20,),
            SpinKitThreeBounce(
              color: Colors.blueAccent,
              size: 50.0,
            )
          ],
        ),
      ),
    );
  }

  void showDialogError(
      {BuildContext? context,
      String? titleDialog,
      String? errorDescription,
      String? errorSolution}){
    showDialog<void>(
      context: context!,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Center(child: Text('$titleDialog',style: AppTextStyle.appBarHeader(
            color: Colors.redAccent,
            size: 18,
            fontWeight: FontWeight.bold,
          ),),),
          content: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.all(5),
              height: 250,
              width: 400,
              child: Column(
                children:  <Widget>[
                  Center(
                    child: CircleAvatar(
                      backgroundImage:AssetImage('assets/images/add_photo_profile.png'),
                      backgroundColor: Colors.transparent,
                      radius: 40,
                      child: Icon(Icons.close_sharp,color: Colors.red,size: 40,),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(child: Text('$errorDescription',textAlign:TextAlign.center,style: AppTextStyle.appBarHeader(
                  color: ChaliarColors.secondaryColors,
                  size: 16,
                  fontWeight: FontWeight.w400,
                  )),),
                  SizedBox(
                    height: 20,
                  ),
                  errorSolution!=null?Text('$errorSolution',textAlign:TextAlign.center,style: AppTextStyle.appBarHeader(
                    color: ChaliarColors.secondaryColors,
                    size: 12,
                    fontWeight: FontWeight.w400,
                  )):Container(),
                ],
              ),
            )
          ),
          actions: <Widget>[
            ButtonChaliar(
                onTap: () {
                  Navigator.of(context).pop();
                },
                buttonText: 'Fermer',
                height: 48,
                mediaQueryWidth: 0.45,
                borderRaduis: 5,
                backgroundcolor: Colors.redAccent,
                bordercolor: Colors.redAccent,
                textStyle: AppTextStyle.appBarHeader(
                    size: 17,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppFontFamilly.montserrat,
                    color: ChaliarColors.whiteColor)),
          ],
        );
      },
    );
  }
}

