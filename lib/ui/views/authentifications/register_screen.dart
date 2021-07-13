import 'package:chaliar_delivery_app/constants/iconList.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_color.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_font.dart';
import 'package:chaliar_delivery_app/ui/styles/text_style.dart';
import 'package:chaliar_delivery_app/ui/widgets/button.dart';
import 'package:chaliar_delivery_app/ui/widgets/input_field.dart';
import 'package:chaliar_delivery_app/ui/widgets/loading.dart';
import 'package:chaliar_delivery_app/ui/widgets/svg_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/model_views/authentification/register_screenVM.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';

class UserRegisterScreen extends StatelessWidget {
  final String typeUSer;
  String initialCountry = 'fR';
  PhoneNumber number = PhoneNumber(isoCode: 'FR');
  UserRegisterScreen({this.typeUSer='particulier'});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterScreenVM>(
      create: (context) => RegisterScreenVM(),
      child: Consumer<RegisterScreenVM>(
        builder: (context, model, child) =>
            Scaffold(
              resizeToAvoidBottomInset: true,
              body: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/blueGrad.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height*0.07,
                        left: MediaQuery.of(context).size.width * 0.36,
                        right: MediaQuery.of(context).size.width * 0.36
                    ),
                    child: Text(
                      'Inscription',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.appBarHeader(size: 19.8,color: ChaliarColors.whiteColor),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height*0.1,
                        left: MediaQuery.of(context).size.width * 0.05,
                        right: MediaQuery.of(context).size.width * 0.05
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.08),
                      ),
                      elevation: 2,
                      child: ListView(
                        padding: EdgeInsets.only(
                            top: 0
                        ),
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                            child: InputField(
                              // fieldSize: MediaQuery.of(context).size.height * 0.02,
                                controller: model.surname,
                                label: "Prénom",
                                placeholder: "Prénom",
                                textFillColor: ChaliarColors.blackColor,
                                maxlenght: 250,
                                errorText: model.validate_surname?'format du Prénom incorrect':null,
                                onChanged: (value){
                                  model.validateSurname();
                                }
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                            child: InputField(
                                fieldSize: MediaQuery.of(context).size.height * 0.02,
                                label: "Nom",
                                controller: model.name,
                                placeholder: "Nom",
                                textFillColor: ChaliarColors.blackColor,
                                maxlenght: 250,
                                errorText: model.validate_name?'format du Nom incorrect':null,
                                onChanged: (value){
                                  model.validateName();
                                }
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                            child: InputField(
                                fieldSize: MediaQuery.of(context).size.height * 0.02,
                                label: "Email",
                                controller: model.email,
                                typeInput: TextInputType.emailAddress,
                                placeholder: "Email",
                                textFillColor: ChaliarColors.blackColor,
                                maxlenght: 300,
                                errorText: model.validate_email?'format de l\'email incorrect':null,
                                onChanged: (value){
                                  model.validateEmail();
                                }
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                            child: InputField(
                              fieldSize: MediaQuery.of(context).size.height * 0.02,
                              label: "Adresse ",
                              maxlenght: 250,
                              textFillColor: ChaliarColors.blackColor,
                              controller: model.facturationAdress,
                              errorText: model.validate_facturationAdress?'Adresse non valide':null,
                              onChanged: (value){
                                model.validateAdresseFacturation();
                              },
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                            child: InputField(
                              fieldSize: MediaQuery.of(context).size.height * 0.02,
                              label: "Code Postal",
                              maxlenght: 20,
                              textFillColor: ChaliarColors.blackColor,
                              controller: model.codePostal,
                              errorText: model.validate_codePostal?'Code postal non valide':null,
                              onChanged: (value){
                                model.validateCodePostal();
                              },
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                            child: InputField(
                              fieldSize: MediaQuery.of(context).size.height * 0.02,
                              label: "Ville",
                              maxlenght: 250,
                              textFillColor: ChaliarColors.blackColor,
                              controller: model.city,
                              errorText: model.validate_city?'Ville non valide':null,
                              onChanged: (value){
                                model.validateCity();
                              },
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                            child:
                            InternationalPhoneNumberInput(
                              initialValue: number,
                              onInputChanged: (PhoneNumber number) {
                                model.phone=number.phoneNumber;
                                model.validatePhoneNumber();
                                print(number.phoneNumber);
                              },
                              onInputValidated: (bool value) {
                                print(value);
                              },
                              selectorConfig: SelectorConfig(
                                showFlags: false,
                                selectorType: PhoneInputSelectorType.DIALOG,
                              ),
                              ignoreBlank: false,
                              inputDecoration: new InputDecoration(
                                errorText: model.validate_phoneNumber?'Numero de telephone incorrect':null,
                                // border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                // enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding:
                                EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                                hintText: 'Telephone',
                                hintStyle:AppTextStyle.bodyfooterField(
                                ),
                              ),
                              autoValidateMode: AutovalidateMode.disabled,
                              selectorTextStyle: TextStyle(color: Colors.black),
                              // initialValue: number,
                              textFieldController: model.phoneNumber,
                              formatInput: false,
                              keyboardType:
                              TextInputType.numberWithOptions(signed: true, decimal: true),
                              // inputBorder: OutlineInputBorder(),
                              onSaved: (PhoneNumber number) {
                                print('On Saved: $number');
                              },
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                            child: InputField(
                              fieldSize: MediaQuery.of(context).size.height * 0.02,
                              label: "Mot de passe",
                              controller: model.password,
                              errorText: model.validate_password?'format du mot de passe incorrect minimun  1 une lettre majuscule 1 lettre minuscule 1 nombre  1 carractere special ( ! @ # \$ & * ~ )':null,
                              onChanged: (value){
                                model.validatePassord();
                              },
                              suffixIcon:GestureDetector(
                                onTap: (){
                                  model.updatePasswordIcon();
                                },
                                child:  model.password_obscure?Icon(Icons.visibility_off_outlined,color: ChaliarColors.whiteGreyColor):Icon(Icons.remove_red_eye_outlined,color: ChaliarColors.whiteGreyColor,),
                              ),
                              typeInput: TextInputType.text,
                              obscureText: model.password_obscure,
                              textFillColor: ChaliarColors.blackColor,
                              maxlenght: 300,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                            child: InputField(
                              fieldSize: MediaQuery.of(context).size.height * 0.02,
                              label: "Confirmation de mot de passe",
                              controller: model.password_confirm,
                              errorText: model.validate_passwordBis?'les mots de passe ne correspondent pas':null,
                              onChanged: (value){
                                model.validatePasswordBis();
                              },
                              suffixIcon:GestureDetector(
                                onTap: (){
                                  model.updateConfirmPasswordIcon(model.confirm_password_obscure);
                                },
                                child: model.confirm_password_obscure?Icon(Icons.visibility_off_outlined,color: ChaliarColors.whiteGreyColor):Icon(Icons.remove_red_eye_outlined,color: ChaliarColors.whiteGreyColor),
                              ),
                              typeInput: TextInputType.text,
                              obscureText: model.confirm_password_obscure,
                              textFillColor: ChaliarColors.blackColor,
                              maxlenght: 300,
                              // controller: model.email,
                              // controller: model.email,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),



                         Padding(
                            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                            child: InputField(
                              fieldSize: MediaQuery.of(context).size.height * 0.02,
                              label: "Nom société",
                              maxlenght: 250,
                              textFillColor: ChaliarColors.blackColor,
                              controller: model.societe,
                              errorText: model.validate_societe?'Nom société non valide':null,
                              onChanged: (value){
                                model.validateSociete();
                              },
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                            child: InputField(
                              readOnly: true,
                              fieldSize: MediaQuery.of(context).size.height * 0.02,
                              label: "Piece d\'identite",
                              maxlenght: 250,
                              textFillColor: ChaliarColors.blackColor,
                              suffixIcon: ButtonChaliar(
                                  onTap: () async{
                                   await model.pickFile(context);
                                  },
                                  buttonText: 'Importer',
                                  height: 15,
                                  mediaQueryWidth: 0.1,
                                  borderRaduis: 5,
                                  backgroundcolor: ChaliarColors.primaryColors,
                                  bordercolor: ChaliarColors.primaryColors,
                                  textStyle: AppTextStyle.button(
                                    size: 10,
                                      color: ChaliarColors.whiteColor)),
                            ),
                          ),
                         SizedBox(
                            height: 8,
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                            child: InputField(
                              readOnly: true,
                              fieldSize: MediaQuery.of(context).size.height * 0.02,
                              label: "Permis de conduire",
                              maxlenght: 250,
                              textFillColor: ChaliarColors.blackColor,
                              suffixIcon: ButtonChaliar(
                                  onTap: () async{
                                   await model.pickFile(context);
                                  },
                                  buttonText: 'Importer',
                                  height: 15,
                                  mediaQueryWidth: 0.1,
                                  borderRaduis: 5,
                                  backgroundcolor: ChaliarColors.primaryColors,
                                  bordercolor: ChaliarColors.primaryColors,
                                  textStyle: AppTextStyle.button(
                                      size: 10,
                                      color: ChaliarColors.whiteColor)),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                         Padding(
                            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                            child:
                            InputField(
                              readOnly: true,
                              fieldSize: MediaQuery.of(context).size.height * 0.02,
                              label: "Moyen de Transport ${typeUSer}",
                              maxlenght: 250,
                              textFillColor: ChaliarColors.blackColor,
                              controller: model.siret,
                              suffixIcon: Checkbox(
                                value:model.isChecked,
                                onChanged: (value) {
                                 model.setCheckState();
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 31,
                          ),
                          model.loading?LoadingForm():Container(),
                          model.loading?SizedBox(height: 31,):Container(),
                          Center(
                            child: ButtonChaliar(
                                onTap: () async{
                                  model.createUser(context,typeUSer);
                                },
                                buttonText: 'Connexion',
                                height: 54,
                                mediaQueryWidth: 0.35,
                                borderRaduis: 27,
                                backgroundcolor: ChaliarColors.primaryColors,
                                bordercolor: ChaliarColors.primaryColors,
                                textStyle: AppTextStyle.button(
                                    color: ChaliarColors.whiteColor)),
                          ),
                          typeUSer != 'particulier'?SizedBox(
                            height: 0,
                          )
                              :SizedBox(
                            height: 19,
                          ),
                          typeUSer != 'particulier'?SizedBox(
                            height: 0,
                          )
                              :Center(
                            child: Text(
                              "Ou",
                              textAlign: TextAlign.center,
                              style: AppTextStyle.appBarHeader(size:14.4,fontFamily:AppFontFamilly.avenirNext,color: Color(0xff838391)),
                            ),
                          ),
                          typeUSer != 'particulier'?SizedBox(
                            height: 0,
                          )
                              :SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                              height: 41.0
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
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
                                      style: AppTextStyle.appBarHeader(size:7.2,color: Color(0xff838391)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              height: 30.0
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
      ),
    );
  }
}
