import 'package:flutter_app/model_views/order/arrive_view_model.dart';
import 'package:flutter_app/models/commande.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter_app/ui/widgets/button.dart';
import 'package:flutter_app/ui/widgets/custom_botom_navigation_bar.dart';
import 'package:flutter_app/ui/widgets/custom_header.dart';
import 'package:flutter_app/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ArriveeFormScreen extends StatefulWidget {
  OrderDeliveryInformation? deliveryInformation;
  ArriveeFormScreen({this.deliveryInformation});

  @override
  _ArriveeFormScreenState createState() => _ArriveeFormScreenState();
}

class _ArriveeFormScreenState extends State<ArriveeFormScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider<ArriveScreenViewModel>(
      create: (context) => ArriveScreenViewModel(),
      child: Consumer<ArriveScreenViewModel>(
          builder: (context, model, child) =>
      Scaffold(
      key: _scaffoldKey,
        resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 110,),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(
                      left: 20.0,
                      right: 20.0
                  ),
                  color: ChaliarColors.whiteColor,
                  child: Card(
                    elevation: 1.5,
                    child: ListView(
                      children: [
                        ListTile(
                          title: Text('Position d\'arrivée du colis',
                            style: AppTextStyle.formComDesc(color: ChaliarColors.secondaryColors,),
                          ),
                        ),
                        SizedBox(
                          height: 3.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                          child: InputField(
                            fieldSize: MediaQuery.of(context).size.height * 0.025,
                            label: "Adresse de d\'arrivée",
                            isBorder: true,
                            textLabelColor: ChaliarColors.secondaryColors,
                            maxlenght: 250,
                            backgroundColor: ChaliarColors.whiteGreyColor,
                            borderColor: ChaliarColors.primaryColors,
                            controller: model.arrival_address,
                          ),
                        ),
                        SizedBox(
                          height: 13.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                          child: InputField(
                            fieldSize: MediaQuery.of(context).size.height * 0.025,
                            label: "Prénom du destinataire",
                            isBorder: true,
                            textLabelColor: ChaliarColors.secondaryColors,
                            maxlenght: 250,
                            backgroundColor: ChaliarColors.whiteGreyColor,
                            borderColor: ChaliarColors.primaryColors,
                            controller: model.firt_name_recipient,
                          ),
                        ),
                        SizedBox(
                          height: 13.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                          child: InputField(
                            fieldSize: MediaQuery.of(context).size.height * 0.025,
                            label: "Nom du destinataire",
                            isBorder: true,
                            textLabelColor: ChaliarColors.secondaryColors,
                            maxlenght: 250,
                            backgroundColor: ChaliarColors.whiteGreyColor,
                            borderColor: ChaliarColors.primaryColors,
                            controller: model.name_recipient,
                          ),
                        ),
                        SizedBox(
                          height: 13.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                          child: InputField(
                            fieldSize: MediaQuery.of(context).size.height * 0.025,
                            label: "Numéro de déléphone du destinataire",
                            isBorder: true,
                            textLabelColor: ChaliarColors.secondaryColors,
                            maxlenght: 250,
                            backgroundColor: ChaliarColors.whiteGreyColor,
                            borderColor: ChaliarColors.primaryColors,
                            controller: model.recipient_phone_number,
                          ),
                        ),
                        SizedBox(
                          height: 13.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                          child: InputField(
                            fieldSize: MediaQuery.of(context).size.height * 0.025,
                            label: "Email du destinataire",
                            isBorder: true,
                            textLabelColor: ChaliarColors.secondaryColors,
                            maxlenght: 250,
                            backgroundColor: ChaliarColors.whiteGreyColor,
                            borderColor: ChaliarColors.primaryColors,
                            controller: model.recipient_email,
                          ),
                        ),
                        SizedBox(
                          height: 13.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                          child: InputField(
                            fieldSize: MediaQuery.of(context).size.height * 0.025,
                            label: "Société à livrer",
                            isBorder: true,
                            textLabelColor: ChaliarColors.secondaryColors,
                            maxlenght: 250,
                            backgroundColor: ChaliarColors.whiteGreyColor,
                            borderColor: ChaliarColors.primaryColors,
                            controller: model.recipient_group,
                          ),
                        ),
                        SizedBox(
                          height: 13.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                          child: InputField(
                            fieldSize: MediaQuery.of(context).size.height * 0.025,
                            label: "Notes personnelles",
                            isBorder: true,
                            textLabelColor: ChaliarColors.secondaryColors,
                            maxlenght: 250,
                            backgroundColor: ChaliarColors.whiteGreyColor,
                            borderColor: ChaliarColors.primaryColors,
                            controller: model.recipient_note,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(

                          ),
                          child: Center(
                            child: ButtonChaliar(
                                onTap: () {
                                  model.orderDeliveryInformation=widget.deliveryInformation;
                                  model.formEditingController(context);
                                 // Navigator.pushNamed(context, '/taille_colli');
                                },
                                buttonText: 'Valider',
                                height: MediaQuery.of(context).size.height * 0.07,
                                mediaQueryWidth: 0.30,
                                borderRaduis: 50,
                                backgroundcolor: ChaliarColors.primaryColors,
                                bordercolor: ChaliarColors.primaryColors,
                                textStyle: AppTextStyle.button(
                                    color: ChaliarColors.whiteColor)),
                          ),
                        ),
                        SizedBox(
                          height: 100.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 10.0,
            top: 30.0,
            child: CircleAvatar(
              radius: 5.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top:MediaQuery.of(context).size.height*0.92,
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
              title: "Commande",
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
    ),
      ),
      );
  }
}

