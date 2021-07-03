import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter_app/ui/widgets/appBar.dart';
import 'package:flutter_app/ui/widgets/custom_header.dart';


class TermConditionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('conditionnal_term').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasError){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(snapshot.data==null){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
          // appBar: ChaliarMenu.topBar(title: 'Condition générale',bgColor: ChaliarColors.whiteColor,imageBackground: 'assets/images/header.png'),
          body: Stack(
          children: [
            Card(
            elevation: 0,
            margin: EdgeInsets.only(
            left: 20,
            right: 20
            ),
              child: ListView(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.15,
                ),
                Text('Conditions générales',textAlign: TextAlign.center,style: AppTextStyle.headerApp1(color: ChaliarColors.blackColor,)),
                SizedBox(
                  height: 20,
                ),
                Text.rich(
                  TextSpan(
                    text: snapshot.data!.docs.first.get('description'),
                    style: AppTextStyle.bodyApp1(color: ChaliarColors.blackColor),
                  ),
                  textAlign:TextAlign.justify,
                )
              ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 0
              ),
              child: CustomHearder(
                title: "Condition générale",
              ),
            ),
          ],
          ),
            );
          });

  }
}
