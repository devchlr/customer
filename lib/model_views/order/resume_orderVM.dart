
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chaliar_delivery_app/model_views/base_model.dart';
import 'package:chaliar_delivery_app/services/database/api.dart';
import 'package:chaliar_delivery_app/services/google_place/place_service.dart';
import 'package:chaliar_delivery_app/services/preferences/shared_preference_service.dart';

class ResumeOrderVM extends BaseModel{
  DataBaseApi orderDatabase=DataBaseApi('orders');
  SharedPreferenceService sharedPreferenceService=SharedPreferenceService();
  GooglePlaceService placeService=GooglePlaceService();

  // getPlaceLocation(String adress){
  //   print(adress);
  //   var placeLocation=placeService.getPlaceLatLong(adress);
  //   placeLocation.then((value){
  //   });
  // }


  Future<DocumentSnapshot> getOrderInformation()async{
    var orderId= await sharedPreferenceService.getOrderId();
    return orderDatabase.getDocumentById(orderId!);
  }

}