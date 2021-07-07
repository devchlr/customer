import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/ui/styles/text_style.dart';

class CustomTabBar extends StatelessWidget {
  final String? title;
  const CustomTabBar({Key? key,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(

        icon: Container(
            height: 32,
            width: 93,
            child: Center(
                child:Text(
                  title!,
                  style: AppTextStyle.appBarHeader(
                      color: Color(0xff042C5C),
                      size: 11,
                      fontWeight: FontWeight.w400
                  ),
                )
            ),
          ),
        );
  }
}
