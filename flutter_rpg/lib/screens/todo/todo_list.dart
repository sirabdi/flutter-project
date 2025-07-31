import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/todo/todo.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key, required this.todos});

  final List<Todo> todos;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.todos.length,
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
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          StyledTitle(widget.todos[index].title),
                          SizedBox(height: 6),
                          StyledText(widget.todos[index].description),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: 80,
                  //   child: Container(
                  //     height: double.infinity,
                  //     decoration: BoxDecoration(
                  //       color: widget.todos[index].priority.color,
                  //     ),
                  //     child: Center(
                  //       child: Text(
                  //         widget.todos[index].priority.title,
                  //         style: TextStyle(
                  //           color:
                  //               Colors.white, // Ubah warna teks menjadi putih
                  //           fontWeight: FontWeight.normal,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
