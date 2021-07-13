import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_color.dart';
import 'package:chaliar_delivery_app/ui/styles/text_style.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class LoadingForm extends StatefulWidget {
  final Color? bgColor;
  const LoadingForm({Key? key,this.bgColor}) : super(key: key);

  @override
  _LoadingFormState createState() => _LoadingFormState();
}

class _LoadingFormState extends State<LoadingForm> {
  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      color: widget.bgColor??Colors.blueAccent,
      size: 50.0,
    );
  }
}
