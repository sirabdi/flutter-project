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

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  // submit form
  void handleSubmit() {
    if (_titleController.text.trim().isEmpty) {
      // show error dialog
      showDialog(
        context: context,
        builder: (ctx) {
          return ErrorDialog(
            title: 'Missing Title Name',
            description: 'Please fill the Todo title correctly!',
            ctx: ctx,
          );
        },
      );
      return;
    }
    if (_descriptionController.text.trim().isEmpty) {
      // show error dialog
      showDialog(
        context: context,
        builder: (ctx) {
          return ErrorDialog(
            title: 'Missing Description Name',
            description: 'Please fill the Todo description correctly!',
            ctx: ctx,
          );
        },
      );
      return;
    }

    Provider.of<TodoStore>(context, listen: false).addTodo(
      Todo(
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        id: uuid.v4(),
      ),
    );

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

            //input form
            TextField(
              controller: _titleController,
              style: GoogleFonts.quicksand(
                textStyle: Theme.of(context).textTheme.bodyMedium,
              ),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.abc_rounded),
                label: StyledText('Title'),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _descriptionController,
              style: GoogleFonts.quicksand(
                textStyle: Theme.of(context).textTheme.bodyMedium,
              ),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.comment),
                label: StyledText('Description'),
              ),
            ),
            SizedBox(height: 20),

            Center(
              child: StyledButton(
                onPressed: handleSubmit,
                child: StyledTitle('Create Todo'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
