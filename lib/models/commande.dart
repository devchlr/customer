import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/models/adress.dart';
import 'package:chaliar_delivery_app/services/parsers/transformer.dart';

//command Object class
class Order{
  final String?orderId;
  final bool? isValidate;
  final double? order_price;
  final String? order_status;
  final double? order_km;
  final String? user_id;
  final String? delivery_id;
  final Map<String,dynamic>? deliveryInformation;
  final Map<String,dynamic>? recipientInformation;
  final Map<String,dynamic>? packageInformation;

  Order(
      {
        this.orderId,
        this.isValidate,
        this.order_price,
        this.order_status,
        this.order_km,
        this.user_id,
        this.delivery_id,
        this.deliveryInformation,
        this.recipientInformation,
        this.packageInformation});
  Order.fromJson(Map<String,dynamic>json):
        orderId=json['order_id'],
        isValidate=json['is_validate'],
        order_price=json['order_price'],
        order_status=json['order_status'],
        order_km=json['order_km'],
        user_id=json['user_id'],
        delivery_id=json['delivery_id'],
        deliveryInformation=json['deliveryInformation'],
        recipientInformation=json['recipientInformation'],
        packageInformation=json['packageInformation'];

  Map<String,dynamic>toJson()=>{
    'order_id':orderId,
    'is_validate':isValidate,
    'order_price':order_price,
    'order_status':order_status,
    'order_km':order_km,
    'user_id':user_id,
    'delivery_id':delivery_id,
    'deliveryInformation':deliveryInformation,
    'recipientInformation':recipientInformation,
    'packageInformation':packageInformation
  };
}


//delivery Order information command
class OrderDeliveryInformation{
  final AdressLocalisation? departure_address;
  final DateTime? delivery_date;
  final DateTime? delivery_schedule;
  final String? delivery_firt_name;
  final String? phone_number;
  final String? delivery_email;
  final String? delivery_group;
  final String? delivery_name;
  final String? delivery_type;


  OrderDeliveryInformation(
      {
        @required this.departure_address,
        @required this.delivery_date,
        @required this.delivery_schedule,
        @required  this.delivery_firt_name,
        @required   this.delivery_email,
        this.delivery_group,
        @required  this.delivery_name,
        @required this.phone_number,
        @required this.delivery_type
      }
      );


  OrderDeliveryInformation.fromJson(Map<String, dynamic> json)
      :  departure_address=AdressLocalisation.fromJson(json['departure_address']),
        delivery_date=Utils.toDateTime(json['delivery_date']),
        delivery_schedule=Utils.toDateTime(json['delivery_schedule']),
        delivery_firt_name=json['delivery_firt_name'],
        delivery_email=json['delivery_email'],
        delivery_group=json['delivery_group'],
        phone_number=json['phone_number'],
        delivery_type=json['delivery_type'],
        delivery_name=json['delivery_name'];



  Map<String, dynamic> toJson() =>{
    'departure_address':departure_address!.toJson(),
    'delivery_date':Utils.fromDateTimeToJson(delivery_date!),
    'delivery_schedule':Utils.fromDateTimeToJson(delivery_schedule!),
    'delivery_firt_name':delivery_firt_name,
    'delivery_email':delivery_email,
    'delivery_group':delivery_group,
    'delivery_name': delivery_name,
    'phone_number':phone_number,
    'delivery_type':delivery_type,
  };
}


//recipient Order information command
class OrderRecipientInformation{
  final AdressLocalisation? arrival_address;
  final String? recipient_phone_number;
  final String? firt_name_recipient;
  final String? name_recipient;
  final String? recipient_email;
  final String? recipient_group;
  final String? recipient_note;

  OrderRecipientInformation(
      {
        @required this.arrival_address,
        @required this.recipient_phone_number,
        @required this.firt_name_recipient,
        @required  this.name_recipient,
        @required this.recipient_email,
        this.recipient_group,
        @required this.recipient_note,
      });
  OrderRecipientInformation.fromJson(Map<String, dynamic> json)
      :  arrival_address=AdressLocalisation.fromJson(json['arrival_address']),
        recipient_phone_number=json['recipient_phone_number'],
        firt_name_recipient=json['firt_name_recipient'],
        name_recipient=json['name_recipient'],
        recipient_email=json['recipient_email'],
        recipient_group=json['recipient_group'],
        recipient_note=json['recipient_note'];


  Map<String, dynamic> toJson() =>{
    'arrival_address':arrival_address!.toJson(),
    'recipient_phone_number':recipient_phone_number,
    'firt_name_recipient':firt_name_recipient,
    'name_recipient':name_recipient,
    'recipient_email':recipient_email,
    'recipient_group':recipient_group,
    'recipient_note':recipient_note
  };
}
//package Order nature
class OrderPackageInformation{
  final String? package_nature;
  final String? package_size;
  final String? package_image;
  OrderPackageInformation({
    this.package_nature,
    this.package_size,
    this.package_image,
  });
  OrderPackageInformation.fromJson(Map<String, dynamic>json):
        package_nature=json['package_nature'],
        package_size=json['package_size'],
        package_image=json['package_image'];
  Map<String,dynamic>toJson()=>{
    'package_nature':package_nature,
    'package_size':package_size,
    'package_image':package_image,
  };
}