import 'dart:convert';
import 'dart:io';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/image.dart';
import 'package:storage_path/storage_path.dart';

class Images extends StatefulWidget {
  final void Function()? onTap;
  Images({this.onTap});
  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<Images> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: StoragePath.imagesPath,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<dynamic> list = json.decode(snapshot.data);
          ImageModel imageModel = ImageModel.fromJson(list[0]);
          return GestureDetector(
              onTap:widget.onTap,
            onDoubleTap: (){
                print(imageModel.files!.first);
            },
            child:Container(
              height: 43,
              width: 54,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(File(imageModel.files!.first)),
              fit: BoxFit.fill,
            )

              ),
            ),
          );
        } else {
          return GestureDetector(
            onTap:widget.onTap,
            child: Icon(Icons.panorama,size: 43,color: Colors.white,),
          );
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}