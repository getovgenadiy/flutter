import 'package:flutter/material.dart';

class FlashCardView extends StatelessWidget{

  final String text;

  FlashCardView({ required this.text}) : super();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Center(
        child: Text(text, textAlign: TextAlign.center),
      ),
    );
  }
  
}