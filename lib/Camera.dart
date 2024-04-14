import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:kindmap/Pin/PinPage.dart';

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
                final deviceRatio = size.width / size.height;
                final previewSize = _controller.value.previewSize!;
                final previewRatio = previewSize.height / previewSize.width;

                double scale = 1;
                if (deviceRatio < previewRatio) {
                  scale = previewRatio / deviceRatio;
                } else {
                  scale = deviceRatio / previewRatio;
                }

                return ClipRect(
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: size.width,
                      height: size.width / _controller.value.aspectRatio,
                      child: Transform.scale(
                        scale: scale,
                        child: Center(
                          child: AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: CameraPreview(_controller),
                          ),
                        ),
                      ),
                    ),
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
              padding: const EdgeInsets.only(bottom: 15.0),
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
                child: Icon(
                  Icons.camera,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 60,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
