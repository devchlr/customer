import 'package:chaliar_delivery_app/constants/iconList.dart';
import 'package:chaliar_delivery_app/models/adress.dart';
import 'package:chaliar_delivery_app/models/commande.dart';
import 'package:chaliar_delivery_app/models/user.dart';
import 'package:chaliar_delivery_app/services/fire_store_service.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_color.dart';
import 'package:chaliar_delivery_app/ui/styles/text_style.dart';
import 'package:chaliar_delivery_app/ui/widgets/button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class OrderResumeWidgetCard extends StatefulWidget {
  final Order?order;
  final  void Function()? onTap;
  OrderResumeWidgetCard({Key? key,this.order,this.onTap}) : super(key: key);
  @override
  _OrderResumeWidgetCardState createState() => _OrderResumeWidgetCardState();
}

class _OrderResumeWidgetCardState extends State<OrderResumeWidgetCard> {
  @override
  Widget build(BuildContext context) {
    FirestoreService firestoreService = FirestoreService();
    Order order=widget.order!;
    OrderDeliveryInformation deliveryInformation = OrderDeliveryInformation.fromJson(order.deliveryInformation!);
    OrderRecipientInformation recipientInformation=OrderRecipientInformation.fromJson(order.recipientInformation!);
    OrderPackageInformation packageInformation=OrderPackageInformation.fromJson(order.packageInformation!);
    AdressLocalisation departAdress=deliveryInformation.departure_address!;
    AdressLocalisation arrivalAdress=recipientInformation.arrival_address!;
    bool isClose=false;
    void onClose(){
      setState(() {
        isClose=true;
      });
    }
    String month=DateFormat('dd-MMMM-yyyy').format(deliveryInformation.delivery_date!);
    String hour=DateFormat('kk:mm').format(deliveryInformation.delivery_schedule!);
    return
      FutureBuilder(
        future:firestoreService.getUserFuture(order.user_id!) ,
          builder:(context,AsyncSnapshot<DocumentSnapshot>snapshot){
        if(snapshot.connectionState!=ConnectionState.done){
          return CircularProgressIndicator();
        }
        Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
        var user=UserChaliar.fromData(data);
        return Container(
          height: 500,
          child:
          SingleChildScrollView(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: isClose?Container() :
                  Container(
                    margin: EdgeInsets.only(
                        top: 20
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      elevation: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffffffff),
                        ),
                        height: 406,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                            left: 5,
                            right: 5
                        ),
                        margin: EdgeInsets.only(
                        ),
                        child: SingleChildScrollView(
                          child: Column( children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('${month}  à ${hour}',style: AppTextStyle.appBarHeader(
                                    color: Color(0xff222B45),
                                    size: 16.8,
                                    fontWeight: FontWeight.w400
                                ),),
                              ],
                            ),
                            SizedBox(
                                height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 10,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        image: DecorationImage(
                                          image: AssetImage("assets/images/timeLine.png"),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 0,
                                    ),
                                    Container(
                                      height: 100,
                                      child:
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text('${departAdress.description}',textAlign: TextAlign.center,style: AppTextStyle.appBarHeader(
                                                color: Color(0xff042C5C),
                                                size: 9.64,
                                                fontWeight: FontWeight.w400
                                            ),),
                                            SizedBox(
                                              height: 55,
                                            ),
                                            Text('${arrivalAdress.description}',textAlign: TextAlign.center,style: AppTextStyle.appBarHeader(
                                                color: Color(0xff042C5C),
                                                size: 8.64,
                                                fontWeight: FontWeight.w400
                                            ),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 2,
                              width: MediaQuery.of(context).size.width,
                              color: ChaliarColors.whiteGreyColor,
                            ),
                            Container(
                              height: 95,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 52,
                                        width: 52,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage("${user.profile_url.toString()}"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text('${user.surname}',style: AppTextStyle.appBarHeader(
                                            color: Color(0xff222B45),
                                            size: 10.8,
                                            fontWeight: FontWeight.w400,
                                          ),),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(
                                                SvgIcons.start,
                                                height: 13,
                                                width: 12,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text('4,8',style: AppTextStyle.appBarHeader(
                                                color: Color(0xff222B45),
                                                size: 7.92,
                                                fontWeight: FontWeight.w400,
                                              ),),
                                              SizedBox(
                                                width: 15,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text('${packageInformation.package_nature}',style: AppTextStyle.appBarHeader(
                                        color: Color(0xff042C5C),
                                        size: 13.64,
                                        fontWeight: FontWeight.w400,
                                      ),),
                                      Text('${order.order_price!.toStringAsFixed(3)}\n€',textAlign:TextAlign.center,style: AppTextStyle.appBarHeader(
                                        color: Color(0xff222B45),
                                        size: 16.8,
                                        fontWeight: FontWeight.w400,
                                      ),),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 2,
                              color: ChaliarColors.whiteGreyColor,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Center(
                                  child: ButtonChaliar(
                                      onTap: widget.onTap,
                                      buttonText: 'ACCEPTER',
                                      height:49,
                                      mediaQueryWidth: 0.18,
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
                                        onClose();
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
                              height: 20,
                            ),
                          ],
                          ),),
                      ),
                    ),
                  ),
                ),
                isClose?Container() :
                Padding(
                    padding: EdgeInsets.only(
                      top:MediaQuery.of(context).size.height * 0,
                      left:MediaQuery.of(context).size.width * 0.62,
                      right:MediaQuery.of(context).size.width * 0,
                    ),
                    child:GestureDetector(
                      onTap:(){
                        onClose();
                      },
                      child: CircleAvatar(
                        radius: 25.0,
                        backgroundColor: ChaliarColors.whiteColor,
                        child: Icon(Icons.close_outlined,color: ChaliarColors.primaryColors,),
                      ),
                    )
                ),
              ],
            ),
          ),
        );
      });

    //   Stack(
    //   children: [
    //     SingleChildScrollView(
    //       child: Column(
    //         children: [
    //           isClose?Container() :
    //
    //           isClose?Container() :Padding(
    //               padding: EdgeInsets.only(
    //                 top:MediaQuery.of(context).size.height * 0.43,
    //                 left:MediaQuery.of(context).size.width * 0.8,
    //                 right:MediaQuery.of(context).size.width * 0,
    //               ),
    //               child:GestureDetector(
    //                 onTap:(){
    //                   print('circle clicked');
    //                   setState(() {
    //                     isClose=true;
    //                   });
    //                 },
    //                 child: CircleAvatar(
    //                   radius: 25.0,
    //                   backgroundColor: ChaliarColors.whiteColor,
    //                   child: Icon(Icons.close_outlined,color: ChaliarColors.primaryColors,),
    //                 ),
    //               )
    //           ),
    //         ],
    //       ),
    //     )
    //   ],
    // );
  }
}

