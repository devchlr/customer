import 'package:chaliar_delivery_app/model_views/order/trackingMV.dart';
import 'package:chaliar_delivery_app/models/commande.dart';
import 'package:chaliar_delivery_app/ui/widgets/order_resume_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:chaliar_delivery_app/constants/iconList.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_color.dart';
import 'package:chaliar_delivery_app/ui/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/ui/widgets/button.dart';
import 'package:chaliar_delivery_app/ui/widgets/custom_header.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';


class OrderTrackingScreen extends StatefulWidget {
  FirebaseAuth _auth =FirebaseAuth.instance;
  @override
  _OrderTrackingScreenState createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {

  void initState() {
    super.initState();
  }
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Completer<GoogleMapController> _controller = Completer();

  bool isClose=false;

  GoogleMapController? mapController;
  final LatLng _center = const LatLng(48.85341, 2.3488);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OrderSelectedVM>(
        create: (context) => OrderSelectedVM(),
        child: Consumer<OrderSelectedVM>(
            builder: (context, model, child) =>
            FutureBuilder<QuerySnapshot>(
              future: model.getAllOrder(),
                builder: (context,snapshots){
                if(snapshots.hasData==null){
                  return Container(
                    color: Colors.white,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                print(snapshots.data!.docs.length);
                List<DocumentSnapshot>documentSnapList=snapshots.data!.docs;
                List<Order> orderList=[];
                documentSnapList.forEach((element) {
                  Map<String, dynamic> orderData = element.data() as Map<String, dynamic>;
                  orderList.add(Order.fromJson(orderData));
                });
                List<Widget>orderWidgetList=[];
                orderList.forEach((element) {
                  orderWidgetList.add(
                    OrderResumeWidgetCard(
                      onTap: (){
                        model.getAgendaPage(context, element.orderId!);
                      },
                      order: element,
                    )
                  );
                });

                removeOrderToList(int id){
                  orderWidgetList.removeAt(id);
                  setState(() {
                  });
                }

                return Scaffold(
                  backgroundColor: Color(0xffF3F3F3),
                  body: Stack(
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

                      Padding(padding: EdgeInsets.only(
                       top: MediaQuery.of(context).size.height*0.45
                      ),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          enableInfiniteScroll: false,
                          pageSnapping: false,
                          disableCenter: true,
                          height: 450.0,
                          autoPlay: false,
                          enlargeCenterPage: true,
                        ),
                        items:orderWidgetList,
                      ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                        ),
                        child: CustomHearder(
                          title: 'Commande',
                          description: '',
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                            top:MediaQuery.of(context).size.height * 0.2,
                            left:MediaQuery.of(context).size.width * 0.32,
                            right:MediaQuery.of(context).size.width * 0.32,
                          ),
                          child:GestureDetector(
                            onTap:(){
                              print('circle clicked');
                              setState(() {

                              });
                            },
                            child: Container(
                              height: 32,
                              width: 183,
                              decoration: BoxDecoration(
                                color: Color(0xff042C5C),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(width: 5,),
                                    Icon(Icons.arrow_forward_outlined,color: Colors.white,),
                                    Text('Passer hors ligne',style: AppTextStyle.appBarHeader(
                                        color: Colors.white,
                                        size: 12,
                                        fontWeight: FontWeight.w400
                                    ),),
                                    SizedBox(width: 5,),
                                  ],
                                ),
                              ),
                            ),
                          )
                      )
                    ],
                  ),
                );
            })
      ,

        ),);
  }
}





