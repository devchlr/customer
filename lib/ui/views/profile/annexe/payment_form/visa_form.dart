import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/constants/iconList.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_color.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_font.dart';
import 'package:chaliar_delivery_app/ui/styles/text_style.dart';
import 'package:chaliar_delivery_app/ui/widgets/button.dart';
import 'package:chaliar_delivery_app/ui/widgets/custom_textField_card.dart';
import 'package:chaliar_delivery_app/ui/widgets/svg_button.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class VisaPaymentForm extends StatefulWidget {
  const VisaPaymentForm({Key? key}) : super(key: key);

  @override
  _VisaPaymentFormState createState() => _VisaPaymentFormState();
}

class _VisaPaymentFormState extends State<VisaPaymentForm> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            'AJOUTER UN MOYEN DE PAIEMENT',
            style: AppTextStyle.appBarHeader(
                fontWeight: FontWeight.w400,
                size: 14,
                color: Color(0xff042C5C)
            ),
          ),
        ),
        SizedBox(
          height: 54,
        ),
        CustomTextFieldCard(
          leading: SvgIconButton(
            iconAsset: SvgIcons.icon_card_banck,
            iconSize: 13,
          ),
          trailing: SvgIconButton(
            iconAsset: SvgIcons.pencil,
            iconSize: 22,
          ),
          placeholderStyle:  AppTextStyle.appBarHeader(
              size: 13,
              color: Color(0xffCED2F5),
              fontWeight: FontWeight.w400
          ),
          placeholder: "Numéro de carte bleue",
        ),
        CustomTextFieldCard(
          leading: SvgIconButton(
            iconAsset: SvgIcons.calendar,
            iconSize: 20,
          ),
          trailing: SvgIconButton(
            iconAsset: SvgIcons.pencil,
            iconSize: 22,
          ),
          keyboardType: TextInputType.datetime,
          placeholderStyle:  AppTextStyle.appBarHeader(
              size: 13,
              color: Color(0xffCED2F5),
              fontWeight: FontWeight.w400
          ),
          placeholder: "date",
        ),
        CustomTextFieldCard(
          leading: SvgIconButton(
            iconAsset: SvgIcons.icon_crypto,
            iconSize: 13,
          ),
          trailing: SvgIconButton(
            iconAsset: SvgIcons.pencil,
            iconSize: 22,
          ),
          keyboardType: TextInputType.number,
          placeholderStyle:  AppTextStyle.appBarHeader(
              size: 13,
              color: Color(0xffCED2F5),
              fontWeight: FontWeight.w400
          ),
          placeholder: "CV",
        ),
        SizedBox(
          height: 54,
        ),
        Center(
          child: ButtonChaliar(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.transparent,
                    elevation: 50,
                    content:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('waiting...',style: AppTextStyle.appBarHeader(
                          color: ChaliarColors.whiteColor,
                        ),),
                        SpinKitCubeGrid(
                          color: Colors.blueAccent,
                          size: 50.0,
                        )
                      ],
                    ),
                  ),
                );
                // model.formEditingController(context);
                // Navigator.pushNamed(context, '/commande_arrivee_form');
              },
              buttonText: 'Ajouter ma carte',
              height: 42,
              mediaQueryWidth: 0.25,
              borderRaduis: 50,
              backgroundcolor: ChaliarColors.primaryColors,
              bordercolor: ChaliarColors.primaryColors,
              textStyle: AppTextStyle.appBarHeader(
                  size: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppFontFamilly.montserrat,
                  color: ChaliarColors.whiteColor)),
        )

      ],
    );
  }
}