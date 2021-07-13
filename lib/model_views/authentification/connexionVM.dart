import 'package:firebase_auth/firebase_auth.dart';
import 'package:chaliar_delivery_app/model_views/base_model.dart';
import 'package:chaliar_delivery_app/services/fire_auth_service.dart';
import 'package:chaliar_delivery_app/services/fire_store_service.dart';
import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/services/preferences/shared_preference_service.dart';
import 'package:chaliar_delivery_app/ui/views/orders/home_order_screen.dart';
import 'package:chaliar_delivery_app/ui/widgets/custom_showSnackBar.dart';

class AuthentificationConnexionVM extends BaseModel{
  FirestoreService _storeService = FirestoreService();
  FireAuthService _fireAuthService = FireAuthService();
  CustomShowSnackBar customShowSnackBar=CustomShowSnackBar();
  FirebaseAuth auth=FirebaseAuth.instance;
  BuildContext? context;
  var user;
  bool password_obscure=true;
  String? phone;
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  SharedPreferenceService sharedPreferenceService=SharedPreferenceService();
  bool loading=false;
  bool inputVerification(){
    if(phoneNumber.text==null || phoneNumber.text.isEmpty){
      customShowSnackBar.showDialogError(context: context,
          titleDialog: 'Erreur Formulaire',
          errorDescription: 'Le champs telephone est mal renseigner',
          errorSolution: 'le champ telephone admet une chaine de carracteres d\'un minimum de 09 carractes et n\'est constituer que des symbole [0-9]'
      );
      loading=false;
      notifyListeners();
      return false;
    }
    if(password.text==null || password.text.isEmpty){
      customShowSnackBar.showDialogError(context: context,
          titleDialog: 'Erreur Formulaire',
          errorDescription: 'Le champs Mot de passe est mal renseigner',
          errorSolution: 'le champ Mot de passe admet une chaine de carracteres a un minimun de 8 carrecter chiffres et lettres compris et au minimun un carractere special'
      );
      loading=false;
      notifyListeners();
      return false;
    }
    return true;
  }

  void singIn(BuildContext context)async{
    loading=true;
    notifyListeners();
    if(inputVerification()){
      var userResult=await _storeService.getUserByFieldValue('phone',phone!);
      print('resulta $userResult');
      if(userResult==null){
        loading=false;
        notifyListeners();
        customShowSnackBar.initUserRequestAnimationError(context, 'user not exist create user account please');
        print('erro 1');
      }else{
        // customShowSnackBar.initUserRequestAnimation(context);
        var singIng=  _fireAuthService.signInWithEmailAndPassword(userResult['email'], password.text);
        singIng.then((value)async{
          var user= auth.currentUser;
          if(user!=null ){
            if(userResult['userRole']=='livreur'){
              await sharedPreferenceService.setRegisterPreferenceInformation(userResult['id'], phone!).then((val) {
                loading=false;
                notifyListeners();
                getOPTScreen(context);});
            }else{
              loading=false;
              notifyListeners();
              customShowSnackBar.showDialogError(context: context,titleDialog: 'L\'utilisateur n\'est pas inscript comme livreur',errorDescription: 'bien vouloir creer un compte utilisateur pour utiliser ce compte');
            }


          }else{
            loading=false;
            notifyListeners();
            customShowSnackBar.showDialogError(context: context,titleDialog: 'Erreur Formulaire de Connexion',errorDescription: value);

          }
        });

      }
    }else{
      loading=false;
      notifyListeners();
      customShowSnackBar.showDialogError(context: context,titleDialog: 'tous les champs doivent etres renseigne');
    }
  }

  verifyUserAccount(BuildContext context)async{
  }
  void getOPTScreen(context) async{
    await sharedPreferenceService.setStartPreferencePage('/singin').then((value){
      if(value){
        Navigator.push(context,
            new MaterialPageRoute(
                builder: (BuildContext context) =>
                new PreCommandeScreen()));
      }
    }
    );
  }

  void updatePasswordIcon(bool val){
    password_obscure=password_obscure?false:true;
    notifyListeners();
  }
}