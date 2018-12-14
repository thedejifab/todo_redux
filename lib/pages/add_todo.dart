import 'package:flutter/material.dart';

import 'package:todo_redux/widgets/add_todo.dart';
import 'package:todo_redux/models/view_model.dart';

class AddTodoPage extends StatelessWidget {
  final ViewModel model;

  AddTodoPage(this.model);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Add a new task"),
        actions: <Widget>[
          IconButton(
            icon: new Icon(
              Icons.tune,
              semanticLabel: "reset",
            ),
            onPressed: () {
              print("reset button pressed");
            },
          )
        ],
      ),
      body: new SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: Form(
            child: new Column(
              children: <Widget>[
                new SizedBox(height: 50.0),
                new Center(
                  child: categoryIcon(),
                ),
                new SizedBox(height: 12.0),
                CategoryDropdown(),
                new SizedBox(height: 12.0),
                taskField(context),
                new SizedBox(height: 12.0),
                placeField(),
                new SizedBox(height: 12.0),
                TimeField(),
                new SizedBox(height: 30.0),
                addButton(context, model),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
