
import 'package:chaliar_delivery_app/model_views/base_model.dart';
import 'package:chaliar_delivery_app/models/user.dart';
import 'package:chaliar_delivery_app/services/fire_store_service.dart';
// import 'package:chaliar_delivery_app/ui/views/auth/preCondition_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/services/preferences/shared_preference_service.dart';
import 'package:chaliar_delivery_app/ui/views/authentifications/pre_contionnal_screen.dart';
import 'package:chaliar_delivery_app/ui/widgets/custom_showSnackBar.dart';
class AuthentificationVM extends BaseModel{

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirestoreService _storeService = FirestoreService();
  UserChaliar? currentUser;
  String? phone;
  String? pin;
  String? _verificationId;
  bool loading=false;
  bool? isGetOpt;
  String? uid;
  BuildContext? context;
  CustomShowSnackBar customShowSnackBar=CustomShowSnackBar();
  SharedPreferenceService sharedPreferenceService=SharedPreferenceService();


  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential,BuildContext context) async {
    loading=true;
    notifyListeners();
    try {
      await _firebaseAuth.signInWithCredential(phoneAuthCredential).then((authCredential){
        if(authCredential.user != null){
          loading=false;
          notifyListeners();
          customShowSnackBar.initUserRequestAnimationSucess(context, 'Compte créer avec sucess');
          goToNextSCreen(context,uid!);
        }
      });
    } on FirebaseAuthException catch (e) {
      loading=false;
      notifyListeners();
      customShowSnackBar.initUserRequestAnimationError(context, e.message!);
      notifyListeners();
      print(e.message);
    }
    notifyListeners();
  }
  //function function qui recupere le numero du user
  void getUserData(String number)async{
    currentUser = await _storeService.getUser(number);
    print(currentUser?.name);
    notifyListeners();
  }

  //verifier le code pin
  sendSmsOpt(String phoneNumber,BuildContext context)async{
    loading=true;
    notifyListeners();
    phone=phoneNumber;
    var verificationAuth= _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (phoneAuthCredential) async {
        signInWithPhoneAuthCredential(phoneAuthCredential,context);
      },
      verificationFailed: (verificationFailed) async {
        loading=false;
        notifyListeners();
        customShowSnackBar.initUserRequestAnimationError(context, verificationFailed.message!);
        notifyListeners();
        print(verificationFailed.message);
      },
      codeSent: (verificationId, resendingToken) async {
        _verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) async {},
    );
    verificationAuth.then((value){
      print('oki');
    });
  }

  void confirmOPT(BuildContext context) async {
    PhoneAuthCredential phoneAuthCredential =
    PhoneAuthProvider.credential(verificationId: _verificationId!, smsCode: pin!);
    signInWithPhoneAuthCredential(phoneAuthCredential,context);
  }

//function qui redirige vers la page OPT
  void goToNextSCreen(BuildContext context,String uid)async{
    bool isCommit= await sharedPreferenceService.setStartPreferencePage('/singin');
    if(isCommit){
      Navigator.push(context,
          new MaterialPageRoute(
              builder: (BuildContext context) =>
              new PreOnboardingScreen(uid: uid)));
    }
  }

}