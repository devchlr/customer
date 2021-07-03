import 'dart:ui';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/chaliar_font.dart';
import 'package:flutter_app/ui/styles/chaliar_icon_size.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  FirebaseAuth _auth =FirebaseAuth.instance;
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    nextScreen();
  }
  void nextScreen()async{
    if(await widget._auth.currentUser==null){
      Timer(Duration(seconds: 6),
              () => Navigator.pushReplacementNamed(context, '/tuto'));
    }else{
      print('toujours actif');
      // widget._auth.signOut();
      Timer(Duration(seconds: 6),
              () => Navigator.pushReplacementNamed(context, '/pre_commande'));
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
              Expanded(
                  flex: 5,
                  child: Column(
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
                  )),
              Expanded(
                flex: 1,
                child: Row(
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
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
