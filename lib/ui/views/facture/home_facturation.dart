import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter_app/ui/widgets/custom_botom_navigation_bar.dart';
import 'package:flutter_app/ui/widgets/custom_header.dart';
import 'package:timelines/timelines.dart';

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
          Padding(padding: EdgeInsets.only(
            top: 135,
             left: MediaQuery.of(context).size.height*0.05,
            right: MediaQuery.of(context).size.height*0.05,
          ),
            child: ListView(
              children: [
               Center(
                 child:  Card(
                   shape: RoundedRectangleBorder(
                     borderRadius: const BorderRadius.all(
                       Radius.circular(20.0),
                     ),
                   ),
            child: Container(
              height: 32,
              width: 198,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child:Center(
                child: DropdownButton<String>(
                  focusColor:Colors.white,
                  value: _chosenValue,
                  elevation: 5,
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor:Colors.black,
                  items: <String>[
                    '90 derniers jours',
                    '60 derniers jours',
                    '30 derniers jours',
                    '7 derniers jours',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,style:TextStyle(color:Colors.black),),
                    );
                  }).toList(),
                  hint:Text(
                    "90 derniers jours",
                    style: AppTextStyle.appBarHeader(
                      color: Color(0xff042C5C),
                      size: 11,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _chosenValue = value;
                    });
                  },
                ),
              ),
            ),
                 ),
               ),
                SizedBox(
                  height: 28,
                ),
                Column(
                    children: [
                      Card(
                        elevation: 2,
                        child: Container(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width*0.08,
                              right: MediaQuery.of(context).size.width*0.02,
                            top: MediaQuery.of(context).size.height*0.015,
                            bottom:  MediaQuery.of(context).size.height*0.015
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/cardBg.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [

                                  Text('12 Rue Lamartie 75017',
                                    textAlign: TextAlign.left,
                                    style: AppTextStyle.appBarHeader(
                                    color: Color(0xff222426),
                                    size: 9.1,
                                    fontWeight: FontWeight.w400
                                  ),),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height*0.05,
                                  ),
                                  Text('93 Rue de Paris  94220 Charennton',style: AppTextStyle.appBarHeader(
                                      color: Color(0xff222426),
                                      size: 9.1,
                                      fontWeight: FontWeight.w400
                                  ),),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 26,
                                    width: 44,
                                    decoration: BoxDecoration(
                                      color: Color(0xff979797)
                                    ),
                                    child: Center(
                                      child: Text(
                                        '89€',
                                        style: AppTextStyle.appBarHeader(
                                          color: Color(0xff042C5C),
                                          size: 13,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text('Reçu',
                                    style: AppTextStyle.appBarHeader(
                                      color: Color(0xff042C5C),
                                      size: 10,
                                      fontWeight: FontWeight.w400
                                    ),
                                  ),
                                  Text('24/01',
                                    style: AppTextStyle.appBarHeader(
                                        color: Color(0xc4042c5c),
                                        size: 10,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width*0.08,
                              right: MediaQuery.of(context).size.width*0.02,
                              top: MediaQuery.of(context).size.height*0.015,
                              bottom:  MediaQuery.of(context).size.height*0.015
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/cardBg.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [

                                  Text('12 Rue Lamartie 75017',
                                    textAlign: TextAlign.left,
                                    style: AppTextStyle.appBarHeader(
                                        color: Color(0xff222426),
                                        size: 9.1,
                                        fontWeight: FontWeight.w400
                                    ),),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height*0.05,
                                  ),
                                  Text('93 Rue de Paris  94220 Charennton',style: AppTextStyle.appBarHeader(
                                      color: Color(0xff222426),
                                      size: 9.1,
                                      fontWeight: FontWeight.w400
                                  ),),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 26,
                                    width: 44,
                                    decoration: BoxDecoration(
                                        color: Color(0xff979797)
                                    ),
                                    child: Center(
                                      child: Text(
                                        '89€',
                                        style: AppTextStyle.appBarHeader(
                                            color: Color(0xff042C5C),
                                            size: 13,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text('Reçu',
                                    style: AppTextStyle.appBarHeader(
                                        color: Color(0xff042C5C),
                                        size: 10,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                  Text('24/01',
                                    style: AppTextStyle.appBarHeader(
                                        color: Color(0xc4042c5c),
                                        size: 10,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width*0.08,
                              right: MediaQuery.of(context).size.width*0.02,
                              top: MediaQuery.of(context).size.height*0.015,
                              bottom:  MediaQuery.of(context).size.height*0.015
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/cardBg.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [

                                  Text('12 Rue Lamartie 75017',
                                    textAlign: TextAlign.left,
                                    style: AppTextStyle.appBarHeader(
                                        color: Color(0xff222426),
                                        size: 9.1,
                                        fontWeight: FontWeight.w400
                                    ),),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height*0.05,
                                  ),
                                  Text('93 Rue de Paris  94220 Charennton',style: AppTextStyle.appBarHeader(
                                      color: Color(0xff222426),
                                      size: 9.1,
                                      fontWeight: FontWeight.w400
                                  ),),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 26,
                                    width: 44,
                                    decoration: BoxDecoration(
                                        color: Color(0xff979797)
                                    ),
                                    child: Center(
                                      child: Text(
                                        '89€',
                                        style: AppTextStyle.appBarHeader(
                                            color: Color(0xff042C5C),
                                            size: 13,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text('Reçu',
                                    style: AppTextStyle.appBarHeader(
                                        color: Color(0xff042C5C),
                                        size: 10,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                  Text('24/01',
                                    style: AppTextStyle.appBarHeader(
                                        color: Color(0xc4042c5c),
                                        size: 10,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width*0.08,
                              right: MediaQuery.of(context).size.width*0.02,
                              top: MediaQuery.of(context).size.height*0.015,
                              bottom:  MediaQuery.of(context).size.height*0.015
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/cardBg.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [

                                  Text('12 Rue Lamartie 75017',
                                    textAlign: TextAlign.left,
                                    style: AppTextStyle.appBarHeader(
                                        color: Color(0xff222426),
                                        size: 9.1,
                                        fontWeight: FontWeight.w400
                                    ),),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height*0.05,
                                  ),
                                  Text('93 Rue de Paris  94220 Charennton',style: AppTextStyle.appBarHeader(
                                      color: Color(0xff222426),
                                      size: 9.1,
                                      fontWeight: FontWeight.w400
                                  ),),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 26,
                                    width: 44,
                                    decoration: BoxDecoration(
                                        color: Color(0xff979797)
                                    ),
                                    child: Center(
                                      child: Text(
                                        '89€',
                                        style: AppTextStyle.appBarHeader(
                                            color: Color(0xff042C5C),
                                            size: 13,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text('Reçu',
                                    style: AppTextStyle.appBarHeader(
                                        color: Color(0xff042C5C),
                                        size: 10,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                  Text('24/01',
                                    style: AppTextStyle.appBarHeader(
                                        color: Color(0xc4042c5c),
                                        size: 10,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width*0.08,
                              right: MediaQuery.of(context).size.width*0.02,
                              top: MediaQuery.of(context).size.height*0.015,
                              bottom:  MediaQuery.of(context).size.height*0.015
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/cardBg.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [

                                  Text('12 Rue Lamartie 75017',
                                    textAlign: TextAlign.left,
                                    style: AppTextStyle.appBarHeader(
                                        color: Color(0xff222426),
                                        size: 9.1,
                                        fontWeight: FontWeight.w400
                                    ),),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height*0.05,
                                  ),
                                  Text('93 Rue de Paris  94220 Charennton',style: AppTextStyle.appBarHeader(
                                      color: Color(0xff222426),
                                      size: 9.1,
                                      fontWeight: FontWeight.w400
                                  ),),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 26,
                                    width: 44,
                                    decoration: BoxDecoration(
                                        color: Color(0xff979797)
                                    ),
                                    child: Center(
                                      child: Text(
                                        '89€',
                                        style: AppTextStyle.appBarHeader(
                                            color: Color(0xff042C5C),
                                            size: 13,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text('Reçu',
                                    style: AppTextStyle.appBarHeader(
                                        color: Color(0xff042C5C),
                                        size: 10,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                  Text('24/01',
                                    style: AppTextStyle.appBarHeader(
                                        color: Color(0xc4042c5c),
                                        size: 10,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width*0.08,
                              right: MediaQuery.of(context).size.width*0.02,
                              top: MediaQuery.of(context).size.height*0.015,
                              bottom:  MediaQuery.of(context).size.height*0.015
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/cardBg.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [

                                  Text('12 Rue Lamartie 75017',
                                    textAlign: TextAlign.left,
                                    style: AppTextStyle.appBarHeader(
                                        color: Color(0xff222426),
                                        size: 9.1,
                                        fontWeight: FontWeight.w400
                                    ),),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height*0.05,
                                  ),
                                  Text('93 Rue de Paris  94220 Charennton',style: AppTextStyle.appBarHeader(
                                      color: Color(0xff222426),
                                      size: 9.1,
                                      fontWeight: FontWeight.w400
                                  ),),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 26,
                                    width: 44,
                                    decoration: BoxDecoration(
                                        color: Color(0xff979797)
                                    ),
                                    child: Center(
                                      child: Text(
                                        '89€',
                                        style: AppTextStyle.appBarHeader(
                                            color: Color(0xff042C5C),
                                            size: 13,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text('Reçu',
                                    style: AppTextStyle.appBarHeader(
                                        color: Color(0xff042C5C),
                                        size: 10,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                  Text('24/01',
                                    style: AppTextStyle.appBarHeader(
                                        color: Color(0xc4042c5c),
                                        size: 10,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width*0.08,
                              right: MediaQuery.of(context).size.width*0.02,
                              top: MediaQuery.of(context).size.height*0.015,
                              bottom:  MediaQuery.of(context).size.height*0.015
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/cardBg.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [

                                  Text('12 Rue Lamartie 75017',
                                    textAlign: TextAlign.left,
                                    style: AppTextStyle.appBarHeader(
                                        color: Color(0xff222426),
                                        size: 9.1,
                                        fontWeight: FontWeight.w400
                                    ),),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height*0.05,
                                  ),
                                  Text('93 Rue de Paris  94220 Charennton',style: AppTextStyle.appBarHeader(
                                      color: Color(0xff222426),
                                      size: 9.1,
                                      fontWeight: FontWeight.w400
                                  ),),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 26,
                                    width: 44,
                                    decoration: BoxDecoration(
                                        color: Color(0xff979797)
                                    ),
                                    child: Center(
                                      child: Text(
                                        '89€',
                                        style: AppTextStyle.appBarHeader(
                                            color: Color(0xff042C5C),
                                            size: 13,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text('Reçu',
                                    style: AppTextStyle.appBarHeader(
                                        color: Color(0xff042C5C),
                                        size: 10,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                  Text('24/01',
                                    style: AppTextStyle.appBarHeader(
                                        color: Color(0xc4042c5c),
                                        size: 10,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width*0.08,
                              right: MediaQuery.of(context).size.width*0.02,
                              top: MediaQuery.of(context).size.height*0.015,
                              bottom:  MediaQuery.of(context).size.height*0.015
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/cardBg.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [

                                  Text('12 Rue Lamartie 75017',
                                    textAlign: TextAlign.left,
                                    style: AppTextStyle.appBarHeader(
                                        color: Color(0xff222426),
                                        size: 9.1,
                                        fontWeight: FontWeight.w400
                                    ),),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height*0.05,
                                  ),
                                  Text('93 Rue de Paris  94220 Charennton',style: AppTextStyle.appBarHeader(
                                      color: Color(0xff222426),
                                      size: 9.1,
                                      fontWeight: FontWeight.w400
                                  ),),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 26,
                                    width: 44,
                                    decoration: BoxDecoration(
                                        color: Color(0xff979797)
                                    ),
                                    child: Center(
                                      child: Text(
                                        '89€',
                                        style: AppTextStyle.appBarHeader(
                                            color: Color(0xff042C5C),
                                            size: 13,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text('Reçu',
                                    style: AppTextStyle.appBarHeader(
                                        color: Color(0xff042C5C),
                                        size: 10,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                  Text('24/01',
                                    style: AppTextStyle.appBarHeader(
                                        color: Color(0xc4042c5c),
                                        size: 10,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                SizedBox(
                  height: 150,
                )
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
                top: 0
            ),
            child: CustomHearder(
              title: "Facturation",
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
          Padding(padding: EdgeInsets.only(
            top:MediaQuery.of(context).size.height*0.91,
          ),
            child:  CustomBottomNavigationBar(
              bgColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
