import 'package:flutter_app/model_views/base_model.dart';
import 'package:flutter_app/services/fire_auth_service.dart';
import 'package:flutter_app/services/fire_store_service.dart';
// import 'package:flutter_app/ui/views/auth/phone_opt/phone_number_validate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/views/authentifications/authentification_screen.dart';
import 'package:flutter_app/ui/views/orders/home_order_screen.dart';
import 'package:flutter_app/ui/widgets/custom_showSnackBar.dart';

class AuthentificationConnexionVM extends BaseModel{
  FirestoreService _storeService = FirestoreService();
  FireAuthService _fireAuthService = FireAuthService();
  BuildContext? context;
  var user;
  bool password_obscure=true;
  String? phone;
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  CustomShowSnackBar customShowSnackBar=CustomShowSnackBar();

  bool inputVerification(){
    if(phoneNumber.text==null || phoneNumber.text.isEmpty){
      return false;
    }
    if(password.text==null || password.text.isEmpty){
      return false;
    }
    return true;
  }

  void singIn(BuildContext context)async{
    customShowSnackBar.initUserRequestAnimation(context);
    if(inputVerification()){
      var userResult;
      if(await _storeService.getUserByPhoneNumber(phone!)==null){
        customShowSnackBar.initUserRequestAnimationError(context, 'user not exist create user account please');
        print('erro 1');
      }else{
        if(userResult=='404'){
          customShowSnackBar.initUserRequestAnimationError(context, 'user not exist create user account please');
          print('erro 2');
        }else{
          userResult=await _storeService.getUserByPhoneNumber(phone!);
          print(userResult['email']);
          _fireAuthService.signInWithEmailAndPassword(userResult['email'], password.text);
          getOPTScreen(context);
        }
      }

    }else{
      customShowSnackBar.initUserRequestAnimationError(context, 'tous les champs doivent etres renseigne');
    }
  }
  verifyUserAccount(BuildContext context)async{

  }
  void getOPTScreen(context) {
    Navigator.push(context,
        new MaterialPageRoute(
            builder: (BuildContext context) =>
            new PreCommandeScreen()));
  }

  void updatePasswordIcon(bool val){
    password_obscure=password_obscure?false:true;
    notifyListeners();
  }
}