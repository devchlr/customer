import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/constants/iconList.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_color.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_font.dart';
import 'package:chaliar_delivery_app/ui/styles/text_style.dart';
import 'package:chaliar_delivery_app/ui/widgets/appBar.dart';
import 'package:chaliar_delivery_app/ui/widgets/button.dart';
import 'package:chaliar_delivery_app/ui/widgets/custom_header.dart';
import 'package:chaliar_delivery_app/ui/widgets/payement_method_radio.dart';
import 'package:chaliar_delivery_app/ui/widgets/svg_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String group='1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F3F3),
      body: Stack(
        children: [
          Container(
            color: Color(0xffF3F3F3),
          ),
          ListView(
            padding: EdgeInsets.only(
                top: 110
            ),
            children: [
              SizedBox(height: 27.0,),
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
                left: MediaQuery.of(context).size.width*0.1,
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
                    CustomRadioCardCheckBox(
                      value: '1',
                      group: group,
                      onTap: (){
                        setState(() {
                          group='1';
                        });
                      },
                    ),
                    CustomRadioCardCheckBox(
                      value: '2',
                      group: group,
                      onTap: (){
                        setState(() {
                          group='2';
                        });
                      },
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
