import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/services/fire_auth_service.dart';
import 'package:chaliar_delivery_app/services/fire_store_service.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';



class DepartFormService{
  FirestoreService firestoreService=FirestoreService();
  FireAuthService fireAuthService=FireAuthService();
  FirebaseAuth auth = FirebaseAuth.instance;

  bool validateTextField(TextEditingController controller){
    if (controller.text == null || controller.text.isEmpty||controller.text.length<2) {
      return true;
    }else{
      return false;
    }
  }

//   bool validateDate(DateRangePickerController controller){
//     var now = new DateTime.now();
//     var berlinWallFellDate = new DateTime.utc(1989, 11, 9);
// // 0 denotes being equal positive value greater and negative value being less
//     if(controller.selectedDate!.isBefore(now))
//     {
//       return true;
//     }
//     return false;
//   }

  bool validateEmail(TextEditingController controller){
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(controller.text)?false:true;
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

  // Future<bool> checkIfUserExist(TextEditingController controller)async{
  //   var user = await firestoreService.getUserByFieldValue('email',controller.text);
  //   if (user == null) {
  //     return false;
  //   }else{
  //     return true;
  //   }
  // }
  //
  // Future<String> registerUser(UserChaliar user)async{
  //   await fireAuthService.registerByEmailandPassword(user.email!, user.password!);
  //   var userCredential =await auth.currentUser;
  //   user.id=userCredential!.uid;
  //   await firestoreService.createUser(user);
  //   return user.id!;
  // }

}