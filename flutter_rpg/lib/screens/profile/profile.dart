import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/screens/profile/stats_table.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.character});

  final Character character;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StyledHeading(character.name), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // General Information
            Container(
              padding: EdgeInsets.all(16),
              color: AppColors.secondaryColor.withAlpha((255 * 0.5).round()),
              child: Row(
                children: [
                  Image.asset(
                    'assets/img/vocations/${character.vocation.image}',
                    width: 140,
                    height: 140,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledHeading(character.name),
                        StyledText(character.vocation.description),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Weapond and Skill Ability
            SizedBox(height: 20),
            Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
            SizedBox(height: 8),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              padding: EdgeInsets.all(16),
              color: AppColors.secondaryColor.withAlpha((255 * 0.5).round()),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyledHeading('Slogan'),
                  StyledText(character.slogan),
                  SizedBox(height: 16),
                  StyledHeading('Weapond of Choice'),
                  StyledText(character.vocation.weapon),
                  SizedBox(height: 16),
                  StyledHeading('Unique Ability'),
                  StyledText(character.vocation.ability),
                ],
              ),
            ),

            // Stats
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              child: StatesTable(character: character),
            ),
          ],
        ),
      ),
    );
  }
}
