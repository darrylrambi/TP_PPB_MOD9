import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraListApp extends StatefulWidget {
  const CameraListApp({super.key});

  @override
  _CameraListAppState createState() => _CameraListAppState();
}

class _CameraListAppState extends State<CameraListApp> {
  List<CameraDescription> cameras = [];

  @override
  void initState() {
    super.initState();
    _getCameras();
  }

  Future<void> _getCameras() async {
    cameras = await availableCameras();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cameras.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: cameras.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Camera name: ${cameras[index].name}'),
                  subtitle: Text('Sensor orientation: ${cameras[index].sensorOrientation}'),
                );
              },
            ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: CameraListApp(),
  ));
}