import 'dart:async';

import 'package:flutter_app/model_views/base_model.dart';
import 'package:flutter_app/constants/type_user.dart';
import 'package:flutter_app/models/user.dart';
// import 'package:flutter_app/ui/views/auth/phone_opt/phone_number_validate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/constants/iconList.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/services/fire_auth_service.dart';
import 'package:flutter_app/services/fire_store_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/views/authentifications/authentification_screen.dart';
import 'package:flutter_app/ui/widgets/custom_showSnackBar.dart';
import 'package:uuid/uuid.dart';

class RegisterScreenVM extends BaseModel{
   final FirebaseAuth auth = FirebaseAuth.instance;
  FirestoreService _firestoreService = FirestoreService();
  FireAuthService _fireAuthService=FireAuthService();
  // final AuthenticationService _authenticationService = AuthenticationService();
  // final NavigationService _navigationService = NavigationService();
  // final DialogService _dialogService = DialogService();

  UserChaliar? _currentUser;
  bool obscureText = true;
  String? phone;
  String iconAsset = SvgIcons.eye_close;
  TextEditingController surname = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordBis = TextEditingController();
  TextEditingController siret = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController societe = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController facturationAdress = TextEditingController();
  TextEditingController codePostal = TextEditingController();
  TextEditingController city = TextEditingController();
  CustomShowSnackBar customShowSnackBar=CustomShowSnackBar();
  TextEditingController password_confirm = TextEditingController();
  bool password_obscure=true;
  bool confirm_password_obscure=true;


  void updatePasswordIcon(bool val){
    password_obscure=password_obscure?false:true;
    notifyListeners();
  }
  void updateConfirmPasswordIcon(bool val){
    confirm_password_obscure=confirm_password_obscure?false:true;
    notifyListeners();
  }

  Future<String> validatorPartInformation() async {
    if (email.text == null || email.text.isEmpty) {
      return '404';
    } else {
      var user = await _firestoreService.getUser(phoneNumber.text);
      if (user == null) {
        return '200';
      }
    }
    if (surname.text == null || surname.text.isEmpty) {
      return '404';
    }
    if (name.text == null || name.text.isEmpty) {
      return '404';
    }
    if (codePostal.text == null || codePostal.text.isEmpty) {
      return '404';
    }
    if (city.text == null || city.text.isEmpty) {
      return '404';
    }
    if (facturationAdress.text == null || facturationAdress.text.isEmpty) {
      return '404';
    }
    return '200';
  }
  Future<String> validatorProInformation() async {
    if (email.text == null || email.text.isEmpty) {
      return '404';
    } else {
      var user = await _firestoreService.getUser(phoneNumber.text);
      if (user == null) {
        return '200';
      }
    }
    if (surname.text == null || surname.text.isEmpty) {
      return '404';
    }
    if (name.text == null || name.text.isEmpty) {
      return '404';
    }
    if (codePostal.text == null || codePostal.text.isEmpty) {
      return '404';
    }
    if (city.text == null || city.text.isEmpty) {
      return '404';
    }
    if (facturationAdress.text == null || facturationAdress.text.isEmpty) {
      return '404';
    }
    if (societe.text == null || societe.text.isEmpty) {
      return '404';
    }
    if (password.text == null || password.text.isEmpty) {
      return '404';
    }
    if (passwordBis.text == null || passwordBis.text.isEmpty) {
      return '404';
    }
    if (password.text ==  passwordBis.text) {
      return '404';
    }
    return '200';
  }
  void createUser(BuildContext context, String typeUser) async {
    customShowSnackBar.initUserRequestAnimation(context);
    if (typeUser == TypeUser.particulier) {
      if (await validatorPartInformation() == '404') {
        customShowSnackBar.initUserRequestAnimationError(context, 'Tous les champs doivent être renseignés');
      } else if (await validatorPartInformation() == '200') {
       await _fireAuthService.registerByEmailandPassword(email.text, password.text);
       var userCredential =await auth.currentUser;
       print('uid:${userCredential?.uid}');
        _currentUser =  UserChaliar(
          id: userCredential?.uid,
          email: email.text,
          userRole: TypeUser.particulier,
          name: name.text,
          surname: surname.text,
          phone: phone,
          facturationAdresse: facturationAdress.text,
          codePostal: codePostal.text,
          city: city.text,
          password: password.text
        );
        await _firestoreService.createUser(_currentUser!);
        customShowSnackBar.initUserRequestAnimationSucess(context, 'Compte créer avec sucess');

        Timer(Duration(seconds: 6),
                () =>  getOPTScreen(context,phoneNumber.text,_currentUser?.id));

      }
    } else if (typeUser == TypeUser.professionnel) {
      if (await validatorPartInformation() == '404') {
        customShowSnackBar.initUserRequestAnimationError(context, 'Tous les champs doivent être renseignés');
      } else if (await validatorPartInformation() == '200') {
        await _fireAuthService.registerByEmailandPassword(email.text, password.text);
        var userCredential =await auth.currentUser;
        print('uid:${userCredential?.uid}');
        _currentUser =  UserChaliar(
            id: userCredential?.uid,
            email: email.text,
            userRole: TypeUser.professionnel,
            name: name.text,
            surname: surname.text,
            phone: phone,
            facturationAdresse: facturationAdress.text,
            codePostal: codePostal.text,
            city: city.text,
            siret: siret.text,
            societe: societe.text,
            password: password.text
        );
        await _firestoreService.createUser(_currentUser!);
        customShowSnackBar.initUserRequestAnimationSucess(context, 'Compte créer avec sucess');
        getOPTScreen(context,phoneNumber.text,_currentUser?.id);
      }
    }
  }

  void getOPTScreen(context,String? phoneNumber,String? uid) {
    Navigator.push(context,
        new MaterialPageRoute(
            builder: (BuildContext context) =>
            new PhoneOptValidateScreen(phone: phoneNumber,uid:uid ,)));
  }

  void googleRegister(BuildContext context){
    customShowSnackBar.initUserRequestAnimation(context);
    customShowSnackBar.initUserRequestAnimationError(context, 'connexion google server lost');
  }

  void facebookRegister(BuildContext context){
    customShowSnackBar.initUserRequestAnimation(context);
    customShowSnackBar.initUserRequestAnimationError(context, 'connexion facebook server lost');
  }
  void appleRegister(BuildContext context){
    customShowSnackBar.initUserRequestAnimation(context);
    customShowSnackBar.initUserRequestAnimationError(context, 'connexion apple server lost');
  }
}