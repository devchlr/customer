import 'package:flutter_app/model_views/authentification/home_screenVM.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/chaliar_icon_size.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/ui/widgets/button.dart';
import 'package:provider/provider.dart';

class ConnexionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthentificationHomeScreenMV>(
      create: (context) => AuthentificationHomeScreenMV(),
      child: Consumer<AuthentificationHomeScreenMV>(
        builder: (context, model, child) =>
            Scaffold(
              resizeToAvoidBottomInset: true,
              body: Stack(
                fit: StackFit.expand,
                children: [
                  Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/blueGrad.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.23,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/menuFooter.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ListView(
                    children: [
                      Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 61,
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    "assets/images/logo.svg",
                                    height: AppIconSize.medium,
                                    width: AppIconSize.medium,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 41,
                              ),
                              Text(
                                "Livrez et gagnez de\nl’argent",
                                textAlign: TextAlign.center,
                                style:
                                AppTextStyle.headerApp1(color: ChaliarColors.whiteColor),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Ouvert entre 06h00 et 23h00",
                                textAlign: TextAlign.center,
                                style: AppTextStyle.bodyApp1(color: ChaliarColors.whiteColor),
                              ),
                            ],
                          ),
                      Padding(
                          padding: EdgeInsets.only(
                            right: 0,
                            top: 20,
                           //Image.asset('assets/images/delivery_courier.png')
                          ),
                          child: Center(
                            child: Container(
                              height: 355,
                              width: 355,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:AssetImage('assets/images/delivery_courier.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )
                          ),),
                      Center(
                        child: ButtonChaliar(
                            onTap: () {
                              model.pushPage(
                                  context, 'pro_particulier');
                            },
                            buttonText: 'Inscription',
                            height: 59,
                            mediaQueryWidth: 0.4,
                            borderRaduis: 100,
                            backgroundcolor: ChaliarColors.primaryColors,
                            bordercolor: ChaliarColors.primaryColors,
                            textStyle: AppTextStyle.button(
                                color: ChaliarColors.whiteColor)),
                      ),
                      SizedBox(
                        height: 19,
                      ),
                      Center(
                        child: ButtonChaliar(
                            onTap: () {
                              model.pushPage(context, 'singin');
                            },
                            buttonText: 'Connexion',
                            height: 59,
                            mediaQueryWidth: 0.4,
                            borderRaduis: 100,
                            backgroundcolor: ChaliarColors.whiteColor,
                            bordercolor: ChaliarColors.primaryColors,
                            textStyle: AppTextStyle.button(
                                color: Color(0xff34B3E8),size: 11)),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      Text(
                        "Devenir Chaliar",
                        textAlign: TextAlign.center,
                        style: AppTextStyle.bodyfooter(color: Color(0xffBBD3EB)),
                      ),
                      SizedBox(
                        height:29,
                      ),
                    ],
                  )
                ],
              ),
            ),),);
  }
}
