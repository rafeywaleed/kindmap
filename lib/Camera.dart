import 'dart:io';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:kindmap/Pin/PinPage.dart';
import 'package:image/image.dart' as img;
import 'package:kindmap/themes/kmTheme.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      CameraDescription(
        name: "0",
        lensDirection: CameraLensDirection.back,
        sensorOrientation: 1,
      ),
      ResolutionPreset.veryHigh,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Camera')),
      body: Stack(
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final size = MediaQuery.of(context).size;
                // final deviceRatio = size.width / size.height;
                // final previewSize = _controller.value.previewSize!;
                // final previewRatio = previewSize.height / previewSize.width;

                // double scale = 1;
                // if (deviceRatio < previewRatio) {
                //   scale = previewRatio / deviceRatio;
                // } else {
                //   scale = deviceRatio / previewRatio;
                // }

                return ClipRect(
                  child: Align(
                    alignment: Alignment.center,
                    //child: Padding(
                    //padding: const EdgeInsets.all(40.0),
                    child: Container(
                      width: size.width - 70 % size.width,
                      height: size.width - 70 % size.width,

                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 2,
                            color: KMTheme.colors.success,
                            style: BorderStyle.solid,
                          )),
                      // child: Transform.scale(
                      //   scale: scale,
                      //child: Center(
                      // child: AsrpectRatio(
                      // aspectRatio: 1,
                      child: CameraPreview(_controller),
                      // ),
                      //),
                      //),
                    ),
                    //),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(80),
              child: GestureDetector(
                onTap: () async {
                  try {
                    await _initializeControllerFuture;

                    if (_controller.value.isTakingPicture) {
                      return;
                    }

                    final XFile? image = await _controller.takePicture();
                    if (image != null) {
                      await _controller.setFlashMode(FlashMode.off);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PinPage(imagePath: image.path),
                      ));
                    }
                  } catch (e) {
                    print('Error taking picture: $e');
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).primaryText,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: Icon(
                    Icons.camera,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 60,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Future<String> _cropImageToSquare(String imagePath) async {
  //   final image = img.decodeImage(File(imagePath).readAsBytesSync());
  //   if (image == null) {
  //     throw Exception('Failed to load image');
  //   }

  //   // Calculate the dimensions for the square crop
  //   final cropSize = image.width < image.height ? image.width : image.height;

  //   // Crop the image
  //   final croppedImage =
  //       img.copyCrop(image, x: 0, y: 0, width: cropSize, height: cropSize);

  //   // Save the cropped image
  //   final croppedImagePath = '${imagePath}_cropped.jpg';
  //   File(croppedImagePath).writeAsBytesSync(img.encodeJpg(croppedImage));

  //   return croppedImagePath;
  // }
}
