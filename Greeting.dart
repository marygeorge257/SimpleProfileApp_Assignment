import 'package:flutter/material.dart';
class Greeting extends StatelessWidget {
  const Greeting({super.key,required this.name});
    final String name;
  @override
  Widget build(BuildContext context) {
    return Text(
      "Hello,$name",
      style: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: Colors.lightBlue
      ),
      textAlign: TextAlign.center,
    );
  }
}
