import 'package:flutter/foundation.dart';

class Todo {
  final int id;
  final String task;
  final String place;
  final String time;
  final String category;

  Todo({
    this.id,
    @required this.task,
    @required this.place,
    @required this.time,
    @required this.category,
  });

  Todo copyWith(
    int id,
    String task,
    String category,
    String place,
    String time,
  ) {
    return Todo(
      id: id ?? this.id,
      task: task ?? this.task,
      category: category ?? this.category,
      place: place ?? this.place,
      time: time ?? this.time,
    );
  }
}
