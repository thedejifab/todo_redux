

import 'package:redux/redux.dart';
import 'package:todo_redux/models/app_state.dart';
import 'package:todo_redux/models/model.dart';
import 'package:todo_redux/redux/actions.dart';

class ViewModel {
  final List<Todo> todos;
  final Function(Todo) onAddTodo;
  final Function(int) onRemoveTodo;
  final Function() onRemoveTodos;

  ViewModel({
    this.todos,
    this.onAddTodo,
    this.onRemoveTodo,
    this.onRemoveTodos,
  });

  factory ViewModel.create(Store<AppState> store) {
    _onAddTodo(Todo todo) {
      store.dispatch(AddTodoAction(todo));
    }

    _onRemoveTodo(int id) {
      store.dispatch(RemoveTodoAction(id));
    }

    _onRemoveTodos() {
      store.dispatch(RemoveTodosAction());
    }

    return ViewModel(
      todos: store.state.todos,
      onAddTodo: _onAddTodo,
      onRemoveTodo: _onRemoveTodo,
      onRemoveTodos: _onRemoveTodos,
    );
  }
}
