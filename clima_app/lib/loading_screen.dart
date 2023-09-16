import 'package:clima_app/secrets.dart';
import 'package:clima_app/temperature_page.dart';
import 'package:clima_app/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

   void getPosition() async {
    Location location = Location();
    await location.getCurrentPosition();
    String url = "https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric";
    Weather currentWeather = Weather(url);
    var weatherData = await currentWeather.getWeather();
    // print(weatherData);
    // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
    //     builder: (context) {
    //       return TemperaturePage();
    //     }
    //   ),
    //   (condition) {
    //     return false;
    //     }
    // );
    Navigator.push(context, MaterialPageRoute(
        builder: (context){
          return TemperaturePage(weather: weatherData);
        }
    ));
  }

  @override
  void initState() {
    getPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}

