import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/todo/todo.dart';
import 'package:flutter_rpg/screens/todo/todo_create_screen.dart';
import 'package:flutter_rpg/screens/todo/todo_list.dart';
import 'package:flutter_rpg/service/todo_store.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:provider/provider.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    Provider.of<TodoStore>(context, listen: false).fetchTodosOnce();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StyledHeading('Todos List'), centerTitle: true),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Consumer<TodoStore>(
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.todos.length,
                    itemBuilder: (_, index) {
                      return Dismissible(
                        key: ValueKey(value.todos[index].id),
                        onDismissed: (direction) => {
                          Provider.of<TodoStore>(
                            context,
                            listen: false,
                          ).removeTodo(value.todos[index]),
                        },
                        child: TodoList(todos: value.todos, el: index),
                      );
                    },
                  );
                },
              ),
            ),
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
