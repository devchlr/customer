


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:chaliar_delivery_app/model_views/base_model.dart';
import 'package:chaliar_delivery_app/models/message.dart';
import 'package:chaliar_delivery_app/models/user.dart';
import 'package:chaliar_delivery_app/services/database/api.dart';
import 'package:chaliar_delivery_app/services/fire_store_service.dart';

class HomeMessageMV extends BaseModel{
  DataBaseApi messageDataBase=DataBaseApi('messages');
  FirebaseAuth auth=FirebaseAuth.instance;
  FirestoreService firestoreService=FirestoreService();
  TextEditingController messageText=TextEditingController();

  Stream<DocumentSnapshot> getOrderMessage(String orderId){
    print(orderId);
    var messageDocument=messageDataBase.streamDataCollectionById(orderId);
    return messageDocument;
  }
  getUserD(){
    var user = auth.currentUser;
    print(user!.uid);
    return firestoreService.getUserFuture(user.uid);
  }

  getSenderInfo(String userId){
    return firestoreService.getUserFuture(userId);
  }

  sendMessage(UserChaliar user,String orderId)async{
    String smsText=messageText.text;
    if(smsText.length>1){
      var message=Message(idUser: user.id, urlAvatar: user.profile_url, username: user.surname, message:smsText, createdAt: DateTime.now());
      await messageDataBase.addDocumentField(orderId, message);
      messageText.text='';
    }
  }



}