import 'package:chaliar_delivery_app/model_views/order/order_recapVM.dart';
import 'package:chaliar_delivery_app/models/adress.dart';
import 'package:chaliar_delivery_app/models/commande.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_color.dart';
import 'package:chaliar_delivery_app/ui/styles/text_style.dart';
import 'package:chaliar_delivery_app/ui/widgets/button.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';


class OrderRecaptScreen extends StatefulWidget {
  String? orderId;
  OrderRecaptScreen({Key? key,this.orderId}) : super(key: key);

  @override
  _OrderRecaptScreenState createState() => _OrderRecaptScreenState();
}

class _OrderRecaptScreenState extends State<OrderRecaptScreen> {
  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider<OrderRecaptVM>(
          create: (context) => OrderRecaptVM(),
          child: Consumer<OrderRecaptVM>(
              builder: (context, model, child) =>
          FutureBuilder<DocumentSnapshot>(
          future: model.getOrderInformation(widget.orderId!),
    builder: (context, snapshot){
    if(snapshot.connectionState!=ConnectionState.done){
        return Container(
          child: Center(
            child: CircularProgressIndicator(color: Colors.blue,),
          ),
        );
      }
    Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
    var order=Order.fromJson(data);
    var deliveryInformation=OrderDeliveryInformation.fromJson(order.deliveryInformation!);
    var packageInfornation=OrderPackageInformation.fromJson(order.packageInformation!);
    var recipientInformation=OrderRecipientInformation.fromJson(order.recipientInformation!);
    AdressLocalisation departAdress=deliveryInformation.departure_address!;
    AdressLocalisation arrivalAdress=recipientInformation.arrival_address!;
    String month=DateFormat('dd-MMMM-yyyy').format(deliveryInformation.delivery_date!);
    String hour=DateFormat('kk:mm').format(deliveryInformation.delivery_schedule!);
     return Scaffold(
      appBar: AppBar(
        leading: Text(''),
        backgroundColor: Color(0xffC5385A),
        title: Text('Mission acceptée !',
        style: AppTextStyle.appBarHeader(
          color: Colors.white,
          size: 18,
          fontWeight: FontWeight.bold
        ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xffDE335C),
      body:  Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 53,
            ),
            Center(
              child: Text(
                '${month} à ${hour}',
                style: AppTextStyle.appBarHeader(
                    size: 21.8,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Text(
              'DÉPART',
              style: AppTextStyle.appBarHeader(
                  size: 21.8,
                  color: Color(0xffA31335),
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Container(
              width: 100,
              child: Text(
                '${departAdress.description}',
                style: AppTextStyle.appBarHeader(
                    size: 15,
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.w400
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Text(
              'ARRIVÉE',
              style: AppTextStyle.appBarHeader(
                  size: 21.8,
                  color: Color(0xffA31335),
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Container(
              width: 100,
              child: Text(
                '${arrivalAdress.description}',
                style: AppTextStyle.appBarHeader(
                    size: 15,
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.w400
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Text(
              'TARIF',
              style: AppTextStyle.appBarHeader(
                  size: 21.8,
                  color: Color(0xffA31335),
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Container(
              width: 100,
              child: Text(
                '${order.order_price!.toStringAsFixed(3)}€ TTC',
                style: AppTextStyle.appBarHeader(
                    size: 15,
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.w400
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              elevation: 1,
              child: Container(
                color: Color(0xffffffff),
                height: 217,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(
                ),
                margin: EdgeInsets.only(
                    left: 20,
                    right: 20
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 21,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: (){
                            model.cancelOrder(context, widget.orderId!);
                          },
                          child: Container(
                            height: 28,
                            width: 145,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Color(0xff222B45),width: 1.0),
                            ),
                            child: Center(
                              child: Text('ANNULER LA COURSE',style: AppTextStyle.appBarHeader(
                                  color: Colors.black,
                                  size: 10.75,
                                  fontWeight: FontWeight.w400
                              ),),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 41,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('LIVRER: ${packageInfornation.package_nature}',style: AppTextStyle.appBarHeader(
                            color: Color(0xff222B45),
                            size: 16.8,
                            fontWeight: FontWeight.w400
                        ),),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 2,
                      color: ChaliarColors.whiteGreyColor,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: ButtonChaliar(
                              onTap: () {
                                model.getLiveTrackingOrder(context, widget.orderId!);
                              },
                              buttonText: 'DÉMARRER LA COURSE',
                              height:43,
                              mediaQueryWidth: 0.35,
                              borderRaduis: 10,
                              backgroundcolor: Color(0xffDE335C),
                              bordercolor:  Color(0xffDE335C),
                              textStyle: AppTextStyle.appBarHeader(
                                  fontWeight: FontWeight.w400,
                                  size: 12.64,
                                  color: ChaliarColors.whiteColor)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );}
    ),),);
  }
}
