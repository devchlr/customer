import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:chaliar_delivery_app/ui/views/authentifications/authentification_screen.dart';
import 'package:chaliar_delivery_app/ui/views/authentifications/conditionnal_term.dart';
import 'package:chaliar_delivery_app/ui/views/course/home_course.dart';
import 'package:chaliar_delivery_app/ui/views/facture/home_facturation.dart';
import 'package:chaliar_delivery_app/ui/views/message/home_message.dart';
import 'package:chaliar_delivery_app/ui/views/annexe/about.dart';
import 'package:chaliar_delivery_app/ui/views/annexe/condionnal_term_detail_screen.dart';
import 'package:chaliar_delivery_app/ui/views/annexe/faq_screen.dart';
import 'package:chaliar_delivery_app/ui/views/authentifications/connexion_screen.dart';
import 'package:chaliar_delivery_app/ui/views/authentifications/home_screen.dart';
import 'package:chaliar_delivery_app/ui/views/authentifications/register_screen.dart';
import 'package:chaliar_delivery_app/ui/views/authentifications/type_register_screen.dart';
import 'package:chaliar_delivery_app/ui/views/orders/form/arrive_order_form.dart';
import 'package:chaliar_delivery_app/ui/views/orders/form/camera/add_photo_screen.dart';
import 'package:chaliar_delivery_app/ui/views/orders/form/camera/camera_screen.dart';
import 'package:chaliar_delivery_app/ui/views/orders/form/depart_order_form.dart';
import 'package:chaliar_delivery_app/ui/views/orders/form/package_information_screen.dart';
import 'package:chaliar_delivery_app/ui/views/orders/form/resume_order_screen.dart';
import 'package:chaliar_delivery_app/ui/views/orders/form/signature_pad.dart';
import 'package:chaliar_delivery_app/ui/views/orders/home_order_screen.dart';
import 'package:chaliar_delivery_app/ui/views/orders/order_live_tracking_screen.dart';
import 'package:chaliar_delivery_app/ui/views/orders/order_recapt.dart';
import 'package:chaliar_delivery_app/ui/views/orders/order_scanning.dart';
import 'package:chaliar_delivery_app/ui/views/orders/order_tracking.dart';
import 'package:chaliar_delivery_app/ui/views/orders/order_validate_screen.dart';
import 'package:chaliar_delivery_app/ui/views/profile/annexe/add_payment_method_screen.dart';
import 'package:chaliar_delivery_app/ui/views/profile/annexe/edit_profile_screen.dart';
import 'package:chaliar_delivery_app/ui/views/profile/annexe/payment_method_screen.dart';
import 'package:chaliar_delivery_app/ui/views/profile/home_profile_screen.dart';
import 'package:chaliar_delivery_app/ui/views/splash_screen.dart';
import 'package:chaliar_delivery_app/ui/views/tutorial_screen.dart';
// import 'package:client_chaliar/ui/views/faq/term_screen.dart';

Future<void> main() async{
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();
  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();
  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(camera: firstCamera,));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> camera;

  const MyApp({
    Key? key,
    required this.camera,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      title: 'Chaliar_Livreur',
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          unselectedWidgetColor: Colors.grey,
          disabledColor: Colors.grey),
      routes: <String, WidgetBuilder>{
        "/splash": (BuildContext context) => new PreCommandeScreen(),
        "/tuto": (BuildContext context) => new OnboardingScreen(),
        "/connexion": (BuildContext context) => new ConnexionScreen(),
        "/pro_particulier": (BuildContext context) =>
        new ProParticulierScreen(),
        "/inscription": (BuildContext context) => new UserRegisterScreen(),
        "/singin": (BuildContext context) => new SingInScreen(),
        "/pre_commande": (BuildContext context) => new PreCommandeScreen(),
        "/taille_colli": (BuildContext context) => new TailleColisScreen(),
        "/add_photo": (BuildContext context) => new AddPhotoScreen(),
        "/commande_depart_form": (BuildContext context) => new DepartFormScreen(),
        "/commande_arrivee_form": (BuildContext context) => new ArriveeFormScreen(),
        '/take_picture':(BuildContext context)=>new TakePictureScreen(camera: camera),
        '/resume_order_screen':(BuildContext context)=>new ResumeOrderScreen(),
        '/home_profile':(BuildContext context)=>new HomeProfileScreen(),
        '/edit_profile':(BuildContext context)=>new EditProfileScreen(),
        '/payment_method':(BuildContext context)=>new PaymentMethodScreen(),
        '/add_payment_method':(BuildContext context)=>new AddPaymentMethodScreen(),
        '/home_facturation':(BuildContext context)=>new HomeFacturationScreen(),
         "/faq": (BuildContext context) => new FaqScreen(),
        "/order_tracking": (BuildContext context) => new OrderTrackingScreen(),
        "/order_scaning": (BuildContext context) => new OrderScanScreen(),
        "/order_message": (BuildContext context) => new HomeMessageScreen(),
        "/about": (BuildContext context) => new AboutScreen(),
        "/term_condition": (BuildContext context) => new TermConditionScreen(),
        "/home_course":(BuildContext context)=>new HomeCourseScreen(),
         "/order_validate":(BuildContext context)=>new OrderValidateScreen(),
        "/recapt_order":(BuildContext context)=>new OrderRecaptScreen(),
        "/order_live_tracking":(BuildContext context)=>new OrderLiveTrackingScreen(),
      },
    );
  }
}