import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character/character.dart';
import 'package:flutter_rpg/screens/profile/heart.dart';
import 'package:flutter_rpg/screens/profile/skill_list.dart';
import 'package:flutter_rpg/screens/profile/stats_table.dart';
import 'package:flutter_rpg/service/character_store.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key, required this.character});

  final Character character;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledHeading(widget.character.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // General Information
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  color: AppColors.secondaryColor.withAlpha(
                    (255 * 0.5).round(),
                  ),
                  child: Row(
                    children: [
                      Hero(
                        tag: widget.character.id.toString(),
                        child: Image.asset(
                          'assets/img/vocations/${widget.character.vocation.image}',
                          width: 140,
                          height: 140,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StyledHeading(widget.character.name),
                            StyledText(widget.character.vocation.description),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Heart(character: widget.character),
                ),
              ],
            ),

            // Weapond and Skill Ability
            SizedBox(height: 12),
            Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
            SizedBox(height: 12),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              color: AppColors.secondaryColor.withAlpha((255 * 0.5).round()),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyledHeading('Slogan'),
                  StyledText(widget.character.slogan),
                  SizedBox(height: 16),
                  StyledHeading('Weapond of Choice'),
                  StyledText(widget.character.vocation.weapon),
                  SizedBox(height: 16),
                  StyledHeading('Unique Ability'),
                  StyledText(widget.character.vocation.ability),
                ],
              ),
            ),

            // Stats
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              child: Column(
                children: [
                  StatesTable(character: widget.character, isSaved: isSaved),
                  SizedBox(height: 16),
                  SkillList(widget.character, isSaved),
                ],
              ),
            ),

            SizedBox(height: 20),
            StyledButton(
              onPressed: () {
                Provider.of<CharacterStore>(
                  context,
                  listen: false,
                ).updateCharacter(widget.character);

                setState(() {
                  isSaved = true;
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: StyledHeading('Character was saved.'),
                    showCloseIcon: true,
                    duration: Duration(seconds: 2),
                    backgroundColor: AppColors.secondaryColor,
                  ),
                );
              },
              child: StyledTitle('Save Character'),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
