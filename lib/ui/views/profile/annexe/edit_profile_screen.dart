

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/model_views/profile/annexe/edit_ProfileVM.dart';
import 'package:chaliar_delivery_app/models/user.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_color.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_font.dart';
import 'package:chaliar_delivery_app/ui/styles/text_style.dart';
import 'package:chaliar_delivery_app/ui/widgets/button.dart';
import 'package:chaliar_delivery_app/ui/widgets/custom_header.dart';
import 'package:chaliar_delivery_app/ui/widgets/input_field.dart';
import 'package:provider/provider.dart';


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EditProfileScreenMV>(
      create: (context) => EditProfileScreenMV(),
      child: Consumer<EditProfileScreenMV>(
          builder: (context, model, child) =>
              FutureBuilder(
                  future:model.getUserD(),
                  builder: (context,AsyncSnapshot<DocumentSnapshot>snapshot){
                    if(snapshot.connectionState!=ConnectionState.done){
                      return Scaffold(
                        body: Container(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      );
                    }
                    Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                    var user=UserChaliar.fromData(data);
                    model.initController(
                      email:user.email,
                      facturation_adress:user.facturationAdresse,
                      code_postal:user.codePostal,
                      phone:user.phone,
                    );

                    Widget builCircleAvatar(context){
                      return user.profile_url!=null?  CircleAvatar(
                        backgroundImage:NetworkImage(data['profile_url'].toString()),
                        backgroundColor: Colors.transparent,
                        radius: 56,
                      ):CircleAvatar(
                        backgroundImage:AssetImage('assets/images/add_photo_profile.png'),
                        backgroundColor: Colors.transparent,
                        radius: 56,
                        child:Center(
                          child: CircleAvatar(
                            backgroundColor: Color(0xffA9AEBE),
                            radius: 30,
                            child: Center(
                              child: Image.asset('assets/icons/camera.png',scale: 3.0,),
                            ),
                          ),
                        ),
                      );
                    }
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
                              padding: EdgeInsets.only(
                                  top: 10
                              ),
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
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
                                      GestureDetector(
                                        onTap: model.getImage,
                                        child:model.image!=null? CircleAvatar(
                                          radius: 56,
                                          backgroundImage: FileImage(model.file!),
                                        ): builCircleAvatar(context),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Center(
                                          child:GestureDetector(
                                            onTap: model.getImage,
                                            child: Text(
                                              'Ajouter une photo',
                                              style: AppTextStyle.appBarHeader(
                                                color: Color(0xff042C5C),
                                                size: 17,
                                              ),
                                            ),
                                          )
                                      )
                                    ],
                                  ),
                                ),SizedBox(height: 32,),
                                InputField(
                                  controller: model.emailC,
                                  fieldSize: MediaQuery.of(context).size.height * 0.025,
                                  label: '${user.email}',
                                  isBorder: true,
                                  textLabelColor: ChaliarColors.secondaryColors,
                                  maxlenght: 250,
                                  backgroundColor: ChaliarColors.whiteGreyColor,
                                  borderColor: ChaliarColors.primaryColors,
                                  // controller: model.surname,
                                ),
                                SizedBox(height: 23,),
                                InputField(
                                  controller: model.facturationAdress,
                                  fieldSize: MediaQuery.of(context).size.height * 0.025,
                                  label: '${user.facturationAdresse==null?'Entrer une adresse de facturation':user.facturationAdresse}',
                                  isBorder: true,
                                  textLabelColor: ChaliarColors.secondaryColors,
                                  maxlenght: 250,
                                  backgroundColor: ChaliarColors.whiteGreyColor,
                                  borderColor: ChaliarColors.primaryColors,
                                  // controller: model.surname,
                                ),
                                SizedBox(height: 23,),
                                InputField(
                                  controller: model.codePostal,
                                  fieldSize: MediaQuery.of(context).size.height * 0.025,
                                  label: '${user.codePostal==null?'entrer un code Postal':user.codePostal}',
                                  isBorder: true,
                                  textLabelColor: ChaliarColors.secondaryColors,
                                  maxlenght: 250,
                                  backgroundColor: ChaliarColors.whiteGreyColor,
                                  borderColor: ChaliarColors.primaryColors,
                                  // controller: model.surname,
                                ),
                                SizedBox(height: 23,),
                                InputField(
                                  controller: model.phoneNumber,
                                  fieldSize: MediaQuery.of(context).size.height * 0.025,
                                  label: '${user.phone}',
                                  isBorder: true,
                                  fillColor: ChaliarColors.whiteGreyColor,
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
                                        model.updateUser(user.id!);
                                        // model.formEditingController(context);
                                        // Navigator.pushNamed(context, '/commande_arrivee_form');
                                      },
                                      buttonText: 'Valider',
                                      height: 48,
                                      mediaQueryWidth: 0.45,
                                      borderRaduis: 50,
                                      backgroundcolor: ChaliarColors.primaryColors,
                                      bordercolor: ChaliarColors.primaryColors,
                                      textStyle: AppTextStyle.appBarHeader(
                                          size: 17,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: AppFontFamilly.montserrat,
                                          color: ChaliarColors.whiteColor)),
                                ),
                                SizedBox(
                                  height: 30,
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
                                Navigator.pushNamed(context,'/home_profile');
                              },
                              child: Icon(Icons.arrow_back_ios,color: Colors.white,),
                            ),
                          ),
                        ],
                      ),
                    );
                  })
      ),);
  }
}
