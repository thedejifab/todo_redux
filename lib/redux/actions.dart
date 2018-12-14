import 'package:todo_redux/models/model.dart';

/// To add a [todo] with [_id]
class AddTodoAction {
  static int _id = 0;
  final Todo todo;

  AddTodoAction(this.todo) {
    _id++;
  }

  int get id => _id;
}

/// To remove the todo with [id] from the list of todos
class RemoveTodoAction {
  final int id;

  RemoveTodoAction(this.id);
}

/// To remove all todos
class RemoveTodosAction {}
