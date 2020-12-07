import 'package:flutter/material.dart';

class TextClass extends StatelessWidget {
  final String myText;

  TextClass(this.myText);

  @override
  Widget build(BuildContext context) {
    return Text(myText);
  }
}