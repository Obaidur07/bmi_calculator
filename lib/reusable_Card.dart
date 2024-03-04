import 'package:flutter/material.dart';
import 'input_page.dart';

class ReusableCard extends StatelessWidget {

  ReusableCard({required this.colour,required this.cardChild});
  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: colour,
      ),
    );
  }
}


