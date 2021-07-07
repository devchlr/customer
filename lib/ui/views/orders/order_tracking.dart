import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:chaliar_delivery_app/constants/iconList.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_color.dart';
import 'package:chaliar_delivery_app/ui/styles/text_style.dart';
import 'package:chaliar_delivery_app/ui/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/ui/widgets/button.dart';
import 'package:chaliar_delivery_app/ui/widgets/custom_botom_navigation_bar.dart';
import 'package:chaliar_delivery_app/ui/widgets/custom_header.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timelines/timelines.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';


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
                top: MediaQuery.of(context).size.height * 0.45,
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
                  height: 406,
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('29 Janvier 2021 à 16:00',style: AppTextStyle.appBarHeader(
                            color: Color(0xff222B45),
                            size: 16.8,
                            fontWeight: FontWeight.w400
                          ),),
                        ],
                      ),
                      SizedBox(
                        height: 35                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Container(
                               height: 90,
                               width: 10,
                               decoration: BoxDecoration(
                                 color: Colors.white,
                                 image: DecorationImage(
                                   image: AssetImage("assets/images/timeLine.png"),
                                   fit: BoxFit.fill,
                                 ),
                               ),
                             ),
                             SizedBox(
                               width: 20,
                             ),
                             Container(
                               height: 100,
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 children: [
                                   Text('38 Avenue du Château, 94300 Vincennes',style: AppTextStyle.appBarHeader(
                                       color: Color(0xff042C5C),
                                       size: 9.64,
                                       fontWeight: FontWeight.w400
                                   ),),
                                   SizedBox(
                                     height: 55,
                                   ),
                                   Text('97 Rue de Paris, 94220 Charenton le Pont',style: AppTextStyle.appBarHeader(
                                       color: Color(0xff042C5C),
                                       size: 8.64,
                                       fontWeight: FontWeight.w400
                                   ),),
                                 ],
                               ),
                             ),
                           ],
                         )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 2,
                        width: MediaQuery.of(context).size.width,
                        color: ChaliarColors.whiteGreyColor,
                      ),
                      Container(
                         height: 95,
                         width: MediaQuery.of(context).size.width,
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Row(
                               children: [
                                 Container(
                                   height: 52,
                                   width: 52,
                                   decoration: BoxDecoration(
                                     image: DecorationImage(
                                       image: AssetImage("assets/images/profil_tracking.png"),
                                       fit: BoxFit.fill,
                                     ),
                                   ),
                                 ),
                                 SizedBox(
                                   width: 15,
                                 ),
                                 Column(
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   children: [
                                     SizedBox(
                                       height: 10,
                                     ),
                                     Text('Evan Guzman',style: AppTextStyle.appBarHeader(
                                       color: Color(0xff222B45),
                                       size: 10.8,
                                       fontWeight: FontWeight.w400,
                                     ),),
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       children: [
                                         SvgPicture.asset(
                                           SvgIcons.start,
                                           height: 13,
                                           width: 12,
                                         ),
                                         SizedBox(
                                           width: 5,
                                         ),
                                         Text('4,8',style: AppTextStyle.appBarHeader(
                                           color: Color(0xff222B45),
                                           size: 7.92,
                                           fontWeight: FontWeight.w400,
                                         ),),
                                         SizedBox(
                                           width: 35,
                                         ),
                                       ],
                                     ),
                                     SizedBox(
                                       height: 10,
                                     ),
                                   ],
                                 )
                               ],
                             ),
                             Column(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: [
                                 SizedBox(
                                   height: 5,
                                 ),
                                 Text('Un canapé',style: AppTextStyle.appBarHeader(
                                   color: Color(0xff042C5C),
                                   size: 13.64,
                                   fontWeight: FontWeight.w400,
                                 ),),

                                 Text('89\n€',style: AppTextStyle.appBarHeader(
                                   color: Color(0xff222B45),
                                   size: 16.8,
                                   fontWeight: FontWeight.w400,
                                 ),),
                               ],
                             )
                           ],
                         ),
                       ),
                      Container(
                        height: 2,
                        color: ChaliarColors.whiteGreyColor,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: ButtonChaliar(
                                onTap: () {
                                  Navigator.pushNamed(context, '/order_validate');
                                },
                                buttonText: 'ACCEPTER',
                                height:49,
                                mediaQueryWidth: 0.25,
                                borderRaduis: 10,
                                backgroundcolor: Color(0xffDE335C),
                                bordercolor:  Color(0xffDE335C),
                                textStyle: AppTextStyle.appBarHeader(
                                  size: 8.64,
                                    color: ChaliarColors.whiteColor)),
                          ),
                          Center(
                            child: ButtonChaliar(
                                onTap: () {

                                },
                                buttonText: 'REFUSER',
                                height:49,
                                mediaQueryWidth: 0.15,
                                borderRaduis: 10,
                                backgroundcolor: Color(0xffffffff),
                                bordercolor:  Color(0xff042C5C),
                                textStyle: AppTextStyle.appBarHeader(
                                  size: 8.64,
                                    color: Color(0xff042C5C))),
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
                title: 'Commande',
                description: '',
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                  top:MediaQuery.of(context).size.height * 0.43,
                  left:MediaQuery.of(context).size.width * 0.8,
                  right:MediaQuery.of(context).size.width * 0,
                ),
                child:GestureDetector(
                  onTap:(){
                    print('circle clicked');
                    setState(() {

                    });
                  },
                  child: CircleAvatar(
                    radius: 25.0,
                    backgroundColor: ChaliarColors.whiteColor,
                    child: Icon(Icons.close_outlined,color: ChaliarColors.primaryColors,),
                  ),
                )
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
  }
}





