import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/todo/todo.dart';
import 'package:flutter_rpg/service/todo_store.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:provider/provider.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key, required this.todos});

  final List<Todo> todos;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  void initState() {
    Provider.of<TodoStore>(context, listen: false).fetchTodosOnce();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<TodoStore>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.todos.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: EdgeInsets.all(4),
                child: SizedBox(
                  height: 100,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: AppColors.secondaryColor,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 16,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                StyledTitle(value.todos[index].title),
                                SizedBox(height: 6),
                                StyledText(value.todos[index].description),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 80,
                          child: Container(
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: value.todos[index].priority.color,
                            ),
                            child: Center(
                              child: Text(
                                value.todos[index].priority.title,
                                style: TextStyle(
                                  color: Colors
                                      .white, // Ubah warna teks menjadi putih
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
