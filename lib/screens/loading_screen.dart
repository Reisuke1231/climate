import 'package:climate/services/location.dart';
import 'package:climate/services/networking.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  Location location = Location();

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;
  @override
  void initState() {
    super.initState();
    getLocationData();
    print('This line of code is triggered');
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    Uri uri = Uri.http(
      'samples.openweathermap.org',
      '/data/2.5/forecast',
      {
        'lat': '35',
        'lon': '139',
        'appid': apiKey,
      },
    );

    NetworkHelper networkHelper = NetworkHelper(url: uri);

    var weatherData = await networkHelper.getData();

    print(weatherData);
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
