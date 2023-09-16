import 'package:clima_app/design.dart';
import 'package:clima_app/search_page.dart';
import 'package:clima_app/secrets.dart';
import 'package:clima_app/weather.dart';
import 'package:flutter/material.dart';

import 'location.dart';

class TemperaturePage extends StatefulWidget {
  TemperaturePage({super.key, required this.weather});

  var weather;

  @override
  State<TemperaturePage> createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {

  String temperature = '';
  String locationCity = '';
  String iconCode = '';

  void setValues(data) {
    temperature = data["main"]["temp"].toString().split('.')[0];
    locationCity = data["name"];
    iconCode = data["weather"][0]["icon"];
  }

  @override
  void initState() {
    setValues(widget.weather);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/location_background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () async {
                        Location location = Location();
                        await location.getCurrentPosition();
                        String url = "https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=${apiKey}&units=metric";
                        Weather currentWeather = Weather(url);
                        var weatherData = await currentWeather.getWeather();
                        setState(() {
                          setValues(weatherData);
                        });
                      },
                      icon: const Icon(Icons.near_me, size: 50.0,color: Colors.blue,),
                  ),
                  IconButton(
                    onPressed: () async {
                      var city = await Navigator.push(context, MaterialPageRoute(builder: (builder) {
                        return const SearchPage();
                      }));
                      String url = "https://api.openweathermap.org/data/2.5/weather?q=${city.toString()}&appid=$apiKey&units=metric";
                      Weather currentWeather = Weather(url);
                      var weatherData = await currentWeather.getWeather();
                      setState(() {
                        setValues(weatherData);
                      });
                    },
                    icon: const Icon(Icons.location_city, size: 50.0, color: Colors.blue,),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('$temperature°',
                    style: kTempTextStyle.copyWith(
                      color: Colors.white
                    ),
                  ),
                  Image.network('https://openweathermap.org/img/wn/$iconCode@4x.png'),
                ],
              ),
              Text('It\'s 🍦 time in San Francisco',
                style: kMessageTextStyle.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
