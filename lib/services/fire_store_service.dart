import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chaliar_delivery_app/models/user.dart';

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

  DocumentSnapshot<UserChaliar>? streamUser(String id) {
    _usersCollectionReference
        .doc(id)
        .get().then((value) => value.data());
  }

  Future getUser(String uid) async {
      return await _usersCollectionReference.doc(uid).get();

  }

  Future setUser(String id, dynamic user)async{
    await _usersCollectionReference.doc(id).update(user).then((value){
      print('update is ok ');
    });
  }


   getUserFuture(String uid){
    return  _usersCollectionReference.doc(uid).get();
  }

  getUserFutureD(String uid){
    return  _usersCollectionReference.doc(uid).get();
  }

  Future getUserByFieldValue(String field,String value)async{
    var doc =await _usersCollectionReference
        .where(field,isEqualTo: value)
        .limit(1)
        .get();
    if(doc==null){
      return null;
    }else{
      if(doc.size==0){
        return null;
      }else{
        return doc.docs.first.data();
      }
    }
  }


  Future getUserByField(String field,String value)async{
    var doc =await _usersCollectionReference
        .where(field,isEqualTo: value)
        .limit(1)
        .get();
    if(doc==null){
      return doc;
    }else{
      if(doc.size==0){
        return doc;
      }else{
        return doc;
      }
    }

  }
}


