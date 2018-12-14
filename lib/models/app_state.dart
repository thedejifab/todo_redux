import 'package:flutter/foundation.dart';
import 'package:todo_redux/models/model.dart';

class AppState {
  final List<Todo> todos;

  AppState({
    @required this.todos,
  });

  AppState.initialState()
      : todos = List.unmodifiable(
          <Todo>[], //creates an empty list of todos initially
        );
}
