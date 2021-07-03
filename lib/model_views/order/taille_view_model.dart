import 'package:flutter/material.dart';
import 'package:flutter_app/constants/package_size.dart';
import 'package:flutter_app/model_views/base_model.dart';
import 'package:flutter_app/models/commande.dart';
import 'package:flutter_app/ui/views/orders/form/camera/add_photo_screen.dart';
import 'package:flutter_app/ui/widgets/custom_showSnackBar.dart';

class TailleScreeenViewmodel extends BaseModel{
  String package_size= PackageSize.medium;
  TextEditingController package_nature=TextEditingController();
  OrderDeliveryInformation? orderDeliveryInformation;
  OrderRecipientInformation? orderRecipientInformation;
  CustomShowSnackBar customShowSnackBar=CustomShowSnackBar();
  bool validator(){
    if(package_nature.text.isEmpty){
      return false;
    }
    return true;
  }

  void selectedCard(String val){
   package_size=val;
   notifyListeners();
  }

  void formEditingController(BuildContext context){
    // customShowSnackBar.initUserRequestAnimation(context);
    if(true){
      OrderPackageInformation packageInformation=new OrderPackageInformation(package_nature:package_nature.text,package_size: package_size);
      Navigator.push(context,
          new MaterialPageRoute(
              builder: (BuildContext context) =>
              new AddPhotoScreen()));
    }else{
      print('donne du formulaire non conforme');
    }
  }


}