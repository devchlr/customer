import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/model_views/base_model.dart';
import 'package:chaliar_delivery_app/models/user.dart';
import 'package:chaliar_delivery_app/services/fire_store_service.dart';
import 'package:chaliar_delivery_app/services/preferences/shared_preference_service.dart';
import 'package:chaliar_delivery_app/ui/widgets/custom_showSnackBar.dart';
import 'package:share/share.dart';

class HomeProfileMV extends BaseModel{
CustomShowSnackBar customShowSnackBar=CustomShowSnackBar();
FirestoreService firestoreService = FirestoreService();
FirebaseAuth auth= FirebaseAuth.instance;
UserChaliar? currentUser;
SharedPreferenceService sharedPreferenceService=SharedPreferenceService();


void getPageByName(BuildContext context, String? routeName){
  Navigator.pushNamed(context, routeName!);
}

void singoutUser(BuildContext context)async{
  customShowSnackBar.initUserRequestAnimation(context);
  var user = auth.currentUser;
  if(user!=null){
    await auth.signOut();
    Navigator.pushNamedAndRemoveUntil(context, '/singin', (route) => false);
  }
}

void sharedApp(){
  Share.share('check out my website https://example.com', subject: 'Inviter un ami sur Chaliar!');
}

getUserD(){
  var user = auth.currentUser;
    return firestoreService.getUserFuture(user!.uid);
}


}