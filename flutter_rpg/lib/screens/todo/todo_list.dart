import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/todo/todo.dart';
import 'package:flutter_rpg/screens/todo/todo_edit_screen.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key, required this.todos, required this.el});

  final List<Todo> todos;
  final int el;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: SizedBox(
        height: 100,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => TodoEditScreen(todo: widget.todos[widget.el]),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.secondaryColor,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StyledTitle(widget.todos[widget.el].title),
                        SizedBox(height: 6),
                        StyledText(widget.todos[widget.el].description),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: widget.todos[widget.el].priority.color,
                    ),
                    child: Center(
                      child: Text(
                        widget.todos[widget.el].priority.title,
                        style: TextStyle(
                          color: Colors.white,
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
      ),
    );
  }
}
