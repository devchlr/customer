import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_app/ui/widgets/button.dart';
import 'package:flutter_app/ui/widgets/custom_header.dart';
class FaqScreen extends StatefulWidget {

  @override
  _FaqScreenState createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body:
          Stack(
           children: [
             StreamBuilder(
               stream: FirebaseFirestore.instance.collection('faq').snapshots(),
               builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                 if(snapshot.hasError){
                   return Center(
                     child: CircularProgressIndicator(),
                   );
                 }
                 if(snapshot.data==null){
                   return Center(
                     child: CircularProgressIndicator(),
                   );
                 }
                 return Stack(
                   children: [
                     Container(
                       color: Color(0xffffff),
                     ),
                     Column(
                       children: [
                         Container(
                           height: 157,
                         ),
                         Container(
                           height: 40,
                           child: Center(
                             child: Text('Comment pouvons nous vous aider ?',
                             style: AppTextStyle.appBarHeader(
                               color: Color(0xff042C5C),
                               size: 18,
                               fontWeight: FontWeight.w400
                             ),),
                           ),
                         ),
                         Expanded(
                           flex: 1,
                           child: Container(
                             padding: EdgeInsets.only(
                                 left:20.0,
                                 right: 20.0
                             ),
                             child: ListView(
                               children: snapshot.data!.docs.map((document){
                                 return Card(
                                   elevation: 2.0,
                                   child: ExpansionTile(
                                     trailing: Text(''),
                                     title: Text(document['title'],style:AppTextStyle.bodyfooterField(color: ChaliarColors.secondaryColors),),
                                     children: [
                                       Padding(padding: EdgeInsets.all(5),
                                         child:  Text(document['description'],textAlign:TextAlign.left,style:AppTextStyle.bodyfooterField(color: ChaliarColors.secondaryColors),),
                                       ),
                                     ],
                                   ),
                                 );
                               }).toList(),
                             ),
                           ),
                         ),
                         Container(
                           height: 150,
                           child:  Padding(
                             padding: EdgeInsets.only(
                               top: MediaQuery.of(context).size.height * 0.05,
                             ),
                             child: Center(
                               child: ButtonChaliar(
                                   onTap: ()=>launch("tel://+33 84 808 808"),
                                   buttonText: 'Contacter le support',
                                   height: MediaQuery.of(context).size.height * 0.07,
                                   mediaQueryWidth: 0.30,
                                   borderRaduis: 50,
                                   backgroundcolor: ChaliarColors.primaryColors,
                                   bordercolor: ChaliarColors.primaryColors,
                                   textStyle: AppTextStyle.button(
                                       color: ChaliarColors.whiteColor)),
                             ),
                           ),
                         )
                       ],
                     ),
                   ],
                 );
               },
             ),
             Padding(
               padding: EdgeInsets.only(
                   top: 0
               ),
               child: CustomHearder(
                 title: "Faq",
               ),
             ),
           ],
          ),
    );
  }
}

