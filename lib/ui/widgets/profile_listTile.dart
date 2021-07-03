import 'package:flutter/material.dart';
import 'package:flutter_app/ui/styles/chaliar_font.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter_app/ui/widgets/svg_button.dart';
class CustomProfileListTile extends StatelessWidget {
  final String? title;
  final String? iconAsset;
  final void Function()? onTap;


  const CustomProfileListTile({Key? key,this.title,this.onTap,this.iconAsset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 1,
          child: ListTile(
            leading: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Color(0xffDFE7F5),
                borderRadius: BorderRadius.all(Radius.circular(5)
                ),
              ),
              child: Center(
                child: GestureDetector(
                  onTap: onTap,
                  child: SvgIconButton(
                    iconSize: 25,
                    iconAsset: iconAsset,
                  ),
                ),
              ),
            ),
            title: Text(
              title!,
              style: AppTextStyle.appBarHeader(
                  color: Color(0xff042C5C),
                  size: 14,
                  fontFamily: AppFontFamilly.montserrat,
                  fontWeight: FontWeight.w400
              ),
            ),
            trailing: GestureDetector(
              onTap: onTap,
              child: Icon(Icons.arrow_forward_ios_outlined,color: Color(0xffDFE7F5),),
            ),
          ),
        ),
      );
  }
}
