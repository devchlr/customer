import 'package:firebase_auth/firebase_auth.dart';
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
                top: MediaQuery.of(context).size.height * 0.4,
              ),
              child:
              Center(
                child:
                GestureDetector(
                  onTap:(){ Navigator.pushNamed(context, '/order_scaning');},
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/images/go_btn.png'),
                    radius: 60,
                  ),
                ),
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





