import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_color.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_font.dart';
import 'package:chaliar_delivery_app/ui/styles/text_style.dart';
import 'package:chaliar_delivery_app/ui/widgets/button.dart';
import 'package:chaliar_delivery_app/ui/widgets/custom_header.dart';


class HomeFacturationScreen extends StatefulWidget {
  const HomeFacturationScreen({Key? key}) : super(key: key);

  @override
  _HomeFacturationScreenState createState() => _HomeFacturationScreenState();
}

class _HomeFacturationScreenState extends State<HomeFacturationScreen> {
  String? _chosenValue;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Stack(
        children: [
         SingleChildScrollView(
           child: Stack(
             children: [
               Column(
                 children: [
                   Container(
                     height: 343,
                     width: MediaQuery.of(context).size.width,
                     color: Color(0xffDE335C),
                     child: Padding(
                       padding: EdgeInsets.only(
                         top: 150,
                         left: MediaQuery.of(context).size.height*0.05,
                         right: MediaQuery.of(context).size.height*0.05,
                       ),
                       child:Column(
                         children: [
                           Center(
                             child: Container(
                               width: 55,
                               height: 55,
                               decoration: BoxDecoration(
                                   image: DecorationImage(
                                     image: AssetImage('assets/images/credit-card.png'),
                                     fit: BoxFit.fill,
                                   )
                               ),
                             ),
                           ),
                           SizedBox(
                             height: 26,
                           ),
                           Center(
                             child: Text('70,99€',
                               style: AppTextStyle.appBarHeader(
                                   size: 40,
                                   fontWeight: FontWeight.w400,
                                   color: Colors.white
                               ),
                             ),
                           ),
                           SizedBox(
                             height: 10,
                           ),
                           Center(
                             child: Text('Votre portefeuille',
                               style: AppTextStyle.appBarHeader(
                                   size: 20,
                                   fontWeight: FontWeight.w400,
                                   color: Colors.white
                               ),
                             ),
                           ),
                         ],
                       ) ,
                     ),
                   ),
                   Row(
                     children: [
                       Container(
                         height: 85,
                         width: MediaQuery.of(context).size.width*0.5,
                         decoration: BoxDecoration(
                             color: Color(0xff042C5C),
                             border: Border(
                                 right: BorderSide(
                                   color:Colors.lightBlue,
                                   width: 0.5,
                                 )
                             )
                         ),
                         child: Center(
                           child: Text('EN COURS\n350.0€',
                             textAlign: TextAlign.center,
                             style: AppTextStyle.appBarHeader(
                                 size: 15,
                                 color: Colors.white,
                                 fontWeight: FontWeight.w400
                             ),
                           ),
                         ),
                       ),
                       Container(
                         height: 85,
                         width: MediaQuery.of(context).size.width*0.5,
                         decoration: BoxDecoration(
                             color: Color(0xff042C5C),
                             border: Border(
                                 left: BorderSide(
                                   color: Colors.lightBlue,
                                   width: 0.5,
                                 )
                             )
                         ),
                         child: Center(
                           child: Text('MES GAINS\n70.99€',
                             textAlign: TextAlign.center,
                             style: AppTextStyle.appBarHeader(
                                 size: 15,
                                 color: Colors.white,
                                 fontWeight: FontWeight.w400
                             ),
                           ),
                         ),
                       ),
                     ],
                   ),
                   Container(
                     width: MediaQuery.of(context).size.width,
                     color: Color(0xffffffff),
                   ),
                 ],
               ),
               Padding(
                 padding: EdgeInsets.only(
                   top: 450,
                   left: MediaQuery.of(context).size.height*0.03,
                   right: MediaQuery.of(context).size.height*0.03,
                 ),
                 child: Column(
                   children: [
                     Card(
                       elevation: 2,
                       child: Container(
                         padding: EdgeInsets.only(
                             left: 20,
                             right: 10
                         ),
                         height: 119,
                         color: Colors.white,
                         child: Row(
                           children: [
                             Container(
                               width: 50,
                               height: 50,
                               decoration: BoxDecoration(
                                   image: DecorationImage(
                                     image: AssetImage('assets/images/museum.png'),
                                     fit: BoxFit.fill,
                                   )
                               ),
                             ),
                             SizedBox(
                               width: 26,
                             ),
                             Column(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: [
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text(
                                       'MATHIEU B',
                                       style: AppTextStyle.appBarHeader(
                                           size: 15,
                                           fontWeight: FontWeight.w400
                                       ),
                                     ),
                                     SizedBox(
                                       width: 75,
                                     )
                                   ],
                                 ),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text(
                                       'FR76123489098768779',
                                       style: AppTextStyle.appBarHeader(
                                           size: 15,
                                           fontWeight: FontWeight.w400,
                                           fontFamily: AppFontFamilly.avenirNext
                                       ),
                                     ),
                                   ],
                                 ),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text(
                                       'AGRIFP6856',
                                       style: AppTextStyle.appBarHeader(
                                           size: 15,
                                           fontWeight: FontWeight.w400,
                                           fontFamily: AppFontFamilly.avenirNext
                                       ),
                                     ),
                                     SizedBox(
                                       width: 75,
                                     )
                                   ],
                                 )
                               ],
                             )
                           ],
                         ),
                       ),
                     ),
                     SizedBox(
                       height: 54,
                     ),
                     Center(
                       child: ButtonChaliar(
                           onTap: () {
                             Navigator.pushNamed(context, '/order_validate');
                           },
                           buttonText: 'TRANSFERT BANCAIRE',
                           height:49,
                           mediaQueryWidth: 0.42,
                           borderRaduis: 40,
                           backgroundcolor: Color(0xffDE335C),
                           bordercolor:  Color(0xffDE335C),
                           textStyle: AppTextStyle.appBarHeader(
                               size: 9.78,
                               color: ChaliarColors.whiteColor)),
                     ),
                   ],
                 ),
               ),
             ],
           ),
         ),
          Padding(
            padding: EdgeInsets.only(
                top: 0
            ),
            child: CustomHearder(
              title: "Mon portefeuille",
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height*0.08,
                left: MediaQuery.of(context).size.width*0.02
            ),
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios,color: Colors.white,),
            ),
          ),
        ],
      ),
    );
  }
}
