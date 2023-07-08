import 'package:flutter/material.dart';

const kPinkColor = Color(0xFFFF64D4);
const kYellowColor = Color(0xFFFFE142);
const kBlueColor = Color(0xFF42C6FF);
const kWhiteColor = Color(0xFFFFFFFF);

const kMainText = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontFamily: 'Ledger',
  fontSize: 24,
);

const kWeatherTypeText = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontFamily: 'Lato',
    fontWeight: FontWeight.bold);

const kTempratureText = TextStyle(
  color: Colors.black,
  fontSize: 110,
);

const KText20 = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 20,
);

const KKeyboardStyle = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
    ),
    hintText: 'Enter Name City',
    hintStyle: TextStyle(
      color: Colors.grey,
    ),
    icon: Icon(
      Icons.location_city_rounded,
      color: Colors.white,
      size: 30,
    ));
const KSmallText=TextStyle(color: Colors.black, fontSize: 14);


const KBlackText=TextStyle(color: Colors.black);