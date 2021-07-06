import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/constants/iconList.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/chaliar_font.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/widgets/button.dart';
import 'package:flutter_app/ui/widgets/custom_botom_navigation_bar.dart';
import 'package:flutter_app/ui/widgets/custom_header.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';


class OrderLiveTrackingScreen extends StatefulWidget {
  FirebaseAuth _auth =FirebaseAuth.instance;
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
      Scaffold(
        backgroundColor: Color(0xffF3F3F3),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: 630,
                    child: GoogleMap(
                      onMapCreated: _onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: _center,
                        zoom: 17.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.75,
                    ),
                    child: Card(
                      elevation: 1,
                      child: Container(
                        color: Color(0xffffffff),
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(
                        ),
                        margin: EdgeInsets.only(
                            left: 1,
                            right: 1
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 62,
                              padding: EdgeInsets.only(
                                  left: 10,right: 10
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
                                            child:Icon(Icons.alarm,color: Color(0xffd8d8d8),)
                                        ),
                                        SizedBox(
                                          width: 05,
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                      onTap:(){},
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
                                        Navigator.pushNamed(context, '/order_message');
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
                ],
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
  }
}





