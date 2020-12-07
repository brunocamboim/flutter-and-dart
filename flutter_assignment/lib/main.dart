import 'package:flutter/material.dart';

import './app.dart';
import './text-control.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  final _texts = const [
    'What\'s your name?',
    'What\'s your favorite food?',
    'Where are you from?',
  ];

  var _i = 0;

  _changeText() {
    setState(() {
      if ((_i + 1) < _texts.length) {
        _i++;
      } else {
        _i = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: App(),
        body: Center(
          child: TextControl(this._changeText, this._texts[this._i]),
        ),
      ),
    );
  }
}