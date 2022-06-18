import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  List<String> restaurants = ['McDonald\'s',
    'Roscoe\'s Chicken & Waffles',
    'Olive Garden',
    'Pizza Hut',
    'Panda Express',
    'Subway'];

   late int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('What do you want to eat?'),
            if(currentIndex!=null )
              Text(
                restaurants[currentIndex],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
              )
            ,
            Padding(padding: EdgeInsets.only(top:50),),
            TextButton(
              onPressed: () { updateIndex(); },
              child: Text('Pick Restaurant'),
              style: TextButton.styleFrom(
                primary: Colors.white, // foreground
                backgroundColor: Colors.purple
              ),

            )
          ],
        )),
      ),
    );
  }
  void updateIndex(){
    final random = Random();
    final index=random.nextInt(restaurants.length);
    setState(() {
      currentIndex = index;
    });
  }
}
