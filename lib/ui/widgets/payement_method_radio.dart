import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/constants/iconList.dart';
import 'package:chaliar_delivery_app/ui/styles/text_style.dart';
import 'package:chaliar_delivery_app/ui/widgets/svg_button.dart';
class CustomRadioCardCheckBox extends StatelessWidget {
  final String? group;
  final String? value;
  final String? cardNumber;
  final void Function()? onTap;

  const CustomRadioCardCheckBox({Key? key,this.cardNumber,this.group,this.value,this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      title: GestureDetector(
        onTap: onTap,
        child: Card(
          child: Container(
            padding: EdgeInsets.only(
                top: 20,
                left: 10
            ),
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[SvgIconButton(
                iconSize: 15,
                iconAsset: SvgIcons.white_visa,
              ),SizedBox(width: 10,),
                Text('…',style: AppTextStyle.appBarHeader(
                    color: Color(0xff34B3E8),
                    size: 10.8
                ),),
                SizedBox(width: 5,),
                Text(cardNumber??'9946',style: AppTextStyle.appBarHeader(
                    color: Color(0xff34B3E8),
                    size: 10.8
                ),)
              ] ,
            ),
          ),
        ),
      ),
      trailing: GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          radius: 15,
          backgroundImage: AssetImage('assets/images/add_photo_profile.png'),
          backgroundColor: Colors.transparent,
          child: value==group?CircleAvatar(
            radius: 5,
            backgroundColor: Color(0xff042C5C),
          ):null,
        ),
      ),
    );
  }
}
