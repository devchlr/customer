import 'package:flutter/material.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
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
          content:Column(
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
}
