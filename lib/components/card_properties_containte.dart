import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardPropertiesContainte extends StatelessWidget {
  const CardPropertiesContainte({
    super.key,
    required this.backgroundColor,
    required this.icon,
    required this.value,
    required this.title,
  });

  final Color? backgroundColor;

  final String icon;
  final String value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          icon,
          color: backgroundColor,
          width: 40,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          value,
          style: TextStyle(
              color: backgroundColor,
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
        Text(
          title,
          style: TextStyle(
            color: backgroundColor,
          ),
        )
      ],
    );
  }
}