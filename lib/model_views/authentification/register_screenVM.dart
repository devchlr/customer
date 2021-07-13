import 'dart:async';
import 'dart:io';
import 'package:chaliar_delivery_app/model_views/base_model.dart';
import 'package:chaliar_delivery_app/constants/type_user.dart';
import 'package:chaliar_delivery_app/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:chaliar_delivery_app/constants/iconList.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chaliar_delivery_app/services/auth_service/register_service.dart';
import 'package:chaliar_delivery_app/services/fire_auth_service.dart';
import 'package:chaliar_delivery_app/services/fire_store_service.dart';
import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/services/preferences/shared_preference_service.dart';
import 'package:chaliar_delivery_app/services/user_register/google_register.dart';
import 'package:chaliar_delivery_app/ui/views/authentifications/authentification_screen.dart';
import 'package:chaliar_delivery_app/ui/widgets/custom_showSnackBar.dart';
import 'package:file_picker/file_picker.dart';

class RegisterScreenVM extends BaseModel{
   final FirebaseAuth auth = FirebaseAuth.instance;
  FirestoreService _firestoreService = FirestoreService();
  FireAuthService _fireAuthService=FireAuthService();
 SharedPreferenceService sharedPreferenceService=SharedPreferenceService();
 GoogleRegisterService googleRegisterService=GoogleRegisterService();
RegisterService registerService=RegisterService();
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
  bool isChecked=false;

  bool validate_surname=false;
   bool validate_name=false;
   bool validate_email=false;
   bool validate_password=false;
   bool validate_passwordBis=false;
   bool validate_phoneNumber=false;
   bool validate_facturationAdress=false;
   bool validate_codePostal=false;
   bool validate_city=false;
   bool validate_societe=false;
   bool validate_street=false;

   bool loading=false;
   File? cniCard;
   File? driverCard;
  void updatePasswordIcon(){
    password_obscure=registerService.updatePasswordIcon(password_obscure);
    notifyListeners();
  }

  setCheckState(){
    isChecked=isChecked?false:true;
    notifyListeners();
  }

  void updateConfirmPasswordIcon(bool val){
    confirm_password_obscure=registerService.updatePasswordIcon(confirm_password_obscure);
    notifyListeners();
  }

  void validateSurname(){
    validate_surname=registerService.validateTextField(surname);
    notifyListeners();
  }
   void validateName(){
    validate_name=registerService.validateTextField(name);
    notifyListeners();
   }
   void validateEmail(){
     validate_email = registerService.validateEmail(email);
     notifyListeners();
   }

   void validatePassord(){
     validate_password=registerService.validatePassord(password);
     notifyListeners();
   }

   void validatePasswordBis(){
     validate_passwordBis=registerService.validatePasswordBis(password, password_confirm);
     notifyListeners();
   }

   void validatePhoneNumber(){
    validate_phoneNumber=registerService.validatePhoneNumber(phone!);
    notifyListeners();
   }
   void validateAdresseFacturation(){
    validate_facturationAdress=registerService.validateTextField(facturationAdress);
    notifyListeners();
   }
   void validateCodePostal(){
    validate_codePostal=registerService.validateTextField(codePostal);
    notifyListeners();
   }

   void validateCity(){
    validate_city=registerService.validateTextField(city);
    notifyListeners();
   }

   void validateStreet(){
    validate_street=registerService.validateTextField(street);
    notifyListeners();
   }

   void validateSociete(){
   validate_societe=registerService.validateTextField(societe);
   notifyListeners();
   }

   pickFile(BuildContext context)async{
     FilePicker.platform.pickFiles().then((result) {
       if(result != null) {
         File file = File(result.files.single.path!);
         return File;
       } else {
         customShowSnackBar.showDialogError(context: context,titleDialog: 'Erreur formulaire',errorDescription: 'erreur lors de la selection du fichier');
       }
     });
   }


