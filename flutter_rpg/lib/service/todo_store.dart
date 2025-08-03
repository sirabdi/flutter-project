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

  // fetch characters from firestore
  Future<void> fetchTodosOnce() async {
    if (todos.length == 0) {
      final snapshot = await FirestoreService.getTodos();

      for (var doc in snapshot.docs) {
        todos.add(doc.data());
      }
      notifyListeners(); // Revalidate the listeners to update the UI
    }
  }
}
