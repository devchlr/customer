import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter_app/ui/widgets/button.dart';
import 'package:signature/signature.dart';


class SignatureOrderScreen extends StatefulWidget {
  const SignatureOrderScreen({Key? key}) : super(key: key);
  @override
  _SignatureOrderScreenState createState() => _SignatureOrderScreenState();
}
class _SignatureOrderScreenState extends State<SignatureOrderScreen> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 1,
    penColor: Color(0xff042C5C),
    exportBackgroundColor: Colors.white,
    onDrawStart: () => print('onDrawStart called!'),
    onDrawEnd: () => print('onDrawEnd called!'),
  );
  @override
  void initState() {
    super.initState();
    _controller.addListener(() => print('Value changed'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff38A8D6),
        backwardsCompatibility: false,
        title: Text('ARRIVÉ À DESTINATION',
        style: AppTextStyle.appBarHeader(
          color: Colors.white,
          size: 18,
          fontWeight: FontWeight.bold
        ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            color: Color(0xff34B3E8),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width*0.1,
              left: MediaQuery.of(context).size.width*0.05,
              right:  MediaQuery.of(context).size.width*0.05,
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.08),
              ),
              elevation: 2,
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 150,
                    child:  Center(
                      child: Text(
                        'SIGNNATURE DU CLIENT\n POUR TERMINER LA MISSION',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.appBarHeader(
                        size: 17.64,
                        color: Color(0xffDE335C),
                        fontWeight: FontWeight.w400
                      ),
                      ),
                    ),
                  ),
                  //SIGNATURE CANVAS
                  Signature(
                    controller: _controller,
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    backgroundColor: Colors.white,
                  ),
                  //OK AND CLEAR BUTTONS
                  Container(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: ButtonChaliar(
                              onTap: () {
                                setState(() => _controller.clear());
                              },
                              buttonText: 'EFFACER',
                              height:49,
                              mediaQueryWidth: 0.15,
                              borderRaduis: 10,
                              backgroundcolor: Color(0xffffffff),
                              bordercolor:  Color(0xff042C5C),
                              textStyle: AppTextStyle.appBarHeader(
                                  size: 8.64,
                                  color: Color(0xff042C5C))),
                        ),
                        Center(
                          child: ButtonChaliar(
                              onTap: () async{
                                if (_controller.isNotEmpty) {
                                  final Uint8List? data =
                                      await _controller.toPngBytes();
                                  if (data != null) {
                                    await Navigator.of(context).push(
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) {
                                          return Scaffold(
                                            appBar: AppBar(),
                                            body: Center(
                                              child: Container(
                                                color: Colors.grey[300],
                                                child: Image.memory(data),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  }
                                }
                              },
                              buttonText: 'TERMINER LA MISSION',
                              height:49,
                              mediaQueryWidth: 0.25,
                              borderRaduis: 10,
                              backgroundcolor: Color(0xffDE335C),
                              bordercolor:  Color(0xffDE335C),
                              textStyle: AppTextStyle.appBarHeader(
                                  size: 8.64,
                                  color: ChaliarColors.whiteColor)),
                        ),
                      ],
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   mainAxisSize: MainAxisSize.max,
                    //   children: <Widget>[
                    //     //SHOW EXPORTED IMAGE IN NEW ROUTE
                    //     IconButton(
                    //       icon: const Icon(Icons.check),
                    //       color: Colors.blue,
                    //       onPressed: () async {
                    //         if (_controller.isNotEmpty) {
                    //           final Uint8List? data =
                    //           await _controller.toPngBytes();
                    //           if (data != null) {
                    //             await Navigator.of(context).push(
                    //               MaterialPageRoute<void>(
                    //                 builder: (BuildContext context) {
                    //                   return Scaffold(
                    //                     appBar: AppBar(),
                    //                     body: Center(
                    //                       child: Container(
                    //                         color: Colors.grey[300],
                    //                         child: Image.memory(data),
                    //                       ),
                    //                     ),
                    //                   );
                    //                 },
                    //               ),
                    //             );
                    //           }
                    //         }
                    //       },
                    //     ),
                    //     //CLEAR CANVAS
                    //     IconButton(
                    //       icon: const Icon(Icons.clear),
                    //       color: Colors.blue,
                    //       onPressed: () {
                    //         setState(() => _controller.clear());
                    //       },
                    //     ),
                    //   ],
                    // ),
                  ),
                  SizedBox(
                    height: 80.9,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/faq');
                      },
                      child: Text('PROBLÈME DE LIVRAISON',
                        style: AppTextStyle.appBarHeader(
                          color: Color(0xff042C5C),
                          size: 10.64,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 62,
                  ),
                ],
              ),
            ),
          ),

        ],
      )

    );
  }
}
