import 'dart:ui';
import 'package:chaliar_delivery_app/services/preferences/shared_preference_service.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_color.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_font.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_icon_size.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/ui/widgets/button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  FirebaseAuth _auth =FirebaseAuth.instance;
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferenceService sharedPreferenceService=SharedPreferenceService();
  void initState() {
    super.initState();
    nextScreen();
  }
  void nextScreen()async{
    if(await widget._auth.currentUser==null){
      print('oki1');
      String nextPage= await sharedPreferenceService.getStartPreferencePage();
      print(nextPage=='');
      Timer(Duration(seconds: 6),
              () => Navigator.pushReplacementNamed(context, nextPage==''?'/tuto':nextPage));
    }else{
      print('toujours actif');
      String nextPage= await sharedPreferenceService.getStartPreferencePage();
      Timer(Duration(seconds: 6),
              () => Navigator.pushReplacementNamed(context, nextPage));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/blueGrad.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 200.0,
                  ),
                  Center(
                    child: SvgPicture.asset(
                      "assets/images/logo.svg",
                      height: AppIconSize.large,
                      width: AppIconSize.large,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container()
                ,
              ),
              Container(
                height: 70,
                child: Center(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'POWERED\n@LIKEWEB AGENCY',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: AppFontFamilly.avenirHeavy,
                            fontSize: 10.0,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
