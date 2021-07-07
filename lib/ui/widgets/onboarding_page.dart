import 'package:flutter/cupertino.dart';
import 'package:chaliar_delivery_app/ui/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_color.dart';
import 'package:chaliar_delivery_app/ui/widgets/button.dart';

class OnboardingPageWidget extends StatelessWidget {
  final String? imageAsset;
  final String? title;
  final String? subTitle;
  final String? buttonText;
  final List<Widget>? buildPageIndicator;
  final VoidCallback? onTap;
  OnboardingPageWidget(
      {this.imageAsset,
        this.title,
        this.subTitle,
        this.buttonText,
        this.buildPageIndicator,
        this.onTap});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:  Stack(
        children: [
          Container(
            height: 700,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
              left:MediaQuery.of(context).size.width * 0.1,
            ),
            decoration:BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageAsset!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: ChaliarColors.whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(MediaQuery.of(context).size.height * 0.04),
                topRight: Radius.circular(MediaQuery.of(context).size.height * 0.04),
              ),
            ),
            margin: EdgeInsets.only(
              top:  MediaQuery.of(context).size.height * 0.58,
            ),
            child:
            Column(
              children: <Widget>[
                SizedBox(height:17),
                Center(
                    child: Text(
                      title!,
                      textAlign: TextAlign.center,
                      style:
                      AppTextStyle.tutorialHeader(color: Color(0xff042C5C)),
                    )),
                SizedBox(height:17),
                Center(
                  child: Text(subTitle!,
                      textAlign: TextAlign.center,
                      style:
                      AppTextStyle.tutorialDescription(color: Color(0xff77869E))),
                ),
                SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: buildPageIndicator!,
                ),
                SizedBox(height: 18),
                Center(
                  child: ButtonChaliar(
                      onTap: onTap,
                      buttonText: buttonText,
                      height: 48,
                      mediaQueryWidth: 0.37,
                      borderRaduis: 50,
                      backgroundcolor: ChaliarColors.whiteColor,
                      bordercolor: ChaliarColors.primaryColors,
                      textStyle: AppTextStyle.button(
                          color: ChaliarColors.primaryColors)),
                ),
                SizedBox(
                  height: 26,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
