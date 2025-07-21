import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/screens/create/vocation_card.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  void handleSubmit() {
    if (_nameController.text.trim().isEmpty) {
      print('Name must not be empty!');
      return;
    }
    if (_sloganController.text.trim().isEmpty) {
      print('Slogan must not be empty!');
      return;
    }

    print(_nameController.text);
    print(_sloganController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledHeading('Create Your Characters'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //welcome message
              Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
              Center(child: StyledTitle('Welcome New Player!')),
              Center(
                child: StyledText('This is where the hero will become legend!'),
              ),
              const SizedBox(height: 30),

              //input form
              TextField(
                controller: _nameController,
                style: GoogleFonts.quicksand(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  label: StyledText('Character Name'),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _sloganController,
                style: GoogleFonts.quicksand(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.chat),
                  label: StyledText('Character Slogan'),
                ),
              ),
              SizedBox(height: 20),

              VocationCard(vocation: Vocation.junkie),
              VocationCard(vocation: Vocation.raider),
              VocationCard(vocation: Vocation.wizard),
              VocationCard(vocation: Vocation.ninja),

              SizedBox(height: 20),
              Center(
                child: StyledButton(
                  onPressed: handleSubmit,
                  child: StyledTitle('Create Character'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
