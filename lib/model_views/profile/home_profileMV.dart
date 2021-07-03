import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model_views/base_model.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/services/fire_store_service.dart';
import 'package:flutter_app/ui/widgets/custom_showSnackBar.dart';
import 'package:share/share.dart';

class HomeProfileMV extends BaseModel{
CustomShowSnackBar customShowSnackBar=CustomShowSnackBar();
FirestoreService firestoreService = FirestoreService();
FirebaseAuth auth= FirebaseAuth.instance;
UserChaliar? currentUser;

void getPageByName(BuildContext context, String? routeName){
  customShowSnackBar.initUserRequestAnimation(context);
  Navigator.pushNamed(context, routeName!);
  notifyListeners();
}

void singoutUser(BuildContext context)async{
  customShowSnackBar.initUserRequestAnimation(context);
  if(auth.currentUser!=null){
    await auth.signOut();
  }
  Navigator.pushNamedAndRemoveUntil(context, '/singin', (route) => false);
  notifyListeners();
}

void sharedApp(){
  Share.share('check out my website https://example.com', subject: 'Inviter un ami sur Chaliar!');
  notifyListeners();
}

void getUser()async{
  var user=auth.currentUser;
   var fireStoreResult=await firestoreService.getUser(user!.uid);
  // currentUser=UserChaliar.fromData();
  // print('usrInfo:$currentUser');
  notifyListeners();
}

}