import 'package:flutter/material.dart';

int add(int a , int b) =>  a+b;

class ReusableCard extends StatelessWidget {

  ReusableCard({required this.colour,this.cardChild = const Text('') });
  final Color colour;
  final Widget cardChild;
  Function onpress= add;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
