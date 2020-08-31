import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:myloc/src/utils/location.dart';

class TestLocation extends StatefulWidget {
  @override
  _TestLocationState createState() => _TestLocationState();
}

class _TestLocationState extends State<TestLocation> {
  bool doneInitialLocation = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final location = Provider.of<Location>(context);
    if (!doneInitialLocation) {
      location.getLocation();
      doneInitialLocation = true;
    }

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
              Text("${location.position}"),
            ],
          ),
        );
      },
    );
  }
}
