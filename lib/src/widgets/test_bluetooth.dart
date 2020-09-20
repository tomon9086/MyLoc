import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class TestBluetooth extends StatefulWidget {
  @override
  _TestBluetoothState createState() => _TestBluetoothState();
}

class _TestBluetoothState extends State<TestBluetooth> {
  final FlutterBlue _flutterBlue = FlutterBlue.instance;

  @override
  void initState() {
    super.initState();
  }

  // void scanDevices() {
  //   _flutterBlue.scan(timeout: Duration(seconds: 10)).listen((scanResult) {
  //     print("${scanResult.device.id.toString()}");
  //   }, onDone: () => {});
  // }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _flutterBlue.scan(timeout: Duration(seconds: 10)),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return Center(child: Text('No devices found'));
        }
        // final tiles = snapshot.data.map((item) {
        //   return new ListTile(title: new Text(item.name));
        // });
        // return ListView(children: tiles);
        return Text(snapshot.toString());
      },
    );
  }
}
