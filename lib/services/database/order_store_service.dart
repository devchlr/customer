import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chaliar_delivery_app/models/commande.dart';
class OrderStoreService {

  final _collectionReference = FirebaseFirestore.instance
      .collection('orders').withConverter<Order>(
      fromFirestore:(snapshot,_)=>Order.fromJson(snapshot.data()!),
      toFirestore: (order,_)=>order.toJson()
  );


  Future getOrder(String id)async{
  Order order= await _collectionReference.doc(id).get().then((snapshot){
    return snapshot.data()!;
  });
  }

  Future<void> getUserOrder(String user_id)async{
    Order order = await _collectionReference
        .where('user_id', isEqualTo: user_id)
        .get()
        .then((snapshot) => snapshot.docs.first.data());
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
    List<QueryDocumentSnapshot<Order>> orders = await _collectionReference
        .where('delivery_id', isEqualTo: delivery_id)
        .get()
        .then((snapshot) => snapshot.docs);
  }

  Future<void> getOrderByFieldValue(String field, String value)async{
    List<QueryDocumentSnapshot<Order>> orders = await _collectionReference
        .where(field, isEqualTo: value)
        .get()
        .then((snapshot) => snapshot.docs);
  }

  Future getAllOrders()async{
    List<QueryDocumentSnapshot<Order>> orders = await _collectionReference
        .get()
        .then((snapshot){
          return  snapshot.docs;
        });
  }
}