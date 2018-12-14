import 'package:flutter/material.dart';

class RightBarSide extends StatelessWidget {
  final int _personal;
  final int _business;
  RightBarSide(this._personal, this._business);

  final TextStyle _topStyle =
      new TextStyle(fontSize: 30.0, color: Colors.white);
  final TextStyle _smallStyle =
      new TextStyle(fontSize: 13.0, color: Colors.white);

  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.black.withOpacity(0.3),
        child: Column(
          children: <Widget>[
            _buildCategory(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory() {
    return Container(
      padding: EdgeInsets.only(top: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                "$_personal",
                style: _topStyle,
              ),
              Text("Personal", style: _smallStyle),
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                "$_business",
                style: _topStyle,
              ),
              Text(
                "Business",
                style: _smallStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
