import 'package:chaliar_delivery_app/model_views/base_model.dart';
import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/services/preferences/shared_preference_service.dart';

class TutorialVM extends BaseModel{
  SharedPreferenceService sharedPreferenceService=SharedPreferenceService();
  void PushPage(BuildContext context) async{
    bool isCommit=await sharedPreferenceService.setStartPreferencePage('/connexion');
    Navigator.pushNamed(context, '/connexion');
  }
}