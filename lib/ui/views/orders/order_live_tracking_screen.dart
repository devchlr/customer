import 'package:chaliar_delivery_app/model_views/order/order_live_trackingVM.dart';
import 'package:chaliar_delivery_app/models/commande.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:chaliar_delivery_app/constants/iconList.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_color.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_font.dart';
import 'package:chaliar_delivery_app/ui/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/ui/widgets/button.dart';
import 'package:chaliar_delivery_app/ui/widgets/custom_botom_navigation_bar.dart';
import 'package:chaliar_delivery_app/ui/widgets/custom_header.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

import 'package:provider/provider.dart';


class OrderLiveTrackingScreen extends StatefulWidget {
  String? orderId;
  FirebaseAuth _auth =FirebaseAuth.instance;
  OrderLiveTrackingScreen({this.orderId});
  @override
  _OrderLiveTrackingScreenState createState() => _OrderLiveTrackingScreenState();
}

class _OrderLiveTrackingScreenState extends State<OrderLiveTrackingScreen> {

  void initState() {
    super.initState();
  }
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? mapController;



  final LatLng _center = const LatLng(48.85341, 2.3488);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider<OrderLiveTrackingMV>(
          create: (context) => OrderLiveTrackingMV(),
          child: Consumer<OrderLiveTrackingMV>(
              builder: (context, model, child) =>
          FutureBuilder<DocumentSnapshot>(
          future: model.getOrderInformation(widget.orderId!),
    builder: (context, snapshot) {
    if (snapshot.connectionState != ConnectionState.done) {
          return Container(
          color: Colors.white,
          child: Center(
          child: CircularProgressIndicator(
          color: Colors.blue,),
          ),
          );
    }

    Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
    // print(data);
    var oderId=snapshot.data!.id;
    var order=Order.fromJson(data);
    model.orderInformation=order;
    var deliveryInformation=OrderDeliveryInformation.fromJson(order.deliveryInformation!);
    var packageInfornation=OrderPackageInformation.fromJson(order.packageInformation!);
    var recipientInformation=OrderRecipientInformation.fromJson(order.recipientInformation!);

    return

      Scaffold(
        backgroundColor: Color(0xffF3F3F3),
        body: Stack(
          children: [
            Container(
              height: 630,
              child:
              FutureBuilder(
                future: model.initMap(context),
                builder: (context,snap){
                  if(snap.connectionState!=ConnectionState.done){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return GoogleMap(
                    onMapCreated: _onMapCreated,
                    markers: Set<Marker>.of(model.markers.values),
                    polylines: Set<Polyline>.of(
                        model.polylines.values),
                    myLocationEnabled: true,
                    tiltGesturesEnabled: true,
                    compassEnabled: true,
                    scrollGesturesEnabled: true,
                    zoomGesturesEnabled: true,
                    initialCameraPosition: CameraPosition(
                      target: model.center,
                      zoom: 15.0,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.73,
              ),
              child:
              SingleChildScrollView(
                child: Card(
                  elevation: 1,
                  child: Container(
                    color: Color(0xffffffff),
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                    ),
                    margin: EdgeInsets.only(
                        left: 0,
                        right: 0
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 62,
                          padding: EdgeInsets.only(
                              left: 1,right: 1
                          ),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  onTap:(){},
                                  child: Icon(
                                    Icons.search_outlined,
                                    color: Color(0xffD3D3D3),
                                    size: 50,
                                  )
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    top: 5
                                ),
                                width: MediaQuery.of(context).size.width*0.68,
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                        color: Color(0xffd8d8d8),width: 2.0
                                    ),
                                    right: BorderSide(
                                        color: Color(0xffd8d8d8),width: 2.0
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width*0.18,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('12:09 PM',style: AppTextStyle.appBarHeader(
                                            color: Color(0xff000000),
                                            size: 22,
                                            fontWeight: FontWeight.bold
                                        ),),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '5 min',
                                              style: AppTextStyle.appBarHeader(
                                                  color: Color(0xffd8d8d8),
                                                  size: 12,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              height: 20,
                                              width: 40,
                                              padding: EdgeInsets.only(
                                                  top: 1,
                                                  bottom: 5
                                              ),
                                              decoration: BoxDecoration(
                                                  color: Color(0xff34B3E8),
                                                  border: Border.all(color: Color(0xff34B3E8),width: 1.0),
                                                  borderRadius: BorderRadius.circular(30)
                                              ),
                                              child:  Icon(Icons.arrow_drop_up_outlined,color: Colors.white,size: 16,),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              '1.7 min',
                                              style: AppTextStyle.appBarHeader(
                                                  color: Color(0xffd8d8d8),
                                                  size: 12,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Center(
                                        child:GestureDetector(
                                          onTap: (){

                                          },
                                          child: Icon(Icons.alarm,color: Color(0xffd8d8d8),
                                          ),)
                                    ),
                                    SizedBox(
                                      width: 05,
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                  onTap:(){
                                    // Navigator.pushNamed(context, '/signature_screen');
                                  },
                                  child: Icon(
                                    Icons.airport_shuttle_sharp,
                                    color: Color(0xffD3D3D3),
                                    size: 50,
                                  )
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 62,
                          decoration: BoxDecoration(
                            color: Color(0xff34B3E8),
                            border: Border.all(color: Color(0xff34B3E8),width: 1.0),
                          ),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Vous etes attendu dans 7 minutes ',style: AppTextStyle.appBarHeader(
                                  color: Color(0xffffffff),
                                  size: 16.0,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppFontFamilly.avenirNext
                              ),),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: ButtonChaliar(
                                  onTap: () {
                                    model.getMessageScreen(oderId,context,order.user_id!);
                                  },
                                  buttonText: 'ENVOYER UN MESSAGE',
                                  height:42.84,
                                  mediaQueryWidth: 0.4,
                                  borderRaduis: 8,
                                  backgroundcolor: Color(0xffDE335C),
                                  bordercolor:  Color(0xffDE335C),
                                  textStyle: AppTextStyle.appBarHeader(
                                      fontWeight: FontWeight.w400,
                                      size: 16,
                                      fontFamily: AppFontFamilly.avenirNext,
                                      color: ChaliarColors.whiteColor)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
              ),
              child: CustomHearder(
                title: 'Course en cours …',
                description: '',
              ),
            ),
          ],
        ),
      );
    })));
  }
}





