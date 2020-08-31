import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class TestLocation extends StatefulWidget {
  @override
  _TestLocationState createState() => _TestLocationState();
}

class _TestLocationState extends State<TestLocation> {
  Position position;

  @override
  void initState() {
    super.initState();
    _getLocation(context);
  }

  Future<void> _getLocation(context) async {
    Position _currentPosition =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
    print(_currentPosition);
    setState(() {
      position = _currentPosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LocationPermission>(
      future: checkPermission(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.data == LocationPermission.denied) {
          return Text("Access Denied", textAlign: TextAlign.center);
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Current position is: ", style: TextStyle(fontSize: 20)),
              Text("${position}"),
            ],
          ),
        );
      },
    );
  }
}
