import 'package:todo_redux/models/model.dart';
import 'package:todo_redux/models/app_state.dart';
import 'package:todo_redux/redux/actions.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    todos: todoReducer(state.todos, action),
  );
}

List<Todo> todoReducer(List<Todo> state, action) {
  if (action is AddTodoAction) {
    return []
      ..addAll(state)
      ..add(
        Todo(
          id: action.id,
          task: action.todo.task,
          category: action.todo.category,
          place: action.todo.place,
          time: action.todo.time,
        ),
      );
  }

  if (action is RemoveTodoAction) {
    return List.unmodifiable(List.from(state)..removeAt(action.id));
  }

  if (action is RemoveTodosAction) {
    return List.unmodifiable([]);
  }

  return state;
}
