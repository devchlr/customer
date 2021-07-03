import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter/material.dart';

class CustomRadioListTile extends StatelessWidget {
  final Color? radioColor;
  final double? width;
  final double? heigth;
  final double? raduis;
  final String? title;
  final String? subtile;
  final String? value;
  final String? group;
  final void Function()?  onClick;
  int? selectedRadio;
  final void Function(String?)? onChanged;
  CustomRadioListTile(
      {this.radioColor,
      this.width,
      this.heigth,
      this.raduis,
      this.title,
      this.subtile,
      this.group,
      this.value,
      this.onChanged,
        this.onClick
      });
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: ChaliarColors.secondaryColors,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(raduis!),
      ),
      elevation: 2,
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          // width: MediaQuery.of(context).size.width * width,
          height:74,
          decoration: BoxDecoration(
              border: Border.all(
                  color: group == value
                      ? ChaliarColors.secondaryColors
                      : ChaliarColors.whiteGreyColor)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text(
                  title!,
                  style: AppTextStyle.header4(color: Color(0xff2F3547)),
                ),
                subtitle: Text(
                  subtile!,
                  style: AppTextStyle.caption(color: Color(0xff98A2C0)),
                ),
                trailing: value==group?new GestureDetector(
                  onTap: onClick,
                  child: CircleAvatar(
                    child: Icon(Icons.check,color: Colors.white,),
                    radius: 15.0,
                    backgroundColor: Color(0xff042C5C),
                  ),
                ):new GestureDetector(
                  onTap: onClick,
                  child: CircleAvatar(
                    radius: 10.0,
                    backgroundColor: Color(0xffD4DAF4),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
