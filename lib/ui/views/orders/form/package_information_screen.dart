import 'package:chaliar_delivery_app/constants/iconList.dart';
import 'package:chaliar_delivery_app/constants/package_size.dart';
import 'package:chaliar_delivery_app/model_views/order/taille_view_model.dart';
import 'package:chaliar_delivery_app/models/commande.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_color.dart';
import 'package:chaliar_delivery_app/ui/styles/text_style.dart';
import 'package:chaliar_delivery_app/ui/widgets/appBar.dart';
import 'package:chaliar_delivery_app/ui/widgets/button.dart';
import 'package:chaliar_delivery_app/ui/widgets/custom_header.dart';
import 'package:chaliar_delivery_app/ui/widgets/input_field.dart';
import 'package:chaliar_delivery_app/ui/widgets/reusableCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TailleColisScreen extends StatefulWidget {
OrderDeliveryInformation? deliveryInformation;
OrderRecipientInformation? recipientInformation;
TailleColisScreen({this.deliveryInformation,this.recipientInformation});

  @override
  _TailleColisScreenState createState() => _TailleColisScreenState();
}

class _TailleColisScreenState extends State<TailleColisScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool dismitCircle=false;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TailleScreeenViewmodel>(
      create: (context) => TailleScreeenViewmodel(),
      child: Consumer<TailleScreeenViewmodel>(
          builder: (context, model, child) =>
      Stack(
        children: [
          Scaffold(
            key: _scaffoldKey,
            resizeToAvoidBottomInset: true,
            body: Stack(
              children: [
                ListView(
                  children: [
                    SizedBox(
                      height: 21,
                    ),
                    Container(
                      height: 48,
                      width: MediaQuery.of(context).size.width*0.75,
                      margin: EdgeInsets.only(
                        bottom: 34,
                          top: 70.0,
                          left: MediaQuery.of(context).size.width*0.13,right: MediaQuery.of(context).size.width*0.13
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xff042C5C)),
                        color: ChaliarColors.whiteColor,
                      ),
                      child:  Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.07,
                            right: MediaQuery.of(context).size.width * 0.07
                        ),
                        child: TextField(
                            controller: model.package_nature,
                            textAlign: TextAlign.center,
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding:
                              EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                              hintText: 'Nom de l’objet à transporter',
                              hintStyle:AppTextStyle.appBarHeader(
                                  color: Color(0xff042C5C),
                                  size: 10.56,
                                  fontWeight: FontWeight.w400
                              ),
                            )
                          // controller: model.name,
                        ),
                      ),
                    ),
                    Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ReusableCard(
                              size: '${PackageSize.small}',
                              title: 'Taille S',
                              price: '39',
                              description: 'Tiens dans une boite à chaussure (téléphone, clé, …)',
                              colour: model.package_size==PackageSize.small?ChaliarColors.whiteColor:ChaliarColors.primaryColors,
                              bgColour: model.package_size==PackageSize.small?ChaliarColors.primaryColors:ChaliarColors.whiteColor,
                              inconAsset:SvgIcons.bike,
                              onPress: (){
                                model.selectedCard(PackageSize.small);
                              },
                            ),
                            ReusableCard(
                              size: '${PackageSize.medium}',
                              title: 'Taille M',
                              price: '69',
                              description: 'Tiens dans une valise cabine(ordinateur, platine …)',
                              colour: model.package_size==PackageSize.medium?ChaliarColors.whiteColor:ChaliarColors.primaryColors,
                              bgColour: model.package_size==PackageSize.medium?ChaliarColors.primaryColors:ChaliarColors.whiteColor,
                              inconAsset:SvgIcons.scooter,
                              onPress: (){
                                model.selectedCard(PackageSize.medium);
                              },
                            ),
                          ],
                        ),
                    Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ReusableCard(
                              size: '${PackageSize.large}',
                              title: 'Taille L',
                              price: '89',
                              description: 'Tiens dans le coffre d’une voiture(tv, valise …)',
                              colour: model.package_size==PackageSize.large?ChaliarColors.whiteColor:ChaliarColors.primaryColors,
                              bgColour: model.package_size==PackageSize.large?ChaliarColors.primaryColors:ChaliarColors.whiteColor,
                              inconAsset:SvgIcons.mini_cooper,
                              onPress: (){
                                model.selectedCard(PackageSize.large);
                              },
                            ),

                            ReusableCard(
                              size: '${PackageSize.extralarge}',
                              title: 'Taille XL',
                              price: '129',
                              description: 'Nécessite un petit utilitaire(canapé, armoire…)',
                              colour: model.package_size==PackageSize.extralarge?ChaliarColors.whiteColor:ChaliarColors.primaryColors,
                              bgColour: model.package_size==PackageSize.extralarge?ChaliarColors.primaryColors:ChaliarColors.whiteColor,
                              inconAsset:SvgIcons.truck,
                              onPress: (){
                                model.selectedCard(PackageSize.extralarge);
                              }
                              ,
                            )
                          ],
                        ),

                    SizedBox(
                      height: 51,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          bottom: 10.0
                      ),
                      child:Center(
                        child: ButtonChaliar(
                            onTap: () {
                              model.formEditingController(context);
                              // Navigator.pushNamed(context, '/add_photo');
                            },
                            buttonText: 'Suivant',
                            height: MediaQuery.of(context).size.height * 0.07,
                            mediaQueryWidth: 0.30,
                            borderRaduis: 50,
                            backgroundcolor: ChaliarColors.primaryColors,
                            bordercolor: ChaliarColors.primaryColors,
                            textStyle: AppTextStyle.button(
                                color: ChaliarColors.whiteColor)),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                  ),
                  child: CustomHearder(
                    title: 'Votre commande',
                    description: '7 avenue de la grande Armée/75003 Paris',
                  ),
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
        ],
      )));
  }
}

