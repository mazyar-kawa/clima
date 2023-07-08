import 'dart:math';
import 'package:clima/components/card_properties.dart';
import 'package:clima/components/card_properties_containte.dart';
import 'package:clima/components/weather_card.dart';
import 'package:clima/components/weather_card_containte.dart';
import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, this.weatherData});

  final dynamic weatherData;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel model = WeatherModel();

  String? nameCity;
  int? temperature;
  String? typeWeather;
  int? feels_like;
  int? temperature_min;
  int? temperature_max;
  int? humidity;
  double? visibility;

  int? windSpeed;

  Color? backgroundColor;

  @override
  void initState() {
    super.initState();
    randomColor();
    getData(widget.weatherData);
  }

  void randomColor() {
    int number = Random().nextInt(3) + 1;
    if (number == 1) {
      backgroundColor = kBlueColor;
    } else if (number == 2) {
      backgroundColor = kPinkColor;
    } else {
      backgroundColor = kYellowColor;
    }
  }

  void getData(dynamic weather) {
    setState(() {
      nameCity = weather['name'];
      double temp = weather['main']['temp'];
      temperature = temp.toInt();
      typeWeather = weather['weather'][0]['main'];
      double feels = weather['main']['feels_like'];
      feels_like = feels.toInt();
      double temp_min = weather['main']['temp_min'];
      temperature_min = temp_min.toInt();
      double temp_max = weather['main']['temp_max'];
      temperature_max = temp_max.toInt();
      humidity = weather['main']['humidity'];
      int vis = weather['visibility'];
      visibility = vis.toInt() / 1000;
      double wind = weather['wind']['speed'];
      windSpeed = wind.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () async {
                          WeatherModel model = WeatherModel();
                          var weatherData =
                              await model.getLocationByLantAndLon();
                          getData(weatherData);
                        },
                        icon: Icon(
                          Icons.location_on,
                          color: Colors.black,
                          size: 28,
                        )),
                    Text(
                      nameCity!,
                      style: kMainText,
                    ),
                    IconButton(
                        onPressed: () async {
                          var nameCity = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => CityScreen(
                                        backgroundColor: backgroundColor,
                                      )));
                          getData(nameCity);
                        },
                        icon: Icon(
                          Icons.search_rounded,
                          color: Colors.black,
                          size: 28,
                        )),
                  ],
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(50)),
                        child: Text(
                          "Saturday, 8 July",
                          style: TextStyle(
                              color: backgroundColor,
                              fontSize: 18,
                              letterSpacing: 1),
                        ),
                      ),
                      Text(
                        typeWeather!,
                        style: kWeatherTypeText,
                      ),
                      Text(
                        "${temperature}°",
                        style: kTempratureText,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Daily Summary",
                              style: KText20,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Now it feels like +${feels_like}°, actually +${temperature}.",
                              style: KSmallText,
                            ),
                            Text(
                              "It feels hot because of direct ${typeWeather}. Today, the temperature is felt in the range +${temperature_min}° to +${temperature_max}°",
                              style: KSmallText,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: CardProperties(
                                    childCard: CardPropertiesContainte(
                                      backgroundColor: backgroundColor,
                                      icon: 'images/waves.svg',
                                      value: "${windSpeed}km/h",
                                      title: "Wind",
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: CardProperties(
                                    childCard: CardPropertiesContainte(
                                      backgroundColor: backgroundColor,
                                      icon: 'images/water-outline.svg',
                                      value: "${humidity}%",
                                      title: "Humidity",
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: CardProperties(
                                    childCard: CardPropertiesContainte(
                                      backgroundColor: backgroundColor,
                                      icon: 'images/visibility-outline.svg',
                                      value: "${visibility}km",
                                      title: "Visibility",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Weekly forcast",
                                      style: KText20,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_rounded,
                                      color: Colors.black,
                                      size: 30,
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: WeatherCard(
                                          cardChild: WeatherCardContainer(
                                            temp: "41",
                                            icon: "sunny",
                                            date: "9 Jul",
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: WeatherCard(
                                          cardChild: WeatherCardContainer(
                                            temp: "42",
                                            icon: "partly-sunny",
                                            date: "10 Jul",
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: WeatherCard(
                                          cardChild: WeatherCardContainer(
                                            temp: "41",
                                            icon: "sunny",
                                            date: "11 Jul",
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: WeatherCard(
                                          cardChild: WeatherCardContainer(
                                            temp: "43",
                                            icon: "sunny",
                                            date: "12 Jul",
                                          ),
                                        ),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        )),
                      ],
                    ))
              ],
            )),
      ),
    );
  }
}
