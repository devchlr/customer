import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/user.dart';
class FirestoreService {
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection("users");

  Future createUser(UserChaliar user) async {
    try {
      await _usersCollectionReference.doc(user.id).set(user.toJson());
    } catch (e) {
      return e.toString();
    }
  }

  Future getUser(String uid) async {
      DocumentSnapshot doc = await _usersCollectionReference.doc(uid).get();
      if(doc.exists) {
        print(doc.data());
       return doc.data();
      }else{
        return null;
      }
  }
  Future getUserByPhoneNumber(String email)async{
    var doc =await _usersCollectionReference
        .where('phone',isEqualTo: email)
        .limit(1)
        .get();
    if(doc==null){
      return null;
    }else{
      return doc.docs.first.data();
    }
  }
}


