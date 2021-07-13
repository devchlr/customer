import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/constants/package_size.dart';
import 'package:chaliar_delivery_app/constants/price.dart';
import 'package:chaliar_delivery_app/model_views/base_model.dart';
import 'package:chaliar_delivery_app/models/commande.dart';
import 'package:chaliar_delivery_app/services/database/api.dart';
import 'package:chaliar_delivery_app/services/database/order_store_service.dart';
import 'package:chaliar_delivery_app/services/fire_auth_service.dart';
import 'package:chaliar_delivery_app/services/google_place/place_service.dart';
import 'package:chaliar_delivery_app/services/preferences/shared_preference_service.dart';
import 'package:chaliar_delivery_app/ui/views/orders/form/resume_order_screen.dart';


class AddPhotoVM extends BaseModel{
  OrderDeliveryInformation? orderDeliveryInformation;
  OrderRecipientInformation? orderRecipientInformation;
  OrderPackageInformation? orderPackageInformation;
  SharedPreferenceService sharedPreferenceService=SharedPreferenceService();
  DataBaseApi orderDataBase=DataBaseApi('orders');
  DataBaseApi messageDataBase=DataBaseApi('messages');
  FirebaseAuth auth=FirebaseAuth.instance;
  bool isLoading=false;
  GooglePlaceService googlePlaceService=GooglePlaceService();


  double getDistance(){
    var depart=orderDeliveryInformation!.departure_address;
    var arrival=orderRecipientInformation!.arrival_address;
    var km_distance=googlePlaceService.getDistance(depart!, arrival!);
    return km_distance;
  }


  double getPriceByDistance(String value){
    double distance =getDistance();
    switch(value){
      case PackageSize.small:return distance*TypePrice.ps;
      case PackageSize.medium:return distance*TypePrice.pm;
      case PackageSize.large:return distance*TypePrice.pl;
      case PackageSize.extralarge:return distance*TypePrice.pxl;
      default:return -1;
    }
  }


  void getPackageResume(BuildContext context){
    isLoading=true;
    notifyListeners();
    var order_size=orderPackageInformation!.package_size;
    var km_price=getPriceByDistance(order_size!);
    var user = auth.currentUser;
    Order data=new Order(
      order_price: km_price,
      order_km: getDistance(),
      order_status: 'loading',
        user_id: user!.uid,
        deliveryInformation: orderDeliveryInformation?.toJson(),
        packageInformation: orderPackageInformation?.toJson(),
        recipientInformation: orderRecipientInformation?.toJson()
    );
    var order= orderDataBase.addDocument(data.toJson());
    order.then((value) {
      var message=messageDataBase.setDocument(value.id);
      message.then((val){
        var pref=sharedPreferenceService.setNewOrder(value.id);
        pref.then((result){
          if(result){
            isLoading=false;
            notifyListeners();
            Navigator.push(context,
                new MaterialPageRoute(
                    builder: (BuildContext context) =>
                    new ResumeOrderScreen(order: data,)));
          }
        });
      });
    });

  }


}