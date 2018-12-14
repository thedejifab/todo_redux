import 'package:flutter/material.dart';

import 'package:todo_redux/models/view_model.dart';
import 'package:todo_redux/pages/add_todo.dart';
import 'package:todo_redux/widgets/todo_item.dart';
import 'package:todo_redux/widgets/bar_widget.dart';

class AllTodosPage extends StatelessWidget {
  final ViewModel viewModel;

  AllTodosPage(this.viewModel);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;
    return Scaffold(      
      body: SingleChildScrollView(
        child: Column(          
          children: <Widget>[            
            BarWidget(viewModel.todos),
            Container(
              height: screenHeight - 200,
              child: ListView.builder(
                itemCount: viewModel.todos.length,
                itemBuilder: (context, index) {
                  return Dismissible( 
                    key: ObjectKey(index),
                    child: buildTodoItem(
                      viewModel.todos[index].task,
                      viewModel.todos[index].place,
                      viewModel.todos[index].time,
                      viewModel.todos[index].category,
                    ), 
                    onDismissed: (direction) => viewModel.onRemoveTodo(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTodoPage(viewModel),
            ),
          );
        },
      ),
    );
  }
}

//Completed
