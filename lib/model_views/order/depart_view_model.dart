// import 'package:client_chaliar/ui/views/commande/formulaire/arrive_form_screen.dart';
// import 'package:client_chaliar/ui/views/commande/formulaire/taille_colli_screen.dart';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/constants/type_livraison.dart';
import 'package:chaliar_delivery_app/model_views/base_model.dart';
import 'package:chaliar_delivery_app/models/adress.dart';
import 'package:chaliar_delivery_app/models/commande.dart';
import 'package:chaliar_delivery_app/services/auth_service/register_service.dart';
import 'package:chaliar_delivery_app/services/database/api.dart';
import 'package:chaliar_delivery_app/services/database/order_store_service.dart';
import 'package:chaliar_delivery_app/services/form_validator/depart_form_service.dart';
import 'package:chaliar_delivery_app/services/google_place/place_service.dart';
import 'package:chaliar_delivery_app/ui/views/orders/form/arrive_order_form.dart';
import 'package:chaliar_delivery_app/ui/widgets/custom_showSnackBar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:google_place/google_place.dart';

class DepartFormViewModel extends BaseModel{
  GooglePlaceService googlePlaceService=GooglePlaceService();
  TextEditingController departure_address=TextEditingController();
  DateRangePickerController delivery_date=DateRangePickerController();
  DateRangePickerController delivery_schedule=DateRangePickerController();
  TextEditingController delivery_firt_name=TextEditingController();
  TextEditingController delivery_email=TextEditingController();
  TextEditingController delivery_group=TextEditingController();
  TextEditingController delivery_name=TextEditingController();
  TextEditingController phone_number=TextEditingController();
  TextEditingController delivery_type=TextEditingController();
  CustomShowSnackBar customShowSnackBar=CustomShowSnackBar();
  RegisterService departFormService=RegisterService();
  OrderStoreService orderStoreService=OrderStoreService();
  DataBaseApi dataBaseApi=DataBaseApi('orders');
  String lsHour = TimeOfDay.now().hour.toString().padLeft(2, '0');
  String lsMinute = TimeOfDay.now().minute.toString().padLeft(2, '0');
  var adresseObject;


  String? group=TypeLivraison.express;
  bool emailIsValid=false;
  isEmailValid(){
    print('okLink');
    emailIsValid=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(delivery_email.text)?false:true;
    notifyListeners();
    print(emailIsValid);
  }
  bool nameIsValid=false;
  isNameValid(){
    print('ok ici');
    nameIsValid=(delivery_name.text == null || delivery_name.text.isEmpty||delivery_name.text.length<2);
    notifyListeners();
  }

  bool surnameIsValid=false;
  isSurnameValid(){
    print('ok ici');
    surnameIsValid=(delivery_firt_name.text == null || delivery_firt_name.text.isEmpty||delivery_firt_name.text.length<2);
    notifyListeners();
  }
  var myDate;
  changeTime(){
   lsMinute=myDate.minute.toString();
   lsHour=myDate.hour.toString();
   print('heure $lsHour');
   notifyListeners();
  }

  bool isTimeValidate=false;
  pickTime(){
    if(group==TypeLivraison.express){
      var timeToCompare=TimeOfDay.fromDateTime(new DateTime.now());
      int selectTime= timeOfDayToInt(myDate);
      int curentTime= timeOfDayToInt(timeToCompare);
      print('select date : $selectTime');
      print('current time $curentTime');
      if(curentTime>selectTime){
        isTimeValidate=true;
        notifyListeners();
        print(isTimeValidate);
      }else{
        isTimeValidate=false;
      }
    }
  }

int timeOfDayToInt(TimeOfDay time){
  return time.hour.toInt() + time.minute.toInt();
}

  bool phoneIsValid=false;
  isPhoneValid(){
    print('ok ici');
    RegExp(r'^(?:[+0]9)?[0-9]{10}').hasMatch(phone_number.text);
    phoneIsValid=RegExp(r'^(?:[+0]9)?[0-9]{9,}$').hasMatch(phone_number.text)?false:true;
    notifyListeners();
  }
  bool adressValid=false;
  isAdressValid(){
    print('ok ici');
    adressValid=(departure_address.text == null || departure_address.text.isEmpty||departure_address.text.length<2);
    notifyListeners();
  }

