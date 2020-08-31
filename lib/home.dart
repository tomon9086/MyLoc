import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myloc/src/widgets/test_location.dart';
import 'package:myloc/src/utils/location.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Location location = Location();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => location,
        child: Scaffold(
          appBar: AppBar(
            title: Text('MyLoc'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[TestLocation()],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: location.getLocation,
            tooltip: "Update Location",
            child: Icon(Icons.navigation),
          ),
        ));
  }
}
