import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import  'location_screen.dart';
import  'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey= '6bac7aedb9e75db0074c75467754ee2f';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getLocationData();
  }
  void getLocationData() async {
    Location location = Location ();
   await location.getCurrentLocation();
   latitude = location.latitude;
   longitude = location.longitude;
     NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&'
         'id=$apiKey');
     var weatherData = await networkHelper.getData();

     Navigator.push(context, MaterialPageRoute(builder: (context) {
       return LocationScreen(locationWeather: weatherData,);
     }));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0
        )
      )
    );

  }
}
