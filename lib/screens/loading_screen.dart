import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getLocation();
  }
  void getLocation() async {
    Location location = Location ();
   await location.getCurrentLocation();
   print(location.latitude);
   print(location.longitude);


  }

  void getData() async {
    http.Response response = await http.get('https://samples.openweathermap.org/data/2.5/weather?'
        'id=2172797&appid=b6907d289e10d714a6e88b30761fae22');

    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);

      var longitude =jsonDecode(data)['coord']['lon'];
      print(longitude);

      double temperature = decodedData(data)['main']['temp'];

      var weatherDescription = jsonDecode(data)['weather'][0]['description'];

      int condition = decodedData(data)['weather'][0] ['id'];
      String cityName = decodedData(data)['name'];
       print(temperature);
      print(condition);
      print(cityName);
    } else {
      print(response.statusCode);
    }
  }
  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();

  }
}
