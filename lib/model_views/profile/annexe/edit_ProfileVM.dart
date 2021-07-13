

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:chaliar_delivery_app/model_views/base_model.dart';
import 'package:chaliar_delivery_app/models/user.dart';
import 'package:chaliar_delivery_app/services/auth_service/register_service.dart';
import 'package:chaliar_delivery_app/services/fire_store_service.dart';
import 'package:chaliar_delivery_app/services/preferences/shared_preference_service.dart';
import 'package:chaliar_delivery_app/services/storage/image_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
class EditProfileScreenMV extends BaseModel{

  FirestoreService firestoreService = FirestoreService();
  FirebaseAuth auth= FirebaseAuth.instance;
  SharedPreferenceService sharedPreferenceService=SharedPreferenceService();
  UserChaliar? currentUser;
  TextEditingController emailC = TextEditingController();
  TextEditingController facturationAdress = TextEditingController();
  TextEditingController codePostal = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  RegisterService registerService=RegisterService();
  ImageStorageService imageStorageService =ImageStorageService();

  bool isLoading=false;
  String? vEmail;
  String? vPhone;
  String? vCodeP;
  String? vAdressF;
  String? vUrlImage;

  final _picker = ImagePicker();
  String? image;
  File? file;
  Future getImage()async{
    var user=auth.currentUser;
    final PickedFile? pickedFile = await _picker.getImage(source: ImageSource.gallery);
    file = File(pickedFile!.path);
    // print("${pickedFile.path}");
    image= pickedFile.path;
    var link=  imageStorageService.uploadImage(file!, '${user!.uid}');
    link.then((value) {
      vUrlImage=value.toString();
      notifyListeners();
      print(value.toString());
      var setImage= firestoreService.setUser(user.uid,{'profile_url': value.toString()});

    });
    notifyListeners();
  }

  initController({
    String? email,
    String? facturation_adress,
    String? code_postal,
    String? phone,
    String? urlImage,
  }){
    vEmail=email;
    vAdressF=facturation_adress;
    vCodeP=code_postal;
    vPhone=phone;
    // vUrlImage=urlImage!;
  }

  // valideUpdateUser()async{
  //    isLoading=false;
  //    vEmail=false;
  //    vPhone=false;
  //    vCodeP=false;
  //   vAdressF=false;
  //   if(emailC.text.length>0){
  //     if(registerService.validateEmail(emailC)){
  //       vEmail= true;
  //       notifyListeners();
  //     }
  //   }
  //   if(facturationAdress.text.length>0 ){
  //     if(facturationAdress.text.length<2){
  //       vAdressF= true;
  //       notifyListeners();
  //     }
  //   }
  //   if(codePostal.text.length>0){
  //     if(codePostal.text.length<2){
  //       vCodeP= true;
  //       notifyListeners();
  //     }
  //   }
  //   if(phoneNumber.text.length>0){
  //     if(phoneNumber.text.length<9){
  //       vPhone= true;
  //       notifyListeners();
  //     }
  //   }
  // }

  updateUser(String id)async{
    await firestoreService.setUser(id, {
      'phone':phoneNumber.text==''?vPhone:phoneNumber.text,
      'facturation_adresse':facturationAdress.text==''?vAdressF:facturationAdress.text,
      'email':emailC.text==''?vEmail:emailC.text,
      'code_postal':codePostal.text==''?vCodeP:codePostal.text,
    });
  }

  getUserD(){
    var user = auth.currentUser;
    return firestoreService.getUserFuture(user!.uid);
  }

  getUser()async{
    await sharedPreferenceService.getPreferenceByFieldName('register_email').then((id)async{
      await firestoreService.getUserByFieldValue('phone',id!).then((fireStoreResult){
        currentUser= new UserChaliar.fromData(fireStoreResult);
      });
    });
  }

}