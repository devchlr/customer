import 'package:flutter/material.dart';
import 'package:flutter_app/constants/iconList.dart';
import 'package:flutter_app/ui/views/profile/annexe/payment_form/visa_form.dart';
import 'package:flutter_app/ui/widgets/appBar.dart';
import 'package:flutter_app/ui/widgets/custom_header.dart';
import 'package:flutter_app/ui/widgets/svg_button.dart';

class AddPaymentMethodScreen extends StatefulWidget {
  const AddPaymentMethodScreen({Key? key}) : super(key: key);

  @override
  _AddPaymentMethodScreenState createState() => _AddPaymentMethodScreenState();
}

class _AddPaymentMethodScreenState extends State<AddPaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: ChaliarMenu.topBar(
      //     leading: GestureDetector(
      //       onTap: (){
      //         Navigator.pop(context);
      //       },
      //       child: Icon(Icons.arrow_back_ios,color: Color(0xffF3F3F3),),
      //     ),
      //     description: '',
      //     title: 'Méthode de paiement',
      //     bgColor: Color(0xffd8d8d8),
      //     imageBackground: 'assets/images/header.png'
      // ),
      backgroundColor: Color(0xffF3F3F3),
      body: Stack(
        children: [
          Container(
            color: Color(0xffF3F3F3),
          ),
          Padding(padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width*0.05,
            right: MediaQuery.of(context).size.width*0.05,
          ),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width*0.3,),
                SizedBox(height: 61,),
               Center(
                 child: Image.asset('assets/images/methodpayement_method.png'),
               ),
                Expanded(child:VisaPaymentForm(),)
              ],
            ),
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
