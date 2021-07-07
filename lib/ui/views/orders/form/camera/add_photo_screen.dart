import 'package:chaliar_delivery_app/ui/styles/chaliar_color.dart';
import 'package:chaliar_delivery_app/ui/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/ui/widgets/custom_header.dart';
import 'package:flutter_svg/svg.dart';

class AddPhotoScreen extends StatefulWidget {
  @override
  _AddPhotoScreenState createState() => _AddPhotoScreenState();
}
class _AddPhotoScreenState extends State<AddPhotoScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool dismitCircle=false;
  @override
  Widget build(BuildContext context) {
    return
      Stack(
        children: [
          Scaffold(
            key: _scaffoldKey,
            body:
            Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: ChaliarColors.whiteColor,
                          image: DecorationImage(
                            image: AssetImage("assets/images/bgPageBohomme.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                        color: ChaliarColors.whiteColor,
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(
                ),
                  child: CustomHearder(
                    title: 'Votre commande',
                    description: '7 avenue de la grande Armée/75003 Paris',
                  ),
                ),
                ListView(
                  children: [
                    SizedBox(
                      height: 171,
                    ),
                    Center(
                      child: Text(
                        'Vous Aurez deux fois plus de chances\nde trouver un chaliar si vous ajoutez\ndes photos de votre annonce.',
                        style: AppTextStyle.addPhotodesc(color: ChaliarColors.whiteColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Center(
                      child:GestureDetector(
                        onTap:(){
                          Navigator.pushNamed(context, '/take_picture');
                        } ,
                        child:Container(
                          height: 60,
                          width: MediaQuery.of(context).size.height * 0.3,
                          decoration:BoxDecoration(
                            color: ChaliarColors.secondaryColors,
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: Icon(Icons.camera_alt,color: ChaliarColors.whiteColor,),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: 30
                                  ),
                                  child:Center(child: Text('Prendre la photo',style: AppTextStyle.addPhotoBtn(color: ChaliarColors.whiteColor),)
                                  ),),
                              ),
                            ],
                          ),
                        ),
                      )
                      ,
                    ),
                    SizedBox(
                      height:28,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/resume_order_screen');
                        },
                        child: Text(
                          'passer cette étape',
                          style: AppTextStyle.addPhotoCaption(color: ChaliarColors.whiteColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(height:40 ,),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10
                      ),
                      child: SvgPicture.asset(
                        "assets/images/bonhomme.svg",
                        height: 325,
                        width: 297,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          dismitCircle==false? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(
                    top:MediaQuery.of(context).size.height * 0.12,
                    left:MediaQuery.of(context).size.width * 0.42,
                    right:MediaQuery.of(context).size.width * 0.42,
                  ),
                  child:GestureDetector(
                    onTap:(){
                      print('circle clicked');
                      setState(() {
                        dismitCircle=true;
                      });
                    },
                    child: CircleAvatar(
                      radius: 25.0,
                      backgroundColor: ChaliarColors.whiteColor,
                      child: Icon(Icons.close_outlined,color: ChaliarColors.primaryColors,),
                    ),
                  )
              )
            ],
          ):Container(),
         // Column(
         //    mainAxisAlignment: MainAxisAlignment.start,
         //    children: [
         //      Padding(
         //          padding: EdgeInsets.only(
         //            top:MediaQuery.of(context).size.height * 0.12,
         //            left:MediaQuery.of(context).size.width * 0.42,
         //            right:MediaQuery.of(context).size.width * 0.42,
         //          ),
         //          child:GestureDetector(
         //            onTap:(){
         //              Navigator.pushNamed(context, '/resume_order_screen');
         //            },
         //            child: CircleAvatar(
         //              radius: 25.0,
         //              backgroundColor: ChaliarColors.whiteColor,
         //              child: Icon(Icons.close_outlined,color: ChaliarColors.primaryColors,),
         //            ),
         //          )
         //      )
         //    ],
         //  ),
         Positioned(
            top: MediaQuery.of(context).size.height*0.065,
              left: MediaQuery.of(context).size.width*0.05,
              child:  GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 20,),
          ),),
        ],
      );
  }
}

