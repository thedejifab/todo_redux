import 'package:flutter/material.dart';
import 'package:todo_redux/widgets/left_barside.dart';
import 'package:todo_redux/widgets/right_barside.dart';
import 'package:todo_redux/models/model.dart';

class BarWidget extends StatelessWidget {
  final List<Todo> _todoList;
  BarWidget(this._todoList);

  int personal = 0;
  int business = 0;

  void getCategories() {
    for (var i = 0; i < _todoList.length; i++) {
      if (_todoList[i].category == "Personal") {
        personal++;
      } else {
        business++;
      }
    }
  }

  Widget build(BuildContext context) {
    getCategories();
    Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;
    final firstWidth = 0.6 * screenWidth;
    return Container(
      height: 200.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.hardLight,
          ),
        ),
      ),
      padding: EdgeInsets.only(top: 20.0, left: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: firstWidth,
            child: LeftBarSide(),
          ),
          RightBarSide(personal, business),
        ],
      ),
    );
  }
}
