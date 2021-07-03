import 'package:flutter/material.dart';
import 'package:flutter_app/constants/iconList.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter_app/ui/widgets/custom_botom_navigation_bar.dart';
import 'package:flutter_app/ui/widgets/custom_header.dart';
import 'package:flutter_app/ui/widgets/custom_tab.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeCourseScreen extends StatefulWidget {
  const HomeCourseScreen({Key? key}) : super(key: key);

  @override
  _HomeCourseScreenState createState() => _HomeCourseScreenState();
}

class _HomeCourseScreenState extends State<HomeCourseScreen> {
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
