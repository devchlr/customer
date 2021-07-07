import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/constants/iconList.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_color.dart';
import 'package:chaliar_delivery_app/ui/styles/text_style.dart';
import 'package:chaliar_delivery_app/ui/widgets/custom_header.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeMessageScreen extends StatefulWidget {
  const HomeMessageScreen({Key? key}) : super(key: key);

  @override
  _HomeMessageScreenState createState() => _HomeMessageScreenState();
}

class _HomeMessageScreenState extends State<HomeMessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
          height: 65,
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width*0.05,
            right:MediaQuery.of(context).size.width*0.05,
            bottom: 20,
          ),
          child:TextField(
            decoration: InputDecoration(
              filled: true,
              hintText: 'Écrire un message',
              hintStyle: AppTextStyle.appBarHeader(
                  color: Color(0xff6B6F74),
                  size: 9,
                  fontWeight: FontWeight.w400
              ),
              fillColor: Color(0x453885da),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                      color: Color(0x723885da), width: 0.01, style: BorderStyle.solid)),
              contentPadding:EdgeInsets.only(left: 20,
                  bottom: MediaQuery.of(context).size.height*0.03,
                  top: MediaQuery.of(context).size.height*0.03,
                  right: 20),
              suffixIcon: IconButton(onPressed: (){}, icon:SvgPicture.asset(
                SvgIcons.paper_plane,
                height: 20,
                width: 20,
                color: ChaliarColors.primaryColors,
              ),
              ),
            ),
          )
      ),
        body:
        Stack(
          children: [
            SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          height: 110,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: ()=>launch("tel://+33 84 808 808"),
                              child: Text('APPELER',style: AppTextStyle.appBarHeader(
                                  color: Color(0xff042C5C),
                                  size: 8.64,
                                  fontWeight: FontWeight.w400
                              ),),
                            ),

                            SizedBox(
                              width: MediaQuery.of(context).size.width*0.05,
                            ),
                          ],
                        ),
                        Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 55,
                            backgroundImage: AssetImage('assets/images/home_message_profil.png'),
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Center(
                          child: Text('Guzman B',style: AppTextStyle.appBarHeader(
                              size: 12,
                              color: Color(0xff042C5C),
                              fontWeight: FontWeight.w400
                          ),),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 335,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              width: 192,
                              height: 42,
                              decoration: BoxDecoration(
                                  color: ChaliarColors.primaryColors,
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              child: Center(
                                child:Text('Bonjour je suis la!',style: AppTextStyle.appBarHeader(
                                  color: Color(0xffffffff),

                                ),),
                              )

                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.05,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.05,
                          ),
                          Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 20,
                              backgroundImage: AssetImage('assets/images/home_message_chaliar.png'),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                              width: 192,
                              height: 42,
                              decoration: BoxDecoration(
                                  color: Color(0xff4D4D4D),
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              child: Center(
                                child:Text('Ok j’arrive !',style: AppTextStyle.appBarHeader(
                                  color: Color(0xffffffff),

                                ),),
                              )
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 0
              ),
              child: CustomHearder(
                title: "MESSAGERIE",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height*0.08,
                  left: MediaQuery.of(context).size.width*0.02
              ),
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios,color: Colors.white,),
              ),
            ),
          ],
        )
    );
  }
}
