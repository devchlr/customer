
import 'package:camera/camera.dart';
import 'package:chaliar_delivery_app/model_views/base_model.dart';
import 'package:flutter/material.dart';
import 'package:chaliar_delivery_app/ui/views/orders/form/camera/display_picture_screen.dart';


class CameraMV extends BaseModel{
  Future<void> takePhoto(BuildContext context, Future<void> initializeControllerFuture,CameraController cameraController)async{
    try {
      // Ensure that the camera is initialized.
      await initializeControllerFuture;

      // Attempt to take a picture and get the file `image`
      // where it was saved.
      final image = await cameraController.takePicture();
      // If the picture was taken, display it on a new screen.
      print(image.path);
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DisplayPictureScreen(
            // Pass the automatically generated path to
            // the DisplayPictureScreen widget.
            imagePath: image.path,
          ),
        ),
      );
    } catch (e) {
      // If an error occurs, log the error to the console.
      print(e);
    }
  }
}