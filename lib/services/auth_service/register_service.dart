import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/models/user.dart';
import 'package:chaliar_delivery_app/services/fire_auth_service.dart';
import 'package:chaliar_delivery_app/services/fire_store_service.dart';
FirestoreService firestoreService=FirestoreService();
FireAuthService fireAuthService=FireAuthService();
FirebaseAuth auth = FirebaseAuth.instance;


class RegisterService{
  bool updatePasswordIcon(bool val){
    return val?false:true;
  }

  bool validateTextField(TextEditingController controller){
    if (controller.text == null || controller.text.isEmpty||controller.text.length<2) {
      return true;
    }else{
      return false;
    }
  }

  bool validateEmail(TextEditingController controller){
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(controller.text)?false:true;
  }

  bool validatePassord(TextEditingController controller){
    return RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(controller.text)?false:true;

  }

  bool validatePasswordBis(TextEditingController controller1,TextEditingController controller2){
    return (controller1.text==controller2.text)?false:true;
  }

  bool validatePhoneNumber(String phone){
    if (phone == null || phone.isEmpty||phone.length<9) {
      return true;
    }else{
      return false;
    }
  }

  Future<bool?> checkIfUserExist(TextEditingController controller)async{
    var user = firestoreService.getUserByFieldValue('email',controller.text);
    user.then((value){
      if(user==null){
        return false;
      }else{
        return true;
      }
    });
  }

  Future<String> registerUser(UserChaliar user)async{
    await fireAuthService.registerByEmailandPassword(user.email!, user.password!);
    var userCredential = auth.currentUser;
    user.id=userCredential!.uid;
    await firestoreService.createUser(user);
    return user.id!;
  }

}