import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/iconList.dart';
import 'package:flutter_app/model_views/authentification/connexionVM.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter_app/ui/widgets/button.dart';
import 'package:flutter_app/ui/widgets/custom_textField_card.dart';
import 'package:flutter_app/ui/widgets/input_field.dart';
import 'package:flutter_app/ui/widgets/svg_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';


class SingInScreen extends StatefulWidget {
  @override
  _SingInScreenState createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  String initialCountry = 'fR';
  PhoneNumber number = PhoneNumber(isoCode: 'FR');
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthentificationConnexionVM>(
      create: (context) => AuthentificationConnexionVM(),
      child: Consumer<AuthentificationConnexionVM>(
        builder: (context, model, child) =>
            Scaffold(
              resizeToAvoidBottomInset: true,
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
                  ListView(

                    children: [

                              SizedBox(
                                height: 59,
                              ),
                              Center(
                                child: SvgPicture.asset(
                                  "assets/images/logo.svg",
                                  height: 120,
                                  width: 120,
                                ),
                              ),
                              SizedBox(
                                height: 63,
                              ),
                             Center(child:  Text.rich(
                               TextSpan(
                                 text: "Contents de vous revoir",
                                 style: AppTextStyle.headerApp1(color: ChaliarColors.whiteColor),
                               ),
                             ),),
                      SizedBox(
                        height: 39,
                      ),
                         Padding(
                            padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.1,
                            right: MediaQuery.of(context).size.width * 0.1),
                           child: Card(
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.all(
                                 Radius.circular(50),
                               ),),
                             child: Container(
                               height: 60,
                               child: ListTile(
                                 title:
                                 InternationalPhoneNumberInput(
                                   spaceBetweenSelectorAndTextField: 0,
                                   onInputChanged: (PhoneNumber number) {
                                     model.phone=number.phoneNumber;
                                     print(number.phoneNumber);
                                   },
                                   initialValue: number,
                                   onInputValidated: (bool value) {
                                     print(value);
                                   },
                                   selectorConfig: SelectorConfig(
                                     selectorType: PhoneInputSelectorType.DIALOG,
                                   ),
                                   ignoreBlank: false,
                                   inputDecoration: new InputDecoration(
                                     border: InputBorder.none,
                                     focusedBorder: InputBorder.none,
                                     enabledBorder: InputBorder.none,
                                     errorBorder: InputBorder.none,
                                     disabledBorder: InputBorder.none,
                                     contentPadding:
                                     EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                                     hintText: 'Telephone',
                                   ),
                                   autoValidateMode: AutovalidateMode.disabled,
                                   selectorTextStyle: TextStyle(color: Colors.black),
                                   textFieldController: model.phoneNumber,
                                   formatInput: false,
                                   keyboardType:
                                   TextInputType.numberWithOptions(
                                       signed: true,
                                       decimal: true
                                   ),
                                   onSaved: (PhoneNumber number) {
                                     print('On Saved: $number');
                                   },
                                 ),
                               ),
                             ),
                           ),
                         ),
                          SizedBox(
                            height: 23,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.1,
                                right: MediaQuery.of(context).size.width * 0.1),
                            child:CustomTextFieldCard(
                              controller: model.password,
                              obscure_field: model.password_obscure,
                              card_raduis: 50,
                              card_size: 60,
                              leading: SvgIconButton(
                                  iconAsset: SvgIcons.padlock,
                                  onPressed: () {

                                  }),
                              trailing: GestureDetector(
                                onTap: (){
                                  model.updatePasswordIcon(model.password_obscure);
                                },
                                child:  model.password_obscure?Icon(Icons.visibility_off_outlined,color: Color(0xffB0B0C3)):Icon(Icons.remove_red_eye_outlined,color: Color(0xffB0B0C3),),
                              ),
                              placeholder: 'Mot de passe',
                            ),
                          ),
                          SizedBox(
                            height:23,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.1,
                                  right: MediaQuery.of(context).size.width * 0.1),
                              child: Center(
                                child: Text(
                                  'Mot de passe oublié ?',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle.bodyApp1(
                                      color: ChaliarColors.whiteColor),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 39,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.25,
                                right: MediaQuery.of(context).size.width * 0.25),
                            child: ButtonChaliar(
                              onTap: ()async{
                                model.singIn(context);
                              },
                              buttonText: 'Suivant',
                              height: MediaQuery.of(context).size.height * 0.065,
                              mediaQueryWidth: 0.23,
                              borderRaduis: 40,
                              backgroundcolor: ChaliarColors.secondaryColors,
                              bordercolor: ChaliarColors.secondaryColors,
                              textStyle:
                              AppTextStyle.button(color: ChaliarColors.whiteColor),
                            ),
                          ),
                          SizedBox(
                            height:30,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/term_condition');
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: Center(
                                child: Text(
                                  'Vous acceptez nos conditions générales d’utilisations',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle.caption(
                                      color: ChaliarColors.whiteColor),
                                ),
                              ),
                            ),
                          ),
                      SizedBox(
                        height: 146,
                      ),
                        ]),

                    ],
                  )
              ),
            ),);
  }
}



