  bool isDateValid=false;
  dateValide(){
    if(group==TypeLivraison.programme){
      var now = new DateTime.now();
      var dateOrder = delivery_date.selectedDate;
      isDateValid=dateOrder!.compareTo(now)<0?true:false;
      notifyListeners();
    }
  }

  Future getPlaceSugestion(String value)async{
    List<String> predictionsDescription=[];
    var result= await googlePlaceService.getPlaceSugestion(value);
    result.forEach((element) async{
      predictionsDescription.add(element);
    });
    return predictionsDescription;
  }

  getLocalisation(String place)async{
    var localisation=await  googlePlaceService.getLocalisation(place);
    adresseObject=new AdressLocalisation(
      description: departure_address.text,
      lat:  localisation.first.coordinates.latitude,
      long: localisation.first.coordinates.longitude,
    );
  }

  void selectTypeLivraison(String value){
    group=value;
    notifyListeners();
  }

  bool validator(BuildContext context){
    isAdressValid();
    if(adressValid){
      customShowSnackBar.showDialogError(context: context,titleDialog: 'Erreur formulaire',
          errorDescription: 'le champ Adresse est mal renseigne',
          errorSolution: 'le champ adress admet une chaine de carracteres d\'un minimum de 02 carractes');
      return false;
    }
    isSurnameValid();
    if(surnameIsValid){
      customShowSnackBar.showDialogError(context: context,
      titleDialog: 'Erreur Formulaire',
        errorDescription: 'Le champs prenom est mal renseigner',
        errorSolution: 'le champ prenom admet une chaine de carracteres d\'un minimum de 02 carractes'
      );
      return false;
    }
    isNameValid();
    if(nameIsValid){
      customShowSnackBar.showDialogError(context: context,
          titleDialog: 'Erreur Formulaire',
          errorDescription: 'Le champs nom est mal renseigner',
          errorSolution: 'le champ nom admet une chaine de carracteres d\'un minimum de 02 carractes'
      );
      return false;
    }

    isPhoneValid();
    if(phoneIsValid){
      customShowSnackBar.showDialogError(context: context,
          titleDialog: 'Erreur Formulaire',
          errorDescription: 'Le champs telephone est mal renseigner',
          errorSolution: 'le champ telephone admet une chaine de carracteres d\'un minimum de 09 carractes et n\'est constituer que des symbole [0-9]'
      );
      return false;
    }
    isEmailValid();
    if(emailIsValid){
      customShowSnackBar.showDialogError(context: context,
          titleDialog: 'Erreur Formulaire',
          errorDescription: 'Le champs email est mal renseigner',
          errorSolution: 'le champ email admet une chaine de carracteres au format (example@domain.com))'
      );
      return false;
    }
    if(group==TypeLivraison.programme){
      dateValide();
      if(isDateValid){
        customShowSnackBar.showDialogError(context: context,
            titleDialog: 'Erreur Formulaire',
            errorDescription: 'La date de livraison  est mal renseigner',
            errorSolution: 'la date de livraison doit etre superieure a la date du jour'
        );
        return false;
      }
    }
    if(group==TypeLivraison.express){
      pickTime();
      if(isTimeValidate){
        customShowSnackBar.showDialogError(context: context,
            titleDialog: 'Erreur Formulaire',
            errorDescription: 'L\'horaire de livraison  est mal renseigner',
            errorSolution: 'L\'horaire de livraison doit etre superieure a l\'horaire actuel'
        );
        return false;
      }
    }
    return true;
  }


  void formEditingController(BuildContext context)async{
    // customShowSnackBar.showDialogError(context:context);
    if(validator(context)){
      getLocalisation(departure_address.text);
      OrderDeliveryInformation deliveryInformation = new OrderDeliveryInformation(
          delivery_schedule: delivery_schedule.selectedDate,
          departure_address: adresseObject,
          delivery_date: group==TypeLivraison.express?new DateTime.now():delivery_date.selectedDate,
          delivery_firt_name: delivery_firt_name.text,
          delivery_group: delivery_group.text,
          delivery_email: delivery_email.text,
          delivery_name: delivery_name.text,
          delivery_type: delivery_type.text,
          phone_number: phone_number.text
      );
      print(deliveryInformation.toJson());
      Navigator.push(context,
          new MaterialPageRoute(
              builder: (BuildContext context) =>
              new ArriveeFormScreen(deliveryInformation:deliveryInformation)));
    }
  }
}