import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/constants/package_size.dart';
import 'package:chaliar_delivery_app/constants/price.dart';
import 'package:chaliar_delivery_app/model_views/base_model.dart';
import 'package:chaliar_delivery_app/models/commande.dart';
import 'package:chaliar_delivery_app/services/google_place/place_service.dart';
import 'package:chaliar_delivery_app/ui/views/orders/form/camera/add_photo_screen.dart';
import 'package:chaliar_delivery_app/ui/widgets/custom_showSnackBar.dart';

class TailleScreeenViewmodel extends BaseModel{
  String package_size= PackageSize.medium;
  TextEditingController package_nature=TextEditingController();
  OrderDeliveryInformation? orderDeliveryInformation;
  OrderRecipientInformation? orderRecipientInformation;
  CustomShowSnackBar customShowSnackBar=CustomShowSnackBar();
  GooglePlaceService googlePlaceService=GooglePlaceService();

  bool isPackageName=false;
  packageName(){
    isPackageName=(package_nature.text.isEmpty||package_nature.text.length<2||package_nature.text=='');
    notifyListeners();
  }

  setObject(OrderDeliveryInformation delivery,OrderRecipientInformation recipient){
    orderDeliveryInformation=delivery;
    orderRecipientInformation=recipient;
    notifyListeners();
  }

  double getDistance(){
      var depart=orderDeliveryInformation!.departure_address;
      var arrival=orderRecipientInformation!.arrival_address;
     var km_distance=googlePlaceService.getDistance(depart!, arrival!);
    return km_distance;
  }

  double getPriceByDistance(String value,double distance){
    switch(value){
      case PackageSize.small:return distance*TypePrice.ps;
      case PackageSize.medium:return distance*TypePrice.pm;
      case PackageSize.large:return distance*TypePrice.pl;
      case PackageSize.extralarge:return distance*TypePrice.pxl;
      default:return -1;
    }
  }


  bool validator(BuildContext context){
    packageName();
    if(isPackageName){
      customShowSnackBar.showDialogError(context: context,titleDialog: 'Erreur formulaire',
          errorDescription: 'le champ Nom de l’objet à transporter est mal renseigne',
          errorSolution: 'le champ Nom de l’objet à transporter comporte une chaine de carracteres d\'un minimum de 02 carractes');
      return false;
    }
    return true;
  }

  void selectedCard(String val){
   package_size=val;
   notifyListeners();
  }

  void formEditingController(BuildContext context){
    if(validator(context)){
      OrderPackageInformation packageInformation=new OrderPackageInformation(package_nature:package_nature.text,package_size: package_size);
      Navigator.push(context,
          new MaterialPageRoute(
              builder: (BuildContext context) =>
              new AddPhotoScreen(packageInformation: packageInformation,recipientInformation: orderRecipientInformation,deliveryInformation: orderDeliveryInformation,)));
    }
  }


}