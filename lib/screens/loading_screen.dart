import 'package:climate/location.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  Location location = Location();

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  @override
  Widget build(BuildContext context) {
    String myMargin = 'abc';

    try {
      double myMarginAsADouble = double.parse(myMargin);
      return Scaffold(
        body: Container(
          margin: EdgeInsets.all(myMarginAsADouble),
          color: Colors.red,
        ),
      );
    } catch (e) {
      print(e);
      return Scaffold(
        body: Container(
          margin: EdgeInsets.all(30),
          color: Colors.red,
        ),
      );
    }
  }
}
