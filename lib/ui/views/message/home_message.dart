import 'package:chaliar_delivery_app/ui/styles/chaliar_font.dart';
import 'package:chaliar_delivery_app/ui/widgets/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/constants/iconList.dart';
import 'package:chaliar_delivery_app/model_views/message/home_messageVM.dart';
import 'package:chaliar_delivery_app/models/message.dart';
import 'package:chaliar_delivery_app/models/user.dart';
import 'package:chaliar_delivery_app/ui/styles/chaliar_color.dart';
import 'package:chaliar_delivery_app/ui/styles/text_style.dart';
import 'package:chaliar_delivery_app/ui/widgets/custom_header.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeMessageScreen extends StatefulWidget {
  final String?userId;
  final String?orderId;
  final String?senderId;
  HomeMessageScreen({Key? key,this.userId,this.orderId,this.senderId}) : super(key: key);

  @override
  _HomeMessageScreenState createState() => _HomeMessageScreenState();
}

class _HomeMessageScreenState extends State<HomeMessageScreen> {

  @override
  Widget build(BuildContext context) {
    var orderId=widget.orderId;
    return ChangeNotifierProvider<HomeMessageMV>(
        create: (context) => HomeMessageMV(),
        child: Consumer<HomeMessageMV>(
            builder: (context, model, child) =>
            StreamBuilder<DocumentSnapshot>(
              stream: model.getOrderMessage(orderId!),
                builder: (context,orderSnapshot){
                return
    FutureBuilder(
    future:model.getUserD(),
    builder: (context,AsyncSnapshot<DocumentSnapshot>snapshot){
    if(snapshot.connectionState!=ConnectionState.done){
    return Container(
    child: Center(
    child: CircularProgressIndicator(),
    ),
    );
    }
    Map<String, dynamic> messageData = orderSnapshot.data!.data() as Map<String, dynamic>;
    Map<String, dynamic> userData = snapshot.data!.data() as Map<String, dynamic>;
    var user=UserChaliar.fromData(userData);
    print(user.surname);
    List<Message>listMessage=[];
    messageData.forEach((key, value) {
      listMessage.add(Message.fromJson(value));
    });

    listMessage.sort((a,b){
      return a.createdAt!.compareTo(b.createdAt!);
    });

    List<Widget>listMessagBuild=[];
    listMessage.forEach((element) {
    if( element.idUser!=null){

      if(element.idUser==user.id){
        listMessagBuild.add(
          Padding(
            padding: EdgeInsets.only(
                bottom: 20
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    width: 192,
                    height: 42,
                    margin: EdgeInsets.only(
                      bottom: 35,
                    ),
                    decoration: BoxDecoration(
                        color: ChaliarColors.primaryColors,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Center(
                      child:Text('${element.message}',style: AppTextStyle.appBarHeader(
                        color: Color(0xffffffff),
                      ),),
                    )

                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.05,
                )
              ],
            ),
          ),
        );
      }else{
        String userName=element.username!;
        listMessagBuild.add(
            Padding(
                padding: EdgeInsets.only(
                    bottom: 20
                ),
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.05,
                    ),
                    Center(
                      child:element.urlAvatar!=null? CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 20,
                        backgroundImage: NetworkImage(element.urlAvatar.toString()),
                      ):CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 20,
                        child: Center(
                          child: Text('${userName[0]}'),
                        ),
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
                          child:Text('${element.message}',style: AppTextStyle.appBarHeader(
                            color: Color(0xffffffff),

                          ),),
                        )
                    ),
                  ],
                ))
        );
      }
    }
    });
    var senderId=widget.senderId;
    return Scaffold(
        bottomSheet:
        Container(
            height: 65,
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width*0.05,
              right:MediaQuery.of(context).size.width*0.05,
              bottom: 20,
            ),
            child:TextField(
              controller: model.messageText,
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
                suffixIcon: IconButton(onPressed: (){
                  model.sendMessage(user, orderId);
                }, icon:SvgPicture.asset(
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
    FutureBuilder(
    future:model.getSenderInfo(senderId!),
    builder: (context,AsyncSnapshot<DocumentSnapshot>snapshotSender) {
      if (snapshot.connectionState != ConnectionState.done) {
        return Container(
          color: Colors.white,
          child: Center(
            child: LoadingForm(),
          ),
        );
      }

      Map<String, dynamic> senderData = snapshotSender.data!.data() as Map<String, dynamic>;
      var  userSender=UserChaliar.fromData(senderData);
     return Container(
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
                  onTap: () => launch("tel://${userSender.phone}"),
                  child: Text('APPELER', style: AppTextStyle.appBarHeader(
                      color: Color(0xff042C5C),
                      size: 8.64,
                      fontWeight: FontWeight.w400
                  ),),
                ),

                SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.05,
                ),
              ],
            ),
            Center(
              child: userSender.surname!=null?CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 55,
                backgroundImage: NetworkImage(
                    '${userSender.profile_url.toString()}'),
              ):CircleAvatar(
                backgroundColor: ChaliarColors.primaryColors,
                radius: 55,
                child: Center(
                  child: Text('${userSender.surname!.substring(0,1)}',style: AppTextStyle.appBarHeader(
                    color: ChaliarColors.whiteColor,
                    size: 16,
                    fontFamily: AppFontFamilly.avenirNext,
                    fontWeight: FontWeight.w400
                  ),),
                ),

              ),
            ),
            SizedBox(
              height: 14,
            ),
            Center(
              child: Text(
                '${userSender.surname}', style: AppTextStyle.appBarHeader(
                  size: 12,
                  color: Color(0xff042C5C),
                  fontWeight: FontWeight.w400
              ),),
            ),
          ],
        ),
      );

    }),
                  SingleChildScrollView(
                    child: listMessage.length>0?
                    Padding(
                      padding: EdgeInsets.only(
                        top: 335,
                        bottom: 50
                      ),
                      child: Column(
                        children: listMessagBuild,
                      ),
                    ):Container(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height*0.5
                      ),
                      child: Center(
                        child: Text('La boite de messagerie est encore vide',style: AppTextStyle.appBarHeader(
                          color: ChaliarColors.secondaryColors,
                          size: 18
                        ),),
                      ),
                    ),
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
    });
              })
        ));
  }
}
