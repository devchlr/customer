import 'package:chaliar_delivery_app/model_views/base_model.dart';
import 'package:chaliar_delivery_app/model_views/base_model.dart';
import 'package:chaliar_delivery_app/services/database/api.dart';
import 'package:chaliar_delivery_app/ui/views/orders/order_live_tracking_screen.dart';
import 'package:chaliar_delivery_app/ui/views/orders/order_recapt.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class OrderRecaptVM extends BaseModel{
  DataBaseApi orderDatabase=DataBaseApi('orders');
FirebaseAuth auth=FirebaseAuth.instance;
  Future<DocumentSnapshot> getOrderInformation(String orderId)async{
    return orderDatabase.getDocumentById(orderId);
  }

  updateUser(String id,String userId)async{
    await orderDatabase.setUser(id, {
      'is_validate':true,
      'delivery_id':userId,
    });
  }

  cancelOrder(BuildContext context, String orderId)async{
    var user=auth.currentUser;
    await updateUser(orderId, user!.uid);
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/order_tracking', (Route<dynamic> route) => false);

  }

  getLiveTrackingOrder(BuildContext context,String orderId){
    Navigator.push(context,
        new MaterialPageRoute(
            builder: (BuildContext context) =>
            new OrderLiveTrackingScreen(orderId:orderId)));
    // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
    //     OrderLiveTrackingScreen(orderId:orderId)), (Route<dynamic> route) => false);
  }

}