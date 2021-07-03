import 'package:flutter_app/model_views/authentification/pre_onboardingVM.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/views/authentifications/conditionnal_term.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PreOnboardingScreen extends StatefulWidget {

  String? uid;
  PreOnboardingScreen({this.uid});
  @override
  _PreOnboardingScreenState createState() => _PreOnboardingScreenState();
}
class _PreOnboardingScreenState extends State<PreOnboardingScreen> {
  void initState(){
    super.initState();
    getUserData();
  }
  ConditionnalTermViewModel conditionnalTermViewModel = ConditionnalTermViewModel();
  void getUserData() async{
    var userData = await conditionnalTermViewModel.getUserData(widget.uid!);
    print(userData['id']);
    Navigator.push(context,MaterialPageRoute(builder:(context){
      return  ConditionGeneraleScreen(user: new UserChaliar(
          id: userData['id'],
          name: userData['name'],
          surname: userData['surname'],
          email: userData['email'],
          phone : userData['phone'],
          street : userData['street'],
          facturationAdresse : userData['facturationAdresse'],
          codePostal : userData['codePostal'],
          city : userData['city'],
          siret:userData['siret'],
          societe:userData['societe'],
          userRole : userData['userRole']
      ),);
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.blueAccent,
          size: 100.0,
        ),
      ),
    );
  }
}
