import 'package:chaliar_delivery_app/constants/type_user.dart';
import 'package:chaliar_delivery_app/model_views/base_model.dart';
import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/ui/views/authentifications/register_screen.dart';

class AuthentificationHomeScreenMV extends BaseModel{
  var group = TypeUser.voiture;
  void pushPage(BuildContext context, String page) {
    Navigator.pushNamed(context, '/$page');
  }

  void setRadioGroup(String value) {
    group = value;
    print('new group value :$group');
    notifyListeners();
  }

  void pushUserRegisterPagePreference(BuildContext context) {
    Navigator.push (context,
        new MaterialPageRoute(
            builder: (BuildContext context) =>
            new UserRegisterScreen(typeUSer: group,)));
  }
}