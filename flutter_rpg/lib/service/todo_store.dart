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

  // fetch todos from firestore
  Future<void> fetchTodosOnce() async {
    if (todos.length == 0) {
      final snapshot = await FirestoreService.getTodos();

      for (var doc in snapshot.docs) {
        todos.add(doc.data());
      }
      notifyListeners(); // Revalidate the listeners to update the UI
    }
  }

  // update todo
  Future<void> updateTodo(Todo todo) async {
    await FirestoreService.updateTodo(todo);

    final index = _todos.indexWhere((t) => t.id == todo.id);
    if (index != -1) {
      _todos[index] = todo;
    }
    notifyListeners(); // update UI
  }

  // delete todo
  Future<void> removeTodo(Todo todo) async {
    await FirestoreService.deleteTodo(todo);
    _todos.remove(todo);
    notifyListeners(); // Revalidate the listeners to update the UI
  }
}