// import 'package:flutter_app/model_views/authentification/connexionVM.dart';
// import 'package:flutter_app/ui/styles/chaliar_color.dart';
// import 'package:flutter_app/ui/styles/chaliar_font.dart';
// import 'package:flutter_app/ui/styles/text_style.dart';
// import 'package:flutter/material.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:flutter_app/ui/widgets/button.dart';
// import 'package:provider/provider.dart';
//
// class PhoneOptMainScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<AuthentificationConnexionVM>(
//       create: (context) => AuthentificationConnexionVM(),
//       child: Consumer<AuthentificationConnexionVM>(
//         builder: (context, model, child) =>
//             Scaffold(
//               resizeToAvoidBottomInset: false,
//               body: Stack(
//                 children: [
//                   Container(
//                     color: ChaliarColors.whiteGreyColor,
//                   ),
//                   Container(
//                     padding: EdgeInsets.only(
//                       right: MediaQuery.of(context).size.height * 0.035,
//                       left: MediaQuery.of(context).size.height * 0.035,
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           height: 150.0,
//                         ),
//                         Center(
//                           child: Text.rich(
//                             TextSpan(
//                               text: "Numéro de téléphone",
//                               style:
//                               AppTextStyle.appBarHeader(fontWeight: FontWeight.w400,size: 27,color: Color(0xff1C1939),fontFamily: AppFontFamilly.avenirNext,),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 26.0,
//                         ),
//                         Text(
//                           "Entrez votre numéro de téléphone, vous allez recevoir un code par SMS pour valider votre compte",
//                           textAlign: TextAlign.center,
//                           style: AppTextStyle.appBarHeader( fontWeight: FontWeight.w400,
//                               color: Color(0xff1C1939),size: 15,fontFamily: AppFontFamilly.avenirNext),
//                         ),
//                         SizedBox(
//                           height: 48.0,
//                         ),
//                         Card(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: const BorderRadius.all(
//                               Radius.circular(50.0),
//                             ),
//                           ),
//                           elevation: 2,
//                           child:Container(
//                             margin: EdgeInsets.only(
//                               top: 01,
//                               bottom: 01,
//                               left: 20,
//                               right: 20
//                             ),
//                             child:
//                             Row(
//                               children: [
//                                 Expanded(child: IntlPhoneField(
//                                   showDropdownIcon: true,
//                                   decoration: InputDecoration(
//                                     border:OutlineInputBorder(
//                                       borderSide: BorderSide.none,
//                                     ),
//                                     hintText: 'Numéro de téléphone',
//                                     labelStyle:
//                                     AppTextStyle.header4(color: ChaliarColors.blackColor),
//                                     filled: true,
//                                     fillColor: ChaliarColors.whiteColor,
//                                     hintStyle:
//                                     AppTextStyle.header4(color: Color(0xff1C1939)),
//                                   ),
//                                   initialCountryCode: 'FR',
//                                   onChanged: (phone) {
//                                     model.phone=phone.completeNumber;
//                                   },
//                                 ),)
//                               ],
//                             )
//                           ),
//                         ),
//                         SizedBox(
//                           height: 106.0,
//                         ),
//                         Center(
//                           child: ButtonChaliar(
//                               onTap: () async{
//                                 model.context=context;
//                                 await model.verifyUserAccount();
//                               },
//                               buttonText: 'Valider le code',
//                               height: 60.0,
//                               mediaQueryWidth: 0.5,
//                               borderRaduis: 30,
//                               backgroundcolor: ChaliarColors.primaryColors,
//                               bordercolor: ChaliarColors.primaryColors,
//                               textStyle:
//                               AppTextStyle.button(color: ChaliarColors.whiteColor)),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),),);
//   }
// }
