import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_color.dart';
import 'package:chaliar_delivery_app/ui/styles/text_style.dart';
import 'package:chaliar_delivery_app/ui/widgets/button.dart';


class OrderRecaptScreen extends StatefulWidget {
  const OrderRecaptScreen({Key? key}) : super(key: key);

  @override
  _OrderRecaptScreenState createState() => _OrderRecaptScreenState();
}

class _OrderRecaptScreenState extends State<OrderRecaptScreen> {
  @override
  Widget build(BuildContext context) {
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
      body: Stack(
        children: [
          Container(
            color: Color(0xffDE335C),
          ),
          Container(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width*0.05,
                right: MediaQuery.of(context).size.width*0.05
            ),
            child: ListView(
              children: [
                SizedBox(
                  height: 53,
                ),
                Text(
                  '29 Janvier 2021 à 16:00',
                  style: AppTextStyle.appBarHeader(
                    size: 21.8,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
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
                    '38 Avenue du Château, \n94300 Vincennes',
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
                    '38 Avenue du Château, \n94300 Vincennes',
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
                    '89€ TTC',
                    style: AppTextStyle.appBarHeader(
                        size: 15,
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.w400
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.6,
            ),
            child: Card(
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
                child: ListView(
                  children: [
                    SizedBox(
                      height: 21,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: (){},
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
                        Text('LIVRER: UN CANAPÉ',style: AppTextStyle.appBarHeader(
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
                                Navigator.pushNamed(context, '/order_live_tracking');
                              },
                              buttonText: 'DÉMARRER LA COURSE',
                              height:43,
                              mediaQueryWidth: 0.4,
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
            ),
          ),
        ],
      ),
    );
  }
}
