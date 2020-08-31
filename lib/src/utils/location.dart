import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location with ChangeNotifier {
  Position position;

  Future<LocationPermission> checkPermission() async {
    return checkPermission();
  }

  Future<void> getLocation() async {
    Position _currentPosition =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
    print(_currentPosition);
    position = _currentPosition;
    notifyListeners();
  }
}
