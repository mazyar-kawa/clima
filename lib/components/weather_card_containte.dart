import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherCardContainer extends StatelessWidget {
  const WeatherCardContainer({
    super.key, required this.temp, required this.icon, required this.date,
  });

  final String temp;
  final String icon;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(temp,style: KBlackText),
        SvgPicture.asset('images/${icon}.svg',width: 30,),
        Text(date,style: KBlackText,)
      ],
    );
  }
}