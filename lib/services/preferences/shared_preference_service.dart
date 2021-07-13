import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class SharedPreferenceService{
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  SharedPreferenceService();

   Future<bool> setStartPreferencePage(routeName)async{
     SharedPreferences prefs = await _prefs;
    prefs.setString("prefrent_start_page", routeName);
    return prefs.commit();
   }

  Future<bool> setNewOrder(orderId)async{
    SharedPreferences prefs = await _prefs;
    prefs.setString("orderId", orderId);
    return prefs.commit();
  }

  Future<String?> getOrderId()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? orderId= prefs.getString("orderId")??null;
    return orderId;
  }

    Future<String?> getRegisterPreferencePage()async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? routeNamed= prefs.getString("register_form_page")??null;
      return routeNamed;
    }

  Future<String?> getPreferenceByFieldName(field)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? routeNamed= prefs.getString(field)??null;
    return routeNamed;
  }

   Future<bool> setRegisterPreferencePage(routeName)async{
     SharedPreferences prefs = await _prefs;
     prefs.setString("register_form_page", routeName);
     return prefs.commit();
   }

  Future<bool> setRegisterPreferenceInformation(String email, String phone)async{
    SharedPreferences prefs = await _prefs;
    prefs.setString("register_email", email);
    prefs.setString("register_phone", phone);
    return prefs.commit();
  }


   Future<String> getStartPreferencePage()async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
     String routeNamed= prefs.getString("prefrent_start_page")??'';
     return routeNamed;
   }

}