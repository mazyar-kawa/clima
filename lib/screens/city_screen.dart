import 'dart:async';

import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';



class CityScreen extends StatelessWidget {


 CityScreen({super.key,this.nameCity,required this.backgroundColor});

  String? nameCity;

  Color? backgroundColor;

  Future _hideKeyboard(BuildContext context) async{
     FocusScope.of(context).unfocus();
  }

   WeatherModel model = WeatherModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 50.0,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: TextField(
                    style: KBlackText,
                    onChanged: (value) {
                      nameCity=value;
                    },
                    decoration: KKeyboardStyle,
                  ),
                ),
                TextButton(
                onPressed: () async{
                 await _hideKeyboard(context);

                  var weatherData =
                                await model.getWeatheByNameCity(nameCity);
                   Navigator.pop(context,weatherData);
                  
                },
                child: Text(
                  'Get Weather',
                  style: kMainText,
                ),
              ),
          ],
        ),
      ),
    );
  }
}