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


class OrderScanScreen extends StatefulWidget {
  FirebaseAuth _auth =FirebaseAuth.instance;
  @override
  _OrderScanScreenState createState() => _OrderScanScreenState();
}

class _OrderScanScreenState extends State<OrderScanScreen> {

  void initState() {
    super.initState();
    nextScreen();
  }
  void nextScreen()async{
      Timer(Duration(seconds: 10),
              () => Navigator.pushReplacementNamed(context, '/order_tracking'));
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
                  height: 90,
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
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 90,
                ),
                Expanded(
                  flex: 1,
                  child:  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/scan_map_bg.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.1,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SvgPicture.asset(
                      SvgIcons.radar_chaliar,
                      height: 129,
                      width: 128,
                    ),
                  ),SizedBox(
                    height: 25,
                  ),
                  Text('Recherche d’une course …',style: AppTextStyle.appBarHeader(
                    size: 16,
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.w400
                  ),)
                ],
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
          ],
        ),
      );
  }
}





