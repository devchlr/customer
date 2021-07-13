
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chaliar_delivery_app/models/message.dart';
import 'package:uuid/uuid.dart';
class DataBaseApi{
  var uuid = Uuid();
  FirebaseFirestore _db=FirebaseFirestore.instance;
  final String? path;
  CollectionReference? ref;

  //constructor
  DataBaseApi(this.path){
    ref=_db.collection(path!);
  }

  //get all data collection
  Future getDataCollection() async{
    var doc = await ref!.get();
    if(doc==null){
      return null;
    }else{
      return doc.docs.first.data();
    }
  }

  //stream data collection
  Stream<QuerySnapshot> streamDataCollection(){
    return ref!.snapshots();
  }

  //stream data collection
  Stream<DocumentSnapshot> streamDataCollectionById(String id){
    return ref!.doc(id).snapshots();
  }

  Future setUser(String id, dynamic user)async{
    await ref!.doc(id).update(user).then((value){
      print('update is ok ');
    });
  }



  Future<QuerySnapshot>getAllCollectionDocument(){
    var ListDocument= ref!
        .where('order_status',isEqualTo: 'loading').where('is_validate',isEqualTo: false)
        .get();
    return ListDocument;
  }

  addDocumentField(String idDocument,Message message){
    var id = uuid.v1();
    ref!.doc(idDocument).set({
      id.toString():message.toJson()
    },SetOptions(merge: true)).then((value) {
      print('merge Sucessfull');
    }
    );
  }


  //get document by id
    Future<DocumentSnapshot> getDocumentById(String id){
    return  ref!.doc(id).get();
  }

  // getUserFuture(String uid){
  //   return  ref!.doc(uid).get();
  // }

  Future getDocumentByFieldValue(String field,String value) async{
    var doc = await ref!.where(field,isEqualTo: value).limit(1).get();
    if(doc==null){
      return null;
    }else{
      return doc.docs.first.data();
    }
  }

  //delete document
  Future<void> removeDocument(String id){
    return ref!.doc(id).delete();
  }

  //add new document
  Future<DocumentReference> addDocument(Map data) {
    return ref!.add(data).then((value){
      return value;
    });
  }

  //update data
  Future<void> setDocument(String id) {
    return ref!.doc(id).set({'text':'welcome'});
  }
}