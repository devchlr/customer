import 'package:chaliar_delivery_app/model_views/order/order_validateVM.dart';
import 'package:chaliar_delivery_app/models/commande.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_color.dart';
import 'package:chaliar_delivery_app/ui/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/ui/widgets/button.dart';
import 'package:chaliar_delivery_app/ui/widgets/custom_header.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


class OrderValidateScreen extends StatefulWidget {
  FirebaseAuth _auth =FirebaseAuth.instance;
  String? orderId;
  OrderValidateScreen({this.orderId});
  @override
  _OrderValidateScreenState createState() => _OrderValidateScreenState();
}

class _OrderValidateScreenState extends State<OrderValidateScreen> {

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
      ChangeNotifierProvider<OrderValidateVM>(
          create: (context) => OrderValidateVM(),
          child: Consumer<OrderValidateVM>(
              builder: (context, model, child) =>
      Scaffold(
        backgroundColor: Color(0xffF3F3F3),
        body:
        FutureBuilder<DocumentSnapshot>(
    future: model.getOrderInformation(widget.orderId!),
    builder: (context, snapshot){
    if(snapshot.connectionState!=ConnectionState.done){
          return Container(
          child: Center(
          child: CircularProgressIndicator(color: Colors.blue,),
          ),
          );
    }
    Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
    var order=Order.fromJson(data);
    var deliveryInformation=OrderDeliveryInformation.fromJson(order.deliveryInformation!);
    String month=DateFormat('dd-MMMM-yyyy').format(deliveryInformation.delivery_date!);
    String hour=DateFormat('kk:mm').format(deliveryInformation.delivery_schedule!);
        return Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 110,
                ),
                Expanded(
                  child:  Container(
                    child: GoogleMap(
                      onMapCreated: _onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: _center,
                        zoom: 13.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.76,
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                elevation: 1,
                child: Container(
                  color: Color(0xffffffff),
                  height: 170,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                  ),
                  margin: EdgeInsets.only(
                      left: 20,
                      right: 20
                  ),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${month} à ${hour}',style: AppTextStyle.appBarHeader(
                              color: Color(0xff222B45),
                              size: 16.8,
                              fontWeight: FontWeight.w400
                          ),),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 2,
                        color: ChaliarColors.whiteGreyColor,
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
                                  model.getRecaptOrder(context, widget.orderId!);
                                  // Navigator.pushNamed(context, '/recapt_order');
                                },
                                buttonText: 'AJOUTER À MON AGENDA',
                                height:49,
                                mediaQueryWidth: 0.4,
                                borderRaduis: 10,
                                backgroundcolor: Color(0xffDE335C),
                                bordercolor:  Color(0xffDE335C),
                                textStyle: AppTextStyle.appBarHeader(
                                  fontWeight: FontWeight.w400,
                                    size: 12.64,
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
            Padding(
              padding: EdgeInsets.only(
              ),
              child: CustomHearder(
                isRed: true,
                title: 'Mission acceptée !',
                description: '',
              ),
            ),
          ],
        );})
      ),));
  }
}





