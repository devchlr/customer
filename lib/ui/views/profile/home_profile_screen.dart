import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/constants/iconList.dart';
import 'package:chaliar_delivery_app/model_views/profile/home_profileMV.dart';
import 'package:chaliar_delivery_app/models/user.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_color.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_font.dart';
import 'package:chaliar_delivery_app/ui/styles/text_style.dart';
import 'package:chaliar_delivery_app/ui/widgets/custom_botom_navigation_bar.dart';
import 'package:chaliar_delivery_app/ui/widgets/profile_listTile.dart';
import 'package:chaliar_delivery_app/ui/widgets/svg_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeProfileScreen extends StatefulWidget {
  HomeProfileScreen({Key? key,}) : super(key: key);
  @override
  _HomeProfileScreenState createState() => _HomeProfileScreenState();
}

class _HomeProfileScreenState extends State<HomeProfileScreen> {
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProfileMV>(
        create: (context) => HomeProfileMV(),
        child: Consumer<HomeProfileMV>(
            builder: (context, model, child) =>
                Scaffold(
                  backgroundColor: Color(0xffF3F3F3),
      bottomNavigationBar: CustomBottomNavigationBar(
        bgColor: Color(0xffF3F3F3),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 410,
                decoration: BoxDecoration(
                  color: Color(0xffF3F3F3),
                  image: DecorationImage(
                    image: AssetImage("assets/images/profileBg.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(child: Container(
                color: ChaliarColors.whiteGreyColor,
              ))
            ],
          ),
          Column(
            children: [
              Container(
                height: 410,
                child: ListView(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  FutureBuilder(
                    future:model.getUserD(),
                    builder: (context,AsyncSnapshot<DocumentSnapshot>snapshot){
                      if(snapshot.connectionState!=ConnectionState.done){
                        return CircularProgressIndicator();
                      }
                      if(!snapshot.hasData) return CircularProgressIndicator();
                      print(snapshot.data);
                      Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                      var user=UserChaliar.fromData(data);
                      return user.profile_url!=null?  CircleAvatar(
                        backgroundImage:NetworkImage(user.profile_url.toString()),
                        backgroundColor: Colors.transparent,
                        radius: 80,
                      ):CircleAvatar(
                        backgroundImage:AssetImage('assets/images/profileInage.png'),
                        backgroundColor: Colors.transparent,
                        radius: 80,
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width*0.1
                    ),
                    child:
                    Center(
                      child: FutureBuilder(
                        future:model.getUserD(),
                        builder: (context,AsyncSnapshot<DocumentSnapshot>snapshot){
                          if(snapshot.connectionState!=ConnectionState.done){
                            return CircularProgressIndicator();
                          }
                          if(!snapshot.hasData) return CircularProgressIndicator();
                          print(snapshot.data);
                          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                             return Text(
                               '${data['surname']}\n${data['name']}',
                               textAlign: TextAlign.left,
                               style: AppTextStyle.appBarHeader(
                                   size: 19,
                                   color: Color(0xffffffff),
                                   fontWeight: FontWeight.bold,
                                   fontFamily: AppFontFamilly.montserrat
                               ),
                             );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                            child: SvgPicture.asset(
                              "assets/icons/noun_Scooter.svg",
                              color: ChaliarColors.secondaryColors,
                              height: 23,
                              width: 38,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: Text('19 courses',style: AppTextStyle.appBarHeader(
                                color: Colors.white,
                                fontFamily: AppFontFamilly.avenirNext,
                                size: 16,
                                fontWeight: FontWeight.w400
                            ),),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                            child: SvgPicture.asset(
                              "assets/icons/credit-card.svg",
                              color: ChaliarColors.secondaryColors,
                              height: 23,
                              width: 38,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: Text('1260€ de C.A',style: AppTextStyle.appBarHeader(
                                color: Colors.white,
                                fontFamily: AppFontFamilly.avenirNext,
                                size: 16,
                                fontWeight: FontWeight.w400
                            ),),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              ),
              Expanded(
                  child:
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width*0.08,
                      right: MediaQuery.of(context).size.width*0.08
                    ),
                    child:  ListView(
                      padding: EdgeInsets.only(
                        top: 10
                      ),
                      children: [
                        Padding(padding: EdgeInsets.only(
                          left: 5,
                        ),
                          child: Text('GENERAL',style: AppTextStyle.appBarHeader(
                              size: 13,
                              color: Color(0xff77869E),
                              fontFamily: AppFontFamilly.avenirHeavy
                          ),),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        CustomProfileListTile(title:'Mes informations',iconAsset:SvgIcons.ticket,onTap:(){
                          model.getPageByName(context, '/edit_profile');
                        },),
                        SizedBox(
                          height: 12.0,
                        ),
                        CustomProfileListTile(title:'Méthode de paiement',iconAsset:SvgIcons.credit_card,onTap:(){
                         model.getPageByName(context, '/payment_method');
                        },),
                        SizedBox(
                          height: 13.0,
                        ),
                        CustomProfileListTile(title:'Facturation',
                          iconAsset:SvgIcons.invoice,onTap:(){
                          model.getPageByName(context, '/home_facturation');
                          },),
                        SizedBox(
                          height: 21.0,
                        ),
                Padding(padding: EdgeInsets.only(
                  left: 5,
                ),
                  child:Text('CHART',style: AppTextStyle.appBarHeader(
                            size: 13,
                            color: Color(0xff77869E),
                            fontFamily: AppFontFamilly.avenirHeavy
                        ),),),
                        SizedBox(
                          height: 14.0,
                        ),
                        CustomProfileListTile(title:'Aide',iconAsset:SvgIcons.question,onTap:(){
                          model.getPageByName(context, '/faq');
                        },),
                        SizedBox(
                          height: 12.0,
                        ),
                        CustomProfileListTile(title:'À propos',iconAsset:SvgIcons.smartphone,onTap:(){
                          model.getPageByName(context, '/about');
                        },),
                        SizedBox(
                          height: 16.0,
                        ),
                        CustomProfileListTile(title:'Partager l’application',iconAsset:SvgIcons.share,onTap:(){
                          model.sharedApp();
                        },),
                        SizedBox(
                          height: 44.0,
                        ),
                        GestureDetector(
                          onTap: (){
                            model.singoutUser(context);
                          },
                          child: Card(
                            color: Color(0xffDFE7F5),
                            elevation: 1,
                            child: ListTile(
                              leading: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Color(0xffDFE7F5),
                                  borderRadius: BorderRadius.all(Radius.circular(5)
                                  ),
                                ),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: (){
                                      model.singoutUser(context);
                                    },
                                    child: SvgIconButton(
                                      iconSize: 25,
                                      iconAsset: SvgIcons.logout,
                                    ),
                                  ),
                                ),
                              ),
                              title: Text(
                                'Déconnexion',
                                style: AppTextStyle.appBarHeader(
                                    color: Color(0xff042C5C),
                                    size: 14,
                                    fontFamily: AppFontFamilly.montserrat,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
             )
            ],
          ),

        ],
      ),
    ),
        ),
    );
  }
}
