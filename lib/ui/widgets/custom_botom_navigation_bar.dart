import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/constants/iconList.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Color? bgColor;
 CustomBottomNavigationBar({Key? key,this.bgColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87,
      decoration: BoxDecoration(
        color: bgColor==null?Color(0xffffffff):bgColor,
        image: DecorationImage(
          image: AssetImage("assets/images/menuFooter.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(

        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap:(){
                Navigator.pushNamed(context, '/home_profile');
              },
              child: Center(
                child: SvgPicture.asset(
                  SvgIcons.chaliar,
                  height: 21,
                  width: 22,
                  color: Colors.grey,
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/pre_commande');
              },
              child: Center(
                child: SvgPicture.asset(
                  SvgIcons.commande,
                  height: 51,
                  width: 51,
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/home_course');
              },
              child: Center(
                child: SvgPicture.asset(
                  SvgIcons.scooter,
                  height: 23,
                  width: 28,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
