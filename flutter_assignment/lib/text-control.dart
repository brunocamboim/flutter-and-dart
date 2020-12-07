import 'package:flutter/material.dart';

import './text.dart';

class TextControl extends StatelessWidget {

  final Function handler;
  final String text;

  TextControl(this.handler, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          TextClass(this.text),
          RaisedButton(
            onPressed: this.handler,
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}