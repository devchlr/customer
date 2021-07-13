
import 'package:cloud_firestore/cloud_firestore.dart';

class UserChaliar {
     String? id;
  final String? name;
  final String? surname;
  final String? email;
  final String? userRole;
  final String? phone;
  final String? street;
  final String? facturationAdresse;
  final String? codePostal;
  final String? city;
  final String? siret;
  final String? societe;
  final String? password;
  final String? profile_url;

  UserChaliar(
      {this.id,
        this.name,
        this.email,
        this.userRole,
        this.surname,
        this.phone,
        this.siret,
        this.facturationAdresse,
        this.codePostal,
        this.city,
        this.street,
        this.societe,
        this.password,
        this.profile_url,
      });

  void setUserId(String id){
    this.id=id;
  }

  UserChaliar.fromData(Map<String, dynamic> data):
        id = data['id'],
        name = data['name'],
        surname = data['surname'],
        email = data['email'],
        phone = data['phone'],
        street = data['street'],
        facturationAdresse =data['facturation_adresse'],
     codePostal = data['code_postal'],
        city = data['city'],
        siret=data['siret'],
        societe=data['societe'],
        password=data['password'],
        profile_url=data['profile_url'],
        userRole = data['userRole'];



   factory  UserChaliar.fromDocument(DocumentSnapshot data){
       return UserChaliar(
           id : data['id'],
           name : data['name'],
           surname : data['surname'],
           email : data['email'],
           phone : data['phone'],
           street :data['street'],
           facturationAdresse :data['facturation_adresse'],
           codePostal : data['code_postal'],
           city : data['city'],
           siret:data['siret'],
           societe:data['societe'],
           password:data['password'],
           userRole : data['userRole'],
         profile_url: data['profile_url']
       );
     }


     factory  UserChaliar.fromMap(Map data){
       return UserChaliar(
           id : data['id'],
           name : data['name'],
           surname : data['surname'],
           email : data['email'],
           phone : data['phone'],
           street :data['street'],
           facturationAdresse :data['facturation_adresse'],
           codePostal : data['code_postal'],
           city : data['city'],
           siret:data['siret'],
           societe:data['societe'],
           password:data['password'],
           userRole : data['userRole'],
         profile_url: data['profile_url'],
       );
     }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'email': email,
      'userRole': userRole,
      'phone': phone,
      'street': street,
      'facturation_adresse': facturationAdresse,
      'code_postal': codePostal,
      'city': city,
      'siret':siret,
      'societe':societe,
      'password':password,
      'profile_url':profile_url
    };
  }
}