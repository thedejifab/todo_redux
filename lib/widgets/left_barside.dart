import 'package:flutter/material.dart';

class LeftBarSide extends StatelessWidget {
  final TextStyle _topStyle = new TextStyle(fontSize: 40.0, color: Colors.white);
  final TextStyle _smallStyle = new TextStyle(fontSize: 13.0, color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(
          Icons.menu,
          color: Colors.white,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          "Your",
          style: _topStyle,
        ),
        Text(
          "Things",
          style: _topStyle,
        ),
        SizedBox(height: 30.0),
        Text(
          "November 2018",
          style: _smallStyle,
        ),
      ],
    );
  }
}