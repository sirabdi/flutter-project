import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/screens/create/vocation_card.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  Vocation selectedVocation = Vocation.junkie;

  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  // handling vocation select
  void updateVocation(Vocation vocation) {
    setState(() {
      selectedVocation = vocation;
    });
  }

  // submit form
  void handleSubmit() {
    if (_nameController.text.trim().isEmpty) {
      // show error dialog
      return;
    }
    if (_sloganController.text.trim().isEmpty) {
      // show error dialog
      return;
    }

    characters.add(
      Character(
        name: _nameController.text.trim(),
        slogan: _sloganController.text.trim(),
        vocation: selectedVocation,
        id: uuid.v4(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledHeading('Create Your Characters'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            //welcome message
            Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
            Center(child: StyledTitle('Welcome New Player!')),
            Center(
              child: StyledText('This is where the hero will become legend!'),
            ),
            const SizedBox(height: 20),

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

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    VocationCard(
                      selected: selectedVocation == Vocation.junkie,
                      onTap: updateVocation,
                      vocation: Vocation.junkie,
                    ),
                    VocationCard(
                      selected: selectedVocation == Vocation.raider,
                      onTap: updateVocation,
                      vocation: Vocation.raider,
                    ),
                    VocationCard(
                      selected: selectedVocation == Vocation.wizard,
                      onTap: updateVocation,
                      vocation: Vocation.wizard,
                    ),
                    VocationCard(
                      selected: selectedVocation == Vocation.ninja,
                      onTap: updateVocation,
                      vocation: Vocation.ninja,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            //enjoy message
            Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
            Center(child: StyledTitle('Good Luck!')),
            Center(child: StyledText('Enjoy the journey....')),

            SizedBox(height: 20),

            Center(
              child: StyledButton(
                onPressed: handleSubmit,
                child: StyledTitle('Create Character'),
              ),
            ),
          ],
        ),
        // child: SingleChildScrollView(
        // ),
      ),
    );
  }
}
