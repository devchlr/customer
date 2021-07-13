

import 'package:chaliar_delivery_app/model_views/base_model.dart';
import 'package:chaliar_delivery_app/services/database/api.dart';
import 'package:chaliar_delivery_app/ui/views/orders/order_recapt.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class OrderValidateVM extends BaseModel{
  DataBaseApi orderDatabase=DataBaseApi('orders');


  Future<DocumentSnapshot> getOrderInformation(String orderId)async{
    return orderDatabase.getDocumentById(orderId);
  }

  getRecaptOrder(BuildContext context,String orderId){
    Navigator.push(context,
        new MaterialPageRoute(
            builder: (BuildContext context) =>
            new OrderRecaptScreen(orderId:orderId)));
  }


}