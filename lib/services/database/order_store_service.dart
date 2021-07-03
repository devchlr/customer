import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/commande.dart';
class OrderStoreService {

  final _collectionReference = FirebaseFirestore.instance
      .collection('order').withConverter<Order>(
      fromFirestore:(snapshot,_)=>Order.fromJson(snapshot.data()!),
      toFirestore: (order,_)=>order.toJson()
  );


  Future<void> getOrder(String id)async{
  Order order= await _collectionReference.doc(id).get().then((snapshot) => snapshot.data()!);
  }

  Future<void> getUserOrder(String user_id)async{
    List<QueryDocumentSnapshot<Order>> movies = await _collectionReference
        .where('user_id', isEqualTo: user_id)
        .get()
        .then((snapshot) => snapshot.docs);
  }
  Future<void> addOrder(Order order)async{
    await _collectionReference.add(
      order,
    );
  }

  Future<void> updateOrder(String id,Order order)async{
    await _collectionReference.doc(id).set(order);
  }

  Future<void> getDeliverOrder(String delivery_id)async{
    List<QueryDocumentSnapshot<Order>> movies = await _collectionReference
        .where('delivery_id', isEqualTo: delivery_id)
        .get()
        .then((snapshot) => snapshot.docs);
  }

  Future<void> getOrderByFieldValue(String field, String value)async{
    List<QueryDocumentSnapshot<Order>> movies = await _collectionReference
        .where(field, isEqualTo: value)
        .get()
        .then((snapshot) => snapshot.docs);
  }
}