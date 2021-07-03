import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/constants/iconList.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter_app/ui/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/widgets/button.dart';
import 'package:flutter_app/ui/widgets/custom_botom_navigation_bar.dart';
import 'package:flutter_app/ui/widgets/custom_header.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timelines/timelines.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';


class PreCommandeScreen extends StatefulWidget {
  FirebaseAuth _auth =FirebaseAuth.instance;
  @override
  _PreCommandeScreenState createState() => _PreCommandeScreenState();
}

class _PreCommandeScreenState extends State<PreCommandeScreen> {
  void initState() {
    super.initState();
    isSingIn();
  }
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? mapController;
  final LatLng _center = const LatLng(48.85341, 2.3488);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  void isSingIn()async{
    // if(await widget._auth.currentUser==null){
    //   Timer(Duration(seconds: 10),
    //           () => Navigator.pushReplacementNamed(context, '/singin'));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Color(0xffF3F3F3),
        // appBar: ChaliarMenu.topBar(
        //     title: 'Commande',
        //     bgColor: Color(0xffF3F3F3),
        //     imageBackground: 'assets/images/header.png'
        // ),
       //  bottomNavigationBar:
       // ,
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 110,),
                Container(
                  margin: EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                  ),
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                    color: Color(0xffF3F3F3),
                  ),
                  child: ListView(
                    children: [
                      GestureDetector(
                        onTap:()=>Navigator.pushNamed(context, '/commande_depart_form'),
                        child: TimelineTile(
                          nodeAlign: TimelineNodeAlign.start,
                          contents: Card(
                            child: Container(
                              height: 44.1,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(10.0),
                              child: Text('Position de départ du colis',style: AppTextStyle.captionPreCommande(color:ChaliarColors.secondaryColors),),
                            ),
                          ),
                          node: TimelineNode(
                            indicator: DotIndicator(

                            ),
                            endConnector: DashedLineConnector(),
                          ),
                        ),
                      ),
                      GestureDetector(onTap:()=>Navigator.pushNamed(context, '/commande_depart_form'),child: Container(
                        margin: EdgeInsets.only(
                            left: 3.0
                        ),
                        child: TimelineTile(
                          nodeAlign: TimelineNodeAlign.start,
                          contents: Card(
                            child: Container(
                              color: ChaliarColors.whiteGreyColor,
                              height: 44.10,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(10.0),
                              child: Text('Position de d\'arrive du colis',style: AppTextStyle.captionPreCommande(color:ChaliarColors.secondaryColors),),
                            ),
                          ),
                          node: TimelineNode(
                            indicator: ContainerIndicator(
                              child: Container(
                                height: 9.0,
                                width: 9.0,
                                color: Color(0xff3885DA),
                              ),
                            ),
                            startConnector: DashedLineConnector(),
                          ),
                        ),
                      ),)
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child:  Container(
                    child: GoogleMap(
                      onMapCreated: _onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: _center,
                        zoom: 11.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.045,
                  color: Colors.transparent,
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.6,
              ),
              child:
              Center(
                child: ButtonChaliar(
                    onTap: () {
                      Navigator.pushNamed(context, '/commande_depart_form');
                    },
                    buttonText: 'Commander',
                    height:49,
                    mediaQueryWidth: 0.25,
                    borderRaduis: 30,
                    backgroundcolor: ChaliarColors.primaryColors,
                    bordercolor: ChaliarColors.primaryColors,
                    textStyle: AppTextStyle.button(
                        color: ChaliarColors.whiteColor)),
              ),
            ),
            Padding(padding: EdgeInsets.only(
              top:MediaQuery.of(context).size.height*0.91,
            ),
              child:  CustomBottomNavigationBar(
                bgColor: Colors.transparent,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 0
              ),
              child: CustomHearder(
                title: "Commande",
              ),
            ),
          ],
        ),
      );
  }
}





