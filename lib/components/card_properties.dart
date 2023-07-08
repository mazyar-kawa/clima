import 'package:flutter/material.dart';

class CardProperties extends StatelessWidget {
  const CardProperties({
    super.key,
    required this.childCard,
  });

  final Widget childCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: childCard,
    );
  }
}