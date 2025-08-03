import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/todo/todo.dart';
import 'package:flutter_rpg/screens/create/error_dialog.dart';
import 'package:flutter_rpg/screens/todo/todo_screen.dart';
import 'package:flutter_rpg/service/todo_store.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class TodoEditScreen extends StatefulWidget {
  const TodoEditScreen({super.key, required this.todo});

  final Todo todo;

  @override
  State<TodoEditScreen> createState() => _TodoEditScreenState();
}

class _TodoEditScreenState extends State<TodoEditScreen> {
  final _formGlobalKey = GlobalKey<FormState>();

  late String _title;
  late String _description;
  late Priority _selectedPriority;

  @override
  void initState() {
    super.initState();
    _title = widget.todo.title;
    _description = widget.todo.description;
    _selectedPriority = widget.todo.priority;
  }

  void showErrorMessage(String title, String description) {
    showDialog(
      context: context,
      builder: (ctx) {
        return ErrorDialog(title: title, description: description, ctx: ctx);
      },
    );
  }

  // submit form
  void handleSubmit() {
    print(widget.todo.id);
    Provider.of<TodoStore>(context, listen: false).updateTodo(
      Todo(
        title: _title,
        description: _description,
        priority: _selectedPriority,
        id: widget.todo.id,
      ),
    );

    _formGlobalKey.currentState!.reset();
    _selectedPriority = Priority.low;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => const TodoScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StyledHeading('Edit Todo'), centerTitle: true),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            //welcome message
            Center(
              child: Icon(
                Icons.share_arrival_time_outlined,
                color: AppColors.primaryColor,
              ),
            ),
            Center(child: StyledTitle('New Resolution for Todo!')),
            Center(
              child: StyledText('This is where the dream will become real!'),
            ),
            const SizedBox(height: 20),
            //form widget
            Form(
              key: _formGlobalKey,
              child: Column(
                children: [
                  TextFormField(
                    maxLength: 20,
                    initialValue: _title,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.abc_rounded),
                      labelText: 'Title',
                      labelStyle: GoogleFonts.quicksand(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        color: AppColors.textColor,
                      ),
                    ),
                    style: GoogleFonts.quicksand(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      color: AppColors.textColor,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please fill the Todo title correctly!';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _title = value!;
                    },
                  ),

                  TextFormField(
                    maxLength: 40,
                    initialValue: _description,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.comment),
                      labelText: 'Description',
                      labelStyle: GoogleFonts.quicksand(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        color: AppColors.textColor,
                      ),
                    ),
                    style: GoogleFonts.quicksand(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      color: AppColors.textColor,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 5) {
                        return 'Please fill the Description at least 5 characters long!';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _description = value!;
                    },
                  ),

                  DropdownButtonFormField(
                    value: _selectedPriority,
                    dropdownColor: AppColors
                        .secondaryColor, // Set your desired background color here
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.star),
                      labelText: 'Priority',
                      labelStyle: GoogleFonts.quicksand(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        color: AppColors.textColor,
                      ),
                    ),
                    items: Priority.values.map((priority) {
                      return DropdownMenuItem(
                        value: priority,
                        child: Text(
                          priority.title,
                          style: GoogleFonts.quicksand(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            color: priority.color,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedPriority = value as Priority;
                      });
                    },
                  ),

                  SizedBox(height: 20),

                  Center(
                    child: StyledButton(
                      onPressed: () {
                        if (_formGlobalKey.currentState!.validate()) {
                          _formGlobalKey.currentState!.save();

                          handleSubmit();
                        }
                      },
                      child: StyledTitle('Create Todo'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
