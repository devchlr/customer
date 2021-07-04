import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/widgets/button.dart';

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
    return  Stack(
      children: [
        Container(
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
        Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.59,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: ChaliarColors.whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(MediaQuery.of(context).size.height * 0.04),
                  topRight: Radius.circular(MediaQuery.of(context).size.height * 0.04),
                ),
              ),
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height * 0.05,
                  right: MediaQuery.of(context).size.height * 0.05),
              child: ListView(
                padding: EdgeInsets.only(
                  top: 10,
                ),
                children: <Widget>[
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
                  SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: buildPageIndicator!,
                  ),
                  SizedBox(height: 28),
                  Center(
                    child: ButtonChaliar(
                        onTap: onTap,
                        buttonText: buttonText,
                        height: MediaQuery.of(context).size.height * 0.07,
                        mediaQueryWidth: 0.8,
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
            ),
          ),
      ],
    );
  }
}
