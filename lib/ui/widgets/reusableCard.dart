import 'package:flutter_app/constants/iconList.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.group,this.size,
   this.assetColour, @required this.title,@required this.price,@required this.description, @required this.colour,@required this.inconAsset, this.onPress,@required this.bgColour});

  final Color? colour;
  final Color? bgColour;
  final Color? assetColour;
  final String? inconAsset;
  final String? title;
  final String? description;
  final String? price;
  final String? group;
  final String? size;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 138.0,
        height: 200,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(title!,style: AppTextStyle.cardTailleHeader(color:colour!),),
            SizedBox(
              height: 5,
            ),
            Text('$price\€',style: AppTextStyle.cardTaillePrice(color:colour!),),
            SizedBox(
              height: 10,
            ),
            Center(
              child: SvgPicture.asset(
                inconAsset!,
                height: 37,
                width: 61,
                color: group==size?Colors.white:Color(0xffD8D8D8),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                description!,
                textAlign: TextAlign.center,
                style: AppTextStyle.cardTailleDescription(color: colour!),
              ),
            )
          ],
        ),
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: bgColour,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: ChaliarColors.primaryColors,width: 0.5)
        ),
      ),
    );
  }
}