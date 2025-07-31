import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/todo/todo.dart';
import 'package:flutter_rpg/screens/todo/todo_create_screen.dart';
import 'package:flutter_rpg/screens/todo/todo_list.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final List<Todo> todos = [
    const Todo(
      id: '1',
      title: 'Buy groceries',
      description: 'Milk, Bread, Eggs',
      // priority: Priority.high,
    ),
    const Todo(
      id: '1',
      title: 'Walk the dog',
      description: 'Take the dog for a walk in the park',
      // priority: Priority.medium,
    ),
    const Todo(
      id: '1',
      title: 'Complete Flutter project',
      description: 'Finish the todo app for the Flutter course',
      // priority: Priority.urgent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StyledHeading('Todos List'), centerTitle: true),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(child: TodoList(todos: todos)),
            StyledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => const TodoCreateScreen()),
                );
              },
              child: const StyledTitle('Create New'),
            ),
          ],
        ),
      ),
    );
  }
}
