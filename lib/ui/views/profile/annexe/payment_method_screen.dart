import 'package:flutter/material.dart';
import 'package:flutter_app/constants/iconList.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/chaliar_font.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter_app/ui/widgets/button.dart';
import 'package:flutter_app/ui/widgets/custom_header.dart';
import 'package:flutter_app/ui/widgets/svg_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F3F3),
      body: Stack(
        children: [
          Container(
            color: Color(0xffF3F3F3),
          ),
          Column(
            children: [
              SizedBox(
                height:110,),
              SizedBox(height: 57.0,),
              Padding(padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width*0.5
              ),
              child: GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/add_payment_method');
                },
                child: Row(
                  children: [
                    SvgIconButton(
                      iconSize: 25,
                      iconAsset: SvgIcons.add_rounded,
                    ),
                    SizedBox(width: 5.0,),
                    Text('Ajouter une carte',style: AppTextStyle.appBarHeader(
                      color: Color(0xff042C5C),
                      size: 14,
                    ),),
                  ],
                ),
              ),
              ),
              SizedBox(height: 40,),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width*0.1,
                    right: MediaQuery.of(context).size.width*0.1
                ),
                child: Container(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                    ),
                    items:[
                      CreditCardWidget(
                        cardNumber: '5344000340505324',
                        expiryDate: '20/24',
                        cardHolderName: 'IOSI PRATAMA',
                        cvvCode: '1234',
                        showBackView: true,
                        obscureCardNumber: true,
                        obscureCardCvv: false,
                        cardBgColor: Colors.lightBlue,   //Color(0xff3885DA)
                        height: 177,
                        labelCardHolder: 'label Holder',
                        textStyle: TextStyle(color: Color(0xffffffff)),
                        width: MediaQuery.of(context).size.width,
                        animationDuration: Duration(milliseconds: 1000),
                      ),
                      CreditCardWidget(
                        cardNumber: '5344000340505324',
                        expiryDate: '20/24',
                        cardHolderName: 'IOSI PRATAMA',
                        cvvCode: '1234',
                        showBackView: false,
                        obscureCardNumber: true,
                        obscureCardCvv: false,
                        cardBgColor: Colors.red,   //Color(0xff3885DA)
                        height: 177,
                        labelCardHolder: 'label Holder',
                        textStyle: TextStyle(color: Color(0xffffffff)),
                        width: MediaQuery.of(context).size.width,
                        animationDuration: Duration(milliseconds: 1000),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40.0,),
              Padding(padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width*0.5,
              ),
                child: Text(
                  'MES CARTES ENREGITSR',
                  style: AppTextStyle.appBarHeader(
                    color: Color(0xff042C5C),
                    size: 9.0
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Padding(padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width*0.05,
                right: MediaQuery.of(context).size.width*0.05,
              ),
                child: Column(
                  children: [
                    ListTile(
                      title: Card(
                        child: Container(
                          padding: EdgeInsets.only(
                            top: 20,
                            left: 10
                          ),
                          height: 50,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[SvgIconButton(
                              iconSize: 15,
                              iconAsset: SvgIcons.white_visa,
                            ),SizedBox(width: 10,),
                              Text('…',style: AppTextStyle.appBarHeader(
                                color: Color(0xff34B3E8),
                                size: 10.8
                              ),),
                              SizedBox(width: 5,),
                              Text('9946',style: AppTextStyle.appBarHeader(
                                  color: Color(0xff34B3E8),
                                  size: 10.8
                              ),)
                            ] ,
                          ),
                        ),
                      ),
                      trailing: CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage('assets/images/add_photo_profile.png'),
                        backgroundColor: Colors.transparent,
                        child: CircleAvatar(
                          radius: 5,
                          backgroundColor: Color(0xff042C5C),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Card(
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 20,
                              left: 10
                          ),
                          height: 50,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[SvgIconButton(
                              iconSize: 15,
                              iconAsset: SvgIcons.white_visa,
                            ),SizedBox(width: 10,),
                              Text('…',style: AppTextStyle.appBarHeader(
                                  color: Color(0xff34B3E8),
                                  size: 10.8
                              ),),
                              SizedBox(width: 5,),
                              Text('9946',style: AppTextStyle.appBarHeader(
                                  color: Color(0xff34B3E8),
                                  size: 10.8
                              ),)
                            ] ,
                          ),
                        ),
                      ),
                      trailing: CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage('assets/images/add_photo_profile.png'),
                        backgroundColor: Colors.transparent,
                        // child: CircleAvatar(
                        //   radius: 10,
                        //   backgroundColor: Color(0xff042C5C),
                        // ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40,),
              Center(
                child: ButtonChaliar(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.transparent,
                          elevation: 50,
                          content:  Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('waiting...',style: AppTextStyle.appBarHeader(
                                color: ChaliarColors.whiteColor,
                              ),),
                              SpinKitCubeGrid(
                                color: Colors.blueAccent,
                                size: 50.0,
                              )
                            ],
                          ),
                        ),
                      );
                      // model.formEditingController(context);
                      // Navigator.pushNamed(context, '/commande_arrivee_form');
                    },
                    buttonText: 'Utiliser cette carte',
                    height: 42,
                    mediaQueryWidth: 0.3,
                    borderRaduis: 50,
                    backgroundcolor: ChaliarColors.primaryColors,
                    bordercolor: ChaliarColors.primaryColors,
                    textStyle: AppTextStyle.appBarHeader(
                        size: 17,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFontFamilly.montserrat,
                        color: ChaliarColors.whiteColor)),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 0
            ),
            child: CustomHearder(
              title: "Méthode de paiement",
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