  bool validatorProInformation(BuildContext context){
    var verifyIfUserExist=registerService.checkIfUserExist(email);
    verifyIfUserExist.then((value){
      if(value==true){
        customShowSnackBar.showDialogError(context: context,titleDialog: 'Erreur Formulaire',errorDescription: 'L\'email Existent',errorSolution: 'L\'email renseigne appartient a ete utilise pour creer un compte utilisateur renseinger un email valide ou creer un nouveau coumpte');
        return false;
      }
    });
    validateSurname();
    if(validate_surname){
    customShowSnackBar.showDialogError(context: context,
    titleDialog: 'Erreur Formulaire',
    errorDescription: 'Le champs prenom est mal renseigner',
    errorSolution: 'le champ prenom admet une chaine de carracteres d\'un minimum de 02 carractes'
    );
    return false;
    }
    validateName();
    if(validate_name){
    customShowSnackBar.showDialogError(context: context,
    titleDialog: 'Erreur Formulaire',
    errorDescription: 'Le champs Nom est mal renseigner',
    errorSolution: 'le champ Nom admet une chaine de carracteres d\'un minimum de 02 carractes'
    );
    return false;
    }
    validateEmail();
    if(validate_email){
    customShowSnackBar.showDialogError(context: context,
    titleDialog: 'Erreur Formulaire',
    errorDescription: 'Le champs email est mal renseigner',
    errorSolution: 'le champ email admet une chaine de carracteres au format (example@domain.com))'
    );
    return false;
    }
    validatePassord();
    if(validate_password){
    customShowSnackBar.showDialogError(context: context,
    titleDialog: 'Erreur Formulaire',
    errorDescription: 'Le champs Mot de passe est mal renseigner',
    errorSolution: 'le champ Mot de passe admet une chaine de carracteres a un minimun de 8 carrecter chiffres et lettres compris et au minimun un carractere special'
    );
    return false;
    }
    validatePasswordBis();
    if(validate_passwordBis){
    customShowSnackBar.showDialogError(context: context,
    titleDialog: 'Erreur Formulaire',
    errorDescription: 'Les deux  Mots de passe doivent etre identique',
    );
    return false;
    }
    validatePhoneNumber();
    if(validate_phoneNumber){
    customShowSnackBar.showDialogError(context: context,
    titleDialog: 'Erreur Formulaire',
    errorDescription: 'Le champs telephone est mal renseigner',
    errorSolution: 'le champ telephone admet une chaine de carracteres d\'un minimum de 09 carractes et n\'est constituer que des symbole [0-9]'
    );
    return false;
    }
    validateCodePostal();
    if(validate_codePostal){
    customShowSnackBar.showDialogError(context: context,
    titleDialog: 'Erreur Formulaire',
    errorDescription: 'Le champs Code postal est mal renseigner',
    errorSolution: 'le champ Code postal admet une chaine de carracteres d\'un minimum de 02 carractes'
    );
    return false;
    }
    validateSociete();
    if(validate_societe){
    customShowSnackBar.showDialogError(context: context,
    titleDialog: 'Erreur Formulaire',
    errorDescription: 'Le champs Societe est mal renseigner',
    errorSolution: 'le champ Societe admet une chaine de carracteres d\'un minimum de 02 carractes'
    );
    return false;
    }

    validateStreet();
    if(validate_street){
    customShowSnackBar.showDialogError(context: context,
    titleDialog: 'Erreur Formulaire',
    errorDescription: 'Le champs Street est mal renseigner',
    errorSolution: 'le champ Street admet une chaine de carracteres d\'un minimum de 02 carractes'
    );
    return false;
    }

    validateAdresseFacturation();
    if(validate_facturationAdress){
    customShowSnackBar.showDialogError(context: context,
    titleDialog: 'Erreur Formulaire',
    errorDescription: 'Le champs Adresse de facturation est mal renseigner',
    errorSolution: 'le champ Adresse de facturation admet une chaine de carracteres d\'un minimum de 02 carractes'
    );
    return false;
    }
    validateCity();
    if(validate_city){
    customShowSnackBar.showDialogError(context: context,
    titleDialog: 'Erreur Formulaire',
    errorDescription: 'Le champs Ville est mal renseigner',
    errorSolution: 'le champ Ville admet une chaine de carracteres d\'un minimum de 02 carractes'
    );
    return false;
    }
    return true;

  }
  void createUser(BuildContext context, String typeUser) async {
      if (validatorProInformation(context) ==true) {
        UserChaliar user  =  UserChaliar(
            id: null,
            email: email.text,
            userRole: TypeUser.velo,
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
        var checkifRegister= registerService.registerUser(user);
        checkifRegister.then((result){
          if(result!=null){
            loading=false;
            notifyListeners();
            getOPTScreen(context,phone,result);
          }else{
            customShowSnackBar.showDialogError(context:context,titleDialog:'Erreur formulaire',errorDescription: 'Erreur lors de l\'enregistrement recommencer svp');
          }
        });
      }
  }

  void getOPTScreen(context,String? phoneNumber,String? uid) async{
    await sharedPreferenceService.setRegisterPreferenceInformation(uid!, phoneNumber!).then((value)async{
      if(value){
        await sharedPreferenceService.setStartPreferencePage('/phone_auth').then((val){
          if(val){
            Navigator.push(context,
                new MaterialPageRoute(
                    builder: (BuildContext context) =>
                    new PhoneOptValidateScreen(phone: phoneNumber,uid:uid ,)));
          }
        });
      }
    });
  }

  void googleRegister(BuildContext context)async{
    await googleRegisterService.signInWithGoogle().then((result)async{
      _currentUser =  UserChaliar(
          id: result.user!.uid,
          email: result.user!.email,
          userRole: TypeUser.velo,
          name: result.user!.displayName,
          surname: result.user!.displayName,
          phone: result.user!.phoneNumber,
      );
      await _firestoreService.createUser(_currentUser!);
      loading=false;
      notifyListeners();
      getOPTScreen(context,_currentUser?.phone,_currentUser?.id);
    }).onError((error, stackTrace){
      customShowSnackBar.initUserRequestAnimationError(context, '${error.toString()}');
    }).catchError((onError){
      customShowSnackBar.initUserRequestAnimationError(context, '${onError.toString()}');
    });
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