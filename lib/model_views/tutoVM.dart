import 'package:chaliar_delivery_app/model_views/base_model.dart';
import 'package:flutter/material.dart';

class TutorialVM extends BaseModel{
  void PushPage(BuildContext context) {
    Navigator.pushNamed(context, '/connexion');
  }
}