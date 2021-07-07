import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_color.dart';
import 'package:chaliar_delivery_app/ui/styles/text_style.dart';
import 'package:chaliar_delivery_app/ui/widgets/appBar.dart';
import 'package:chaliar_delivery_app/ui/widgets/custom_botom_navigation_bar.dart';
import 'package:chaliar_delivery_app/ui/widgets/custom_header.dart';


class AboutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: ChaliarMenu.topBar(title: 'À propos',bgColor: ChaliarColors.whiteColor,imageBackground: 'assets/images/header.png'),
      // bottomNavigationBar: CustomBottomNavigationBar(
      // ),
      body: Stack(
        children: [
          Container(
            color: ChaliarColors.whiteColor,
          ),
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
                  height: 110,
                ),
                Text('À propos de Chaliar',textAlign: TextAlign.center,
                    style: AppTextStyle.appBarHeader(
                      color: Color(0xff042C5C),
                      size: 18,
                      fontWeight: FontWeight.w400
                    )),
                SizedBox(
                  height: 20,
                ),
                Text.rich(
                  TextSpan(
                    text: "Lorem Ipsum is It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etcsometimes on purpose (injected humour and the likesimply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                    style: AppTextStyle.appBarHeader(
                        color: Color(0xff042C5C),
                        size: 13,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                  textAlign:TextAlign.justify,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top:MediaQuery.of(context).size.height*0.91,
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
              title: "À propos",
            ),
          ),
        ],
      ),
    );
  }
}
