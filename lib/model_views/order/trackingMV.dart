
import 'dart:typed_data';

import 'package:chaliar_delivery_app/ui/views/orders/order_validate_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/model_views/base_model.dart';
import 'package:chaliar_delivery_app/models/adress.dart';
import 'package:chaliar_delivery_app/models/commande.dart';
import 'package:chaliar_delivery_app/services/database/api.dart';
import 'package:chaliar_delivery_app/services/preferences/shared_preference_service.dart';
import 'package:chaliar_delivery_app/ui/views/message/home_message.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'Dart:ui' as ui;

class OrderSelectedVM extends BaseModel{
  DataBaseApi orderDatabase=DataBaseApi('orders');
  FirebaseAuth auth=FirebaseAuth.instance;

  Future<QuerySnapshot> getAllOrder(){
    var ListOrderDocumentSnapshots = orderDatabase.getAllCollectionDocument();
    return ListOrderDocumentSnapshots;
  }

  updateUser(String id,String userId)async{
    await orderDatabase.setUser(id, {
      'is_validate':true,
      'delivery_id':userId,
    });
  }

  getAgendaPage(BuildContext context,String orderId)async{
    var user=auth.currentUser;
    await updateUser(orderId, user!.uid);
    Navigator.push(context,
        new MaterialPageRoute(
            builder: (BuildContext context) =>
            new OrderValidateScreen(orderId:orderId)));
  }

}





