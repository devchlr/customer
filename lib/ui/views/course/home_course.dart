import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/constants/iconList.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_color.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_font.dart';
import 'package:chaliar_delivery_app/ui/styles/text_style.dart';
import 'package:chaliar_delivery_app/ui/widgets/button.dart';
import 'package:chaliar_delivery_app/ui/widgets/custom_botom_navigation_bar.dart';
import 'package:chaliar_delivery_app/ui/widgets/custom_header.dart';
import 'package:chaliar_delivery_app/ui/widgets/custom_tab.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeCourseScreen extends StatefulWidget {
  const HomeCourseScreen({Key? key}) : super(key: key);

  @override
  _HomeCourseScreenState createState() => _HomeCourseScreenState();
}

class _HomeCourseScreenState extends State<HomeCourseScreen> {
  bool isExpand=false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Stack(
          children: [
            Padding(padding: EdgeInsets.only(
                top: 147,
                bottom: 77
            ),
              child: Column(
                children: [
                 Container(
                   child:  TabBar(
                     indicator: BoxDecoration(
                         boxShadow: [
                           BoxShadow(
                             color: Color(0xff042C5C),
                             blurRadius: 6,
                             offset: Offset(1, 2), // Shadow position
                           ),
                         ],
                         borderRadius: BorderRadius.circular(50),
                         color: Colors.white,
                         border: Border.all(color: Color(0xff979797))// Creates border
                     ),
                     indicatorSize: TabBarIndicatorSize.label,
                     tabs: [
                       CustomTabBar(title: 'Passé',),
                       CustomTabBar(title: 'En cours',),
                       CustomTabBar(title: 'À venir',),
                     ],
                   ),
                 ),
                  Expanded(
                      child:Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20
                        ),
                        child:   TabBarView(
                          children: [
                            ListView(
                              children: [
                                Card(
                                  elevation: 2,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                      top: 5,
                                      bottom: 5
                                    ),
                                    height: 99,
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 72,
                                              width: 68,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage("assets/images/profil_tracking.png"),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                    'Livres',
                                                  style: AppTextStyle.appBarHeader(
                                                    color: Color(0xffC0BFC8),
                                                    size: 9,
                                                    fontWeight: FontWeight.w400
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'David. A',
                                                  style: AppTextStyle.appBarHeader(
                                                      color: Color(0xffC0BFC8),
                                                      size: 11,
                                                      fontWeight: FontWeight.w400
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    SvgPicture.asset(
                                                      SvgIcons.start,
                                                      height: 13,
                                                      width: 12,
                                                    ),
                                                    SvgPicture.asset(
                                                      SvgIcons.start,
                                                      height: 13,
                                                      width: 12,
                                                    ),
                                                    SvgPicture.asset(
                                                      SvgIcons.start,
                                                      height: 13,
                                                      width: 12,
                                                    ),
                                                    SvgPicture.asset(
                                                      SvgIcons.start,
                                                      height: 13,
                                                      width: 12,
                                                    ),
                                                    SvgPicture.asset(
                                                      SvgIcons.start,
                                                      height: 13,
                                                      width: 12,
                                                    ),

                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: 26,
                                              width: 44,
                                              color: Color(0xff979797),
                                              child: Center(
                                                child: Text('39€',
                                                style: AppTextStyle.appBarHeader(
                                                  color: Color(0xff042C5C),
                                                  size: 13,
                                                  fontWeight: FontWeight.bold
                                                ),),
                                              ),
                                            ),
                                            Text(
                                              '24/01',
                                              style: AppTextStyle.appBarHeader(
                                                color: Color(0xab042c5c),
                                                fontWeight: FontWeight.w400,
                                                size: 10
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            ListView(
                              children: [
                                Column(
                                  children: [
                                    isExpand==false?GestureDetector(
                                      onTap:(){
                                        setState((){
                                          isExpand=true;
                                        });
                                      },
                                      child:Card(
                                        elevation: 2,
                                        child:
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 5,
                                              bottom: 5
                                          ),
                                          height: 99,
                                          width: MediaQuery.of(context).size.width,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 72,
                                                    width: 68,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage("assets/images/profil_tracking.png"),
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 30,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Text(
                                                        'Livres',
                                                        style: AppTextStyle.appBarHeader(
                                                            color: Color(0xffC0BFC8),
                                                            size: 9,
                                                            fontWeight: FontWeight.w400
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        'David. A',
                                                        style: AppTextStyle.appBarHeader(
                                                            color: Color(0xffC0BFC8),
                                                            size: 11,
                                                            fontWeight: FontWeight.w400
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          SvgPicture.asset(
                                                            SvgIcons.start,
                                                            height: 13,
                                                            width: 12,
                                                          ),
                                                          SvgPicture.asset(
                                                            SvgIcons.start,
                                                            height: 13,
                                                            width: 12,
                                                          ),
                                                          SvgPicture.asset(
                                                            SvgIcons.start,
                                                            height: 13,
                                                            width: 12,
                                                          ),
                                                          SvgPicture.asset(
                                                            SvgIcons.start,
                                                            height: 13,
                                                            width: 12,
                                                          ),
                                                          SvgPicture.asset(
                                                            SvgIcons.start,
                                                            height: 13,
                                                            width: 12,
                                                          ),

                                                        ],
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    height: 26,
                                                    width: 44,
                                                    color: Color(0xff979797),
                                                    child: Center(
                                                      child: Text('39€',
                                                        style: AppTextStyle.appBarHeader(
                                                            color: Color(0xff042C5C),
                                                            size: 13,
                                                            fontWeight: FontWeight.bold
                                                        ),),
                                                    ),
                                                  ),
                                                  Text(
                                                    '24/01',
                                                    style: AppTextStyle.appBarHeader(
                                                        color: Color(0xab042c5c),
                                                        fontWeight: FontWeight.w400,
                                                        size: 10
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ):
                                    GestureDetector(
                                      onTap:(){
                                        setState((){
                                          isExpand=false;
                                        });
                                      },
                                      child: Card(
                                        elevation: 2,
                                        child:
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 10,
                                              bottom: 5
                                          ),
                                          height: 272,
                                          width: MediaQuery.of(context).size.width,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text(
                                                                '29 Janvier 2021 à 16:00',
                                                                style: AppTextStyle.appBarHeader(
                                                                    color: Color(0xff222B45),
                                                                    size: 16.8,
                                                                    fontWeight: FontWeight.w400
                                                                ),
                                                              ),

                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 14,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Container(
                                                                height: 72,
                                                                width: 68,
                                                                decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                    image: AssetImage("assets/images/profil_tracking.png"),
                                                                    fit: BoxFit.fill,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 30,
                                                              ),
                                                              Column(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  Text(
                                                                    'Livres',
                                                                    style: AppTextStyle.appBarHeader(
                                                                        color: Color(0xffC0BFC8),
                                                                        size: 9,
                                                                        fontWeight: FontWeight.w400
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Text(
                                                                    'David. A',
                                                                    style: AppTextStyle.appBarHeader(
                                                                        color: Color(0xffC0BFC8),
                                                                        size: 11,
                                                                        fontWeight: FontWeight.w400
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      SvgPicture.asset(
                                                                        SvgIcons.start,
                                                                        height: 13,
                                                                        width: 12,
                                                                      ),
                                                                      SvgPicture.asset(
                                                                        SvgIcons.start,
                                                                        height: 13,
                                                                        width: 12,
                                                                      ),
                                                                      SvgPicture.asset(
                                                                        SvgIcons.start,
                                                                        height: 13,
                                                                        width: 12,
                                                                      ),
                                                                      SvgPicture.asset(
                                                                        SvgIcons.start,
                                                                        height: 13,
                                                                        width: 12,
                                                                      ),
                                                                      SvgPicture.asset(
                                                                        SvgIcons.start,
                                                                        height: 13,
                                                                        width: 12,
                                                                      ),

                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:EdgeInsets.only(
                                                        top:0
                                                    ),
                                                    child:  Container(
                                                      height: 26,
                                                      width: 44,
                                                      color: Color(0xff979797),
                                                      child: Center(
                                                        child: Text('39€',
                                                          style: AppTextStyle.appBarHeader(
                                                              color: Color(0xff042C5C),
                                                              size: 13,
                                                              fontWeight: FontWeight.bold
                                                          ),),
                                                      ),
                                                    ),

                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 21,
                                              ),
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 9,
                                                    backgroundColor: ChaliarColors.primaryColors,
                                                  ),
                                                  SizedBox(width: 10,),
                                                  Text('38 Avenue du Château,\n94300 Vincennes',
                                                    style: AppTextStyle.appBarHeader(
                                                        color: Color(0xff042C5C),
                                                        size: 8.64,
                                                        fontWeight: FontWeight.w400
                                                    ),
                                                  ),
                                                  SizedBox(width: 10,),
                                                  Container(
                                                    height: 5,
                                                    width:70,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage("assets/images/line.png"),
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 10,),
                                                  Container(
                                                    height: 15,
                                                    width: 15,
                                                    color: Color(0x9f3885da),
                                                  ),
                                                  SizedBox(width: 10,),
                                                  Text('38 Avenue du Château,\n94300 Vincennes',
                                                    style: AppTextStyle.appBarHeader(
                                                        color: Color(0xff042C5C),
                                                        size: 8.64,
                                                        fontWeight: FontWeight.w400
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 35,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Center(
                                                    child: ButtonChaliar(
                                                        onTap: () {
                                                          Navigator.pushNamed(context, '/order_message');
                                                        },
                                                        buttonText: 'ANNULER LA COURSE',
                                                        height:42,
                                                        mediaQueryWidth: 0.35,
                                                        borderRaduis: 8,
                                                        backgroundcolor: Color(0xffDE335C),
                                                        bordercolor:  Color(0xffDE335C),
                                                        textStyle: AppTextStyle.appBarHeader(
                                                            fontWeight: FontWeight.w400,
                                                            size: 9.8,
                                                            fontFamily: AppFontFamilly.montserrat,
                                                            color: ChaliarColors.whiteColor)),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 21,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            ListView(
                              children: [
                                Column(
                                  children: [
                                    isExpand==false?GestureDetector(
                                      onTap:(){
                                        setState((){
                                          isExpand=true;
                                        });
                                      },
                                      child:Card(
                                        elevation: 2,
                                        child:
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 5,
                                              bottom: 5
                                          ),
                                          height: 99,
                                          width: MediaQuery.of(context).size.width,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 72,
                                                    width: 68,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage("assets/images/profil_tracking.png"),
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 30,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Text(
                                                        'Livres',
                                                        style: AppTextStyle.appBarHeader(
                                                            color: Color(0xffC0BFC8),
                                                            size: 9,
                                                            fontWeight: FontWeight.w400
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        'David. A',
                                                        style: AppTextStyle.appBarHeader(
                                                            color: Color(0xffC0BFC8),
                                                            size: 11,
                                                            fontWeight: FontWeight.w400
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          SvgPicture.asset(
                                                            SvgIcons.start,
                                                            height: 13,
                                                            width: 12,
                                                          ),
                                                          SvgPicture.asset(
                                                            SvgIcons.start,
                                                            height: 13,
                                                            width: 12,
                                                          ),
                                                          SvgPicture.asset(
                                                            SvgIcons.start,
                                                            height: 13,
                                                            width: 12,
                                                          ),
                                                          SvgPicture.asset(
                                                            SvgIcons.start,
                                                            height: 13,
                                                            width: 12,
                                                          ),
                                                          SvgPicture.asset(
                                                            SvgIcons.start,
                                                            height: 13,
                                                            width: 12,
                                                          ),

                                                        ],
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    height: 26,
                                                    width: 44,
                                                    color: Color(0xff979797),
                                                    child: Center(
                                                      child: Text('39€',
                                                        style: AppTextStyle.appBarHeader(
                                                            color: Color(0xff042C5C),
                                                            size: 13,
                                                            fontWeight: FontWeight.bold
                                                        ),),
                                                    ),
                                                  ),
                                                  Text(
                                                    '24/01',
                                                    style: AppTextStyle.appBarHeader(
                                                        color: Color(0xab042c5c),
                                                        fontWeight: FontWeight.w400,
                                                        size: 10
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ):
                                    GestureDetector(
                                      onTap:(){
                                        setState((){
                                          isExpand=false;
                                        });
                                      },
                                      child: Card(
                                        elevation: 2,
                                        child:
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 10,
                                              bottom: 5
                                          ),
                                          height: 272,
                                          width: MediaQuery.of(context).size.width,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text(
                                                                '29 Janvier 2021 à 16:00',
                                                                style: AppTextStyle.appBarHeader(
                                                                    color: Color(0xff222B45),
                                                                    size: 16.8,
                                                                    fontWeight: FontWeight.w400
                                                                ),
                                                              ),

                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 14,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Container(
                                                                height: 72,
                                                                width: 68,
                                                                decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                    image: AssetImage("assets/images/profil_tracking.png"),
                                                                    fit: BoxFit.fill,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 30,
                                                              ),
                                                              Column(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  Text(
                                                                    'Livres',
                                                                    style: AppTextStyle.appBarHeader(
                                                                        color: Color(0xffC0BFC8),
                                                                        size: 9,
                                                                        fontWeight: FontWeight.w400
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Text(
                                                                    'David. A',
                                                                    style: AppTextStyle.appBarHeader(
                                                                        color: Color(0xffC0BFC8),
                                                                        size: 11,
                                                                        fontWeight: FontWeight.w400
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      SvgPicture.asset(
                                                                        SvgIcons.start,
                                                                        height: 13,
                                                                        width: 12,
                                                                      ),
                                                                      SvgPicture.asset(
                                                                        SvgIcons.start,
                                                                        height: 13,
                                                                        width: 12,
                                                                      ),
                                                                      SvgPicture.asset(
                                                                        SvgIcons.start,
                                                                        height: 13,
                                                                        width: 12,
                                                                      ),
                                                                      SvgPicture.asset(
                                                                        SvgIcons.start,
                                                                        height: 13,
                                                                        width: 12,
                                                                      ),
                                                                      SvgPicture.asset(
                                                                        SvgIcons.start,
                                                                        height: 13,
                                                                        width: 12,
                                                                      ),

                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:EdgeInsets.only(
                                                        top:0
                                                    ),
                                                    child:  Container(
                                                      height: 26,
                                                      width: 44,
                                                      color: Color(0xff979797),
                                                      child: Center(
                                                        child: Text('39€',
                                                          style: AppTextStyle.appBarHeader(
                                                              color: Color(0xff042C5C),
                                                              size: 13,
                                                              fontWeight: FontWeight.bold
                                                          ),),
                                                      ),
                                                    ),

                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 21,
                                              ),
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 9,
                                                    backgroundColor: ChaliarColors.primaryColors,
                                                  ),
                                                  SizedBox(width: 10,),
                                                  Text('38 Avenue du Château,\n94300 Vincennes',
                                                    style: AppTextStyle.appBarHeader(
                                                        color: Color(0xff042C5C),
                                                        size: 8.64,
                                                        fontWeight: FontWeight.w400
                                                    ),
                                                  ),
                                                  SizedBox(width: 10,),
                                                  Container(
                                                    height: 5,
                                                    width:70,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage("assets/images/line.png"),
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 10,),
                                                  Container(
                                                    height: 15,
                                                    width: 15,
                                                    color: Color(0x9f3885da),
                                                  ),
                                                  SizedBox(width: 10,),
                                                  Text('38 Avenue du Château,\n94300 Vincennes',
                                                    style: AppTextStyle.appBarHeader(
                                                        color: Color(0xff042C5C),
                                                        size: 8.64,
                                                        fontWeight: FontWeight.w400
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 35,
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
                                                        mediaQueryWidth: 0.23,
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
                                                        mediaQueryWidth: 0.12,
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
                                                height: 21,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
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
                title: "Mes courses",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
