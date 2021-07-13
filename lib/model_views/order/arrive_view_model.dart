import 'package:chaliar_delivery_app/ui/views/orders/form/package_information_screen.dart';
import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/model_views/base_model.dart';
import 'package:chaliar_delivery_app/models/adress.dart';
import 'package:chaliar_delivery_app/models/commande.dart';
import 'package:chaliar_delivery_app/services/form_validator/depart_form_service.dart';
import 'package:chaliar_delivery_app/services/google_place/place_service.dart';
import 'package:chaliar_delivery_app/ui/views/orders/form/package_information_screen.dart';
import 'package:chaliar_delivery_app/ui/widgets/custom_showSnackBar.dart';

class ArriveScreenViewModel extends BaseModel{
  TextEditingController arrival_address =TextEditingController();
  TextEditingController recipient_phone_number=TextEditingController();
  TextEditingController firt_name_recipient=TextEditingController();
  TextEditingController name_recipient=TextEditingController();
  TextEditingController recipient_email=TextEditingController();
  TextEditingController recipient_group=TextEditingController();
  TextEditingController recipient_note=TextEditingController();
  OrderDeliveryInformation? orderDeliveryInformation;
  CustomShowSnackBar customShowSnackBar =CustomShowSnackBar();
  GooglePlaceService googlePlaceService=GooglePlaceService();
  DepartFormService departFormService=DepartFormService();

  bool vEmailR=false;
  emailR(){
    vEmailR=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(recipient_email.text)?false:true;
    notifyListeners();
  }

  bool vNoteR=false;
  noteR(){
    vNoteR=(recipient_note.text==''||recipient_note.text.length<2);
    notifyListeners();
  }

  bool vGroupR=false;
  groupR(){
    vGroupR=(recipient_group.text==''||recipient_group.text.length<2);
    notifyListeners();
  }

  bool vPhoneR=false;
  phoneR(){
    vPhoneR=RegExp(r'^(?:[+0]9)?[0-9]{9,}$').hasMatch(recipient_phone_number.text)?false:true;;
    notifyListeners();
  }

  bool vNameR=false;
  nameR(){
    vNameR=(name_recipient.text==''||name_recipient.text.length<2);
    notifyListeners();
  }

  Future getPlaceSugestion(String value)async{
    var result= await googlePlaceService.getPlaceSugestion(value);
    return result;
  }
  bool vArrivalAdress=false;
 arrivaAdressV(){
    vArrivalAdress= (arrival_address.text.isEmpty||arrival_address.text.length<2);
    notifyListeners();
  }

  bool vfirstNameR=false;
  firstNameR(){
    print(firt_name_recipient.text);
    vfirstNameR=(firt_name_recipient.text==''||firt_name_recipient.text.length<2);
    notifyListeners();
  }

  bool validatorForm(BuildContext context){
    arrivaAdressV();
    if(vArrivalAdress){
      customShowSnackBar.showDialogError(context: context,titleDialog: 'Erreur formulaire',
          errorDescription: 'le champ Adresse est mal renseigne',
          errorSolution: 'le champ adress comporte une chaine de carracteres d\'un minimum de 02 carractes');
      return false;
    }
    firstNameR();
    if(vfirstNameR){
      customShowSnackBar.showDialogError(context: context,titleDialog: 'Erreur formulaire',
          errorDescription: 'le champ Prenom est mal renseigne',
          errorSolution: 'le champ Prenom comporte une chaine de carracteres d\'un minimum de 02 carractes');
      return false;
    }
    nameR();
    if(vNameR){
      customShowSnackBar.showDialogError(context: context,titleDialog: 'Erreur formulaire',
          errorDescription: 'le champ Nom est mal renseigne',
          errorSolution: 'le champ Nom comporte une chaine de carracteres d\'un minimum de 02 carractes');
      return false;
    }
    phoneR();
    if(vPhoneR){
      customShowSnackBar.showDialogError(context: context,
          titleDialog: 'Erreur Formulaire',
          errorDescription: 'Le champs telephone est mal renseigner',
          errorSolution: 'le champ telephone comporte une chaine de carracteres d\'un minimum de 09 carractes et n\'est constituer que des symbole [0-9]'
      );
      return false;
    }
    emailR();
    if(vEmailR){
      customShowSnackBar.showDialogError(context: context,
          titleDialog: 'Erreur Formulaire',
          errorDescription: 'Le champs email est mal renseigner',
          errorSolution: 'le champ email comporte une chaine de carracteres au format (example@domain.com))'
      );
      return false;
    }
    groupR();
    if(vGroupR){
      customShowSnackBar.showDialogError(context: context,titleDialog: 'Erreur formulaire',
          errorDescription: 'le champ Societe a livrer est mal renseigne',
          errorSolution: 'le champ Societe a livrer comporte une chaine de carracteres d\'un minimum de 02 carractes');
      return false;
    }
    noteR();
    if(vNoteR){
      customShowSnackBar.showDialogError(context: context,titleDialog: 'Erreur formulaire',
          errorDescription: 'le champ Note personnelles est mal renseigne',
          errorSolution: 'le champ Note personnelles comporte une chaine de carracteres d\'un minimum de 02 carractes');
      return false;
    }
    return true;
  }

var adresseObject;
  getLocalisation(String place)async{
    var localisation= await googlePlaceService.getLocalisation(place);
    adresseObject=new AdressLocalisation(
      description: arrival_address.text,
      lat: localisation.first.coordinates.latitude,
      long: localisation.first.coordinates.longitude,
    );
  }

  double getDistance(OrderRecipientInformation recipient,OrderDeliveryInformation departure){
    var depart=departure.departure_address;
    var arrival=recipient.arrival_address;
    var kmDistance = googlePlaceService.getDistance(depart!, arrival!);
    return kmDistance;
  }
  formEditingController(BuildContext context){
    // customShowSnackBar.initUserRequestAnimation(context);
  if(validatorForm(context)){
    getLocalisation(arrival_address.text);
    OrderRecipientInformation recipientInformation = OrderRecipientInformation(
        arrival_address: adresseObject,
        recipient_phone_number: recipient_phone_number.text,
        firt_name_recipient: firt_name_recipient.text,
        name_recipient: name_recipient.text,
        recipient_email: recipient_email.text,
        recipient_note: recipient_note.text,
        recipient_group: recipient_group.text
    );
    var km_distance=getDistance(recipientInformation, orderDeliveryInformation!);

    Navigator.push(context,
        new MaterialPageRoute(
            builder: (BuildContext context) =>
            new TailleColisScreen(deliveryInformation:orderDeliveryInformation,recipientInformation:recipientInformation,km_distance: km_distance,)));
    }
  }
}