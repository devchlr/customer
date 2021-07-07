import 'package:firebase_auth/firebase_auth.dart';
import 'package:chaliar_delivery_app/model_views/base_model.dart';
import 'package:chaliar_delivery_app/models/user.dart';
import 'package:chaliar_delivery_app/services/fire_store_service.dart';

class ConditionnalTermViewModel extends BaseModel{
  UserChaliar? currentUser;
  final _auth = FirebaseAuth.instance;
  FirestoreService _storeService = FirestoreService();
  //function to show password
  Future<bool> isSingInUser()async{
    bool result=false;
    var user = await FirebaseAuth.instance.currentUser;
    print(user);
    if(result != null){
      result= true;
    }
    return result;
  }

  //function qui retourne les information du users;
  Future<dynamic> getUserData(String number)async{
    var userResult;
    if(number!=null) userResult = await _storeService.getUser(number);
    userResult= await _storeService.getUser(number);
    print(userResult);
    return userResult;
  }


}