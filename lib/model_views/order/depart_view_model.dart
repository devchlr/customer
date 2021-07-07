// import 'package:client_chaliar/ui/views/commande/formulaire/arrive_form_screen.dart';
// import 'package:client_chaliar/ui/views/commande/formulaire/taille_colli_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/constants/type_livraison.dart';
import 'package:chaliar_delivery_app/model_views/base_model.dart';
import 'package:chaliar_delivery_app/models/commande.dart';
import 'package:chaliar_delivery_app/ui/views/orders/form/arrive_order_form.dart';
import 'package:chaliar_delivery_app/ui/widgets/custom_showSnackBar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DepartFormViewModel extends BaseModel{
  TextEditingController departure_address=TextEditingController();
  DateRangePickerController delivery_date=DateRangePickerController();
  TextEditingController delivery_schedule=TextEditingController();
  TextEditingController delivery_firt_name=TextEditingController();
  TextEditingController delivery_email=TextEditingController();
  TextEditingController delivery_group=TextEditingController();
  TextEditingController delivery_name=TextEditingController();
  TextEditingController phone_number=TextEditingController();
  TextEditingController delivery_type=TextEditingController();
  CustomShowSnackBar customShowSnackBar=CustomShowSnackBar();
  String? group=TypeLivraison.express;

  bool validatorForm(){
    if(departure_address.text.isEmpty){
      return false;
    }
    if(delivery_schedule.text.isEmpty){
      return false;
    }
    if(delivery_firt_name.text.isEmpty){
      return false;
    }
    if(delivery_email.text.isEmpty){
      return false;
    }

    if(phone_number.text.isEmpty){
      return false;
    }
    if(delivery_name.text.isEmpty){
      return false;
    }
    return true;
  }

  void selectTypeLivraison(String value){
    group=value;
    notifyListeners();
  }

  void formEditingController(BuildContext context){
    // customShowSnackBar.initUserRequestAnimation(context);
    // if(validatorForm()){
    //   OrderDeliveryInformation deliveryInformation = new OrderDeliveryInformation(
    //       delivery_schedule: delivery_schedule.text,
    //       departure_address: departure_address.text,
    //       delivery_date: delivery_date.selectedDate,
    //       delivery_firt_name: delivery_firt_name.text,
    //       delivery_group: delivery_group.text,
    //       delivery_email: delivery_email.text,
    //       delivery_name: delivery_name.text,
    //       delivery_type: delivery_type.text,
    //       phone_number: phone_number.text
    //   );
    //   print(deliveryInformation.toJson());
    //   Navigator.push(context,
    //       new MaterialPageRoute(
    //           builder: (BuildContext context) =>
    //           new ArriveeFormScreen(deliveryInformation:deliveryInformation)));
    // }else{
    //   customShowSnackBar.initUserRequestAnimationError(context, 'Tous les champs doivent etres renseignes');
    //  print('form falidator fails');
    // }
  }
}