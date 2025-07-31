import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/todo/todo.dart';
import 'package:flutter_rpg/service/firestore_service.dart';

class TodoStore extends ChangeNotifier {
  final List<Todo> _todos = [];

  get todos => _todos;

  // add character
  void addTodo(Todo todo) {
    FirestoreService.addTodo(todo);

    _todos.add(todo);
    notifyListeners(); // Revalidate the listeners to update the UI
  }
}
