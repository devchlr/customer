import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/chaliar_font.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter_app/ui/widgets/appBar.dart';
import 'package:flutter_app/ui/widgets/button.dart';
import 'package:flutter_app/ui/widgets/custom_header.dart';
import 'package:flutter_app/ui/widgets/input_field.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F3F3),
      body: Stack(
        children: [
          Container(
            color: Color(0xffF3F3F3),
          ),
          Padding(padding: EdgeInsets.only(
            top: 130,
            left: 30,
            right: 30
          ),
          child: ListView(
            children: [
              Padding(padding: EdgeInsets.only(
                // top: 60,
                // left: 30
              ),
                child: Text(
                  'Modifier votre profil'
                  ,style: AppTextStyle.appBarHeader(
                    color: Color(0xff042C5C),
                    size: 26,
                    fontFamily: AppFontFamilly.montserrat,
                    fontWeight: FontWeight.w400
                ),),
              ),
              SizedBox(
                height: 41,
              ),
              Container(
                width: 208,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/add_photo_profile.png'),
                      backgroundColor: Colors.transparent,
                      radius: 56,
                      child: Center(
                        child: CircleAvatar(
                          backgroundColor: Color(0xffA9AEBE),
                          radius: 30,
                          child: Center(
                            child: Image.asset('assets/icons/camera.png',scale: 3.0,),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                    Center(
                      child: Text(
                        'Ajouter une photo',
                        style: AppTextStyle.appBarHeader(
                          color: Color(0xff042C5C),
                          size: 17,
                        ),
                      ),
                    )
                  ],
                ),
              ),SizedBox(height: 32,),
              InputField(
                // controller: model.departure_address,
                fieldSize: MediaQuery.of(context).size.height * 0.025,
                label: "Email",
                isBorder: true,
                textLabelColor: ChaliarColors.secondaryColors,
                maxlenght: 250,
                backgroundColor: ChaliarColors.whiteGreyColor,
                borderColor: ChaliarColors.primaryColors,
                // controller: model.surname,
              ),
              SizedBox(height: 23,),
              InputField(
                // controller: model.departure_address,
                fieldSize: MediaQuery.of(context).size.height * 0.025,
                label: "Adresse de facturation",
                isBorder: true,
                textLabelColor: ChaliarColors.secondaryColors,
                maxlenght: 250,
                backgroundColor: ChaliarColors.whiteGreyColor,
                borderColor: ChaliarColors.primaryColors,
                // controller: model.surname,
              ),
              SizedBox(height: 23,),
              InputField(
                // controller: model.departure_address,
                fieldSize: MediaQuery.of(context).size.height * 0.025,
                label: "Code postal",
                isBorder: true,
                textLabelColor: ChaliarColors.secondaryColors,
                maxlenght: 250,
                backgroundColor: ChaliarColors.whiteGreyColor,
                borderColor: ChaliarColors.primaryColors,
                // controller: model.surname,
              ),
              SizedBox(height: 23,),
              InputField(
                // controller: model.departure_address,
                fieldSize: MediaQuery.of(context).size.height * 0.025,
                label: "Téléphone",
                isBorder: true,
                textLabelColor: ChaliarColors.secondaryColors,
                maxlenght: 250,
                backgroundColor: ChaliarColors.whiteGreyColor,
                borderColor: ChaliarColors.primaryColors,
                // controller: model.surname,
              ),
              SizedBox(height: 40,),
              Center(
                child: ButtonChaliar(
                    onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.transparent,
                              elevation: 50,
                            content:  Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('waiting...',style: AppTextStyle.appBarHeader(
                                  color: ChaliarColors.whiteColor,
                                ),),
                                SpinKitCubeGrid(
                                  color: Colors.blueAccent,
                                  size: 50.0,
                                )
                              ],
                            ),
                            ),
                            );
                      // model.formEditingController(context);
                      // Navigator.pushNamed(context, '/commande_arrivee_form');
                    },
                    buttonText: 'Valider',
                    height: MediaQuery.of(context).size.height * 0.07,
                    mediaQueryWidth: 0.45,
                    borderRaduis: 50,
                    backgroundcolor: ChaliarColors.primaryColors,
                    bordercolor: ChaliarColors.primaryColors,
                    textStyle: AppTextStyle.appBarHeader(
                      size: 17,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFontFamilly.montserrat,
                        color: ChaliarColors.whiteColor)),
              )
            ],
          ),),
          Padding(
            padding: EdgeInsets.only(
                top: 0
            ),
            child: CustomHearder(
              title: "Profil",
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height*0.08,
                left: MediaQuery.of(context).size.width*0.02
            ),
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios,color: Colors.white,),
            ),
          ),
        ],
      ),
    );
  }
}
