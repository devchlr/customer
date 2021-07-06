import 'package:flutter_app/constants/type_user.dart';
import 'package:flutter_app/model_views/authentification/home_screenVM.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/chaliar_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/ui/styles/chaliar_icon_size.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter_app/ui/widgets/custom_radio_listTile.dart';
import 'package:flutter_app/ui/widgets/button.dart';
import 'package:provider/provider.dart';

class ProParticulierScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthentificationHomeScreenMV>(
      create: (context) => AuthentificationHomeScreenMV(),
      child: Consumer<AuthentificationHomeScreenMV>(
        builder: (context, model, child) =>
            Scaffold(
              body: SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      height: 400,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/bgBlueHmVelo.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                          children: [
                            SizedBox(
                              height: 90,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 0),
                              child:
                              Center(
                                child:
                                SvgPicture.asset(
                                  "assets/images/logo.svg",
                                  height: 104,
                                  width: 200,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 220,
                                ),
                                Container(
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:CrossAxisAlignment.center,
                                      children:[
                                        Text.rich(
                                          TextSpan(
                                            text: "Bienvenue sur Chaliar",
                                            style: AppTextStyle.headerApp1(
                                                color: Color(0xff2F3547),fontFamilly: AppFontFamilly.avenirHeavy,fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: 3,
                                          width: 57.68,
                                          decoration:
                                          BoxDecoration(color: ChaliarColors.whiteGreyColor),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        CustomRadioListTile(
                                          radioColor: ChaliarColors.secondaryColors,
                                          onClick: (){
                                            model.setRadioGroup(TypeUser.velo);
                                          },
                                          width: 0.55,
                                          heigth: 0.19,
                                          raduis: 5.0,
                                          title: 'J’ai un vélo',
                                          subtile:
                                          '29€',
                                          group: model.group,
                                          value: TypeUser.velo,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        CustomRadioListTile(
                                          onClick: (){
                                            model.setRadioGroup(TypeUser.scooter);
                                          },
                                          radioColor: ChaliarColors.secondaryColors,
                                          width: 0.55,
                                          heigth: 0.19,
                                          raduis: 5.0,
                                          title: 'J’ai un scooter',
                                          subtile:
                                          '39€',
                                          group: model.group,
                                          value: TypeUser.scooter,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        CustomRadioListTile(
                                          onClick: (){
                                            model.setRadioGroup(TypeUser.voiture);
                                          },
                                          radioColor: ChaliarColors.secondaryColors,
                                          width: 0.55,
                                          heigth: 0.19,
                                          raduis: 5.0,
                                          title: 'J’ai une voiture',
                                          subtile:
                                          '49€',
                                          group: model.group,
                                          value: TypeUser.voiture,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        CustomRadioListTile(
                                          onClick: (){
                                            model.setRadioGroup(TypeUser.camion);
                                          },
                                          radioColor: ChaliarColors.secondaryColors,
                                          width: 0.55,
                                          heigth: 0.19,
                                          raduis: 5.0,
                                          title: 'J’ai un camion',
                                          subtile:
                                          '89€',
                                          group: model.group,
                                          value: TypeUser.camion,
                                        ),
                                        SizedBox(
                                          height:35,
                                        ),
                                        ButtonChaliar(
                                            onTap: (){
                                              model.pushUserRegisterPagePreference(context);
                                            },
                                            buttonText: 'Suivant',
                                            height: 48,
                                            mediaQueryWidth: 0.3,
                                            borderRaduis: 100,
                                            backgroundcolor: ChaliarColors.primaryColors,
                                            bordercolor: ChaliarColors.primaryColors,
                                            textStyle: AppTextStyle.button(
                                                color: ChaliarColors.whiteColor)),
                                        SizedBox(
                                          height:55,
                                        ),
                                      ]
                                  ),
                                )
                              ],
                            ),
                          ]),
                    ),

                  ],
                ),
              ),

            ),),);
  }
}
