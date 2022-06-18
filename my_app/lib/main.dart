import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('my first app'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('hello ninjas'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Text('click'),
      ),
    ),
  ));
}

