import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class Bluetooth with ChangeNotifier {
  final FlutterBlue _flutterBlue = FlutterBlue.instance;

  void scanDevices() {
    _flutterBlue.scan(timeout: Duration(seconds: 10)).listen((scanResult) {
      print("${scanResult.device.id.toString()}");
    }, onDone: () => {});
  }
}
