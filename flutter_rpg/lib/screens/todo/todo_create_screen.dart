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

class TodoCreateScreen extends StatefulWidget {
  const TodoCreateScreen({super.key});

  @override
  State<TodoCreateScreen> createState() => _TodoCreateScreenState();
}

class _TodoCreateScreenState extends State<TodoCreateScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formGlobalKey = GlobalKey<FormState>();

  Priority _selectedPriority = Priority.low;
  String _ttile = '';
  String _description = '';

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
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
    Provider.of<TodoStore>(context, listen: false).addTodo(
      Todo(
        title: _ttile,
        description: _description,
        priority: _selectedPriority,
        id: uuid.v4(),
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
      appBar: AppBar(
        title: StyledHeading('Create New Todo'),
        centerTitle: true,
      ),
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
                      _ttile = value!;
                    },
                  ),

                  TextFormField(
                    maxLength: 40,
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
