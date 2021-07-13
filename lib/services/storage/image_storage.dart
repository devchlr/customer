import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'dart:io' as io;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/services.dart';
import 'package:chaliar_delivery_app/models/cloud_image.dart';

class ImageStorageService{
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  //upload umage
  Future<String> uploadImage(
      @required File imageToUpload,
      @required String title,
      ) async{
    var imageFileName =
        title + DateTime.now().millisecondsSinceEpoch.toString();

    // ref.putFile(imageToUpload);
    //start ici
    var uploadTask;
    //add reference
    firebase_storage.Reference ref =
    firebase_storage.FirebaseStorage.instance.ref('/user_profile/$title').child(imageFileName);
    //add meta data
    final metadata = firebase_storage.SettableMetadata(
        contentType: 'image/png',
        customMetadata: {'picked-file-path': imageToUpload.path});

    if (kIsWeb) {
      uploadTask = await ref.putData(await imageToUpload.readAsBytes(), metadata);
    } else {
      uploadTask =await ref.putFile(imageToUpload, metadata);
    }
    var link =  ref.getDownloadURL();
    return link;

       //  ref.getDownloadURL().then((downloadUrl){
       //   var url = downloadUrl.toString();
       //   return CloudStorageResult(
       //     imageUrl: url,
       //     imageFileName: imageFileName,
       //   );
       // });
  }



  Future<void> _downloadLink(firebase_storage.Reference ref) async {
    final link = await ref.getDownloadURL();
    await Clipboard.setData(ClipboardData(
      text: link,
    ));

  }

  // //delete image
  // Future deleteImage(String imageFileName) async {
  //   final StorageReference firebaseStorageRef =
  //   FirebaseStorage.instance.ref().child(imageFileName);
  //
  //   try {
  //     await firebaseStorageRef.delete();
  //     return true;
  //   } catch (e) {
  //     return e.toString();
  //   }
  // }

}

