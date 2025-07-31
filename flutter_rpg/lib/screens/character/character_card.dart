import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/screens/profile/profile.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard(this.character, {super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: character.id.toString(),
              child: Image.asset(
                'assets/img/vocations/${character.vocation.image}',
                width: 80,
              ),
            ),

            const SizedBox(width: 20),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyledTitle(character.name),
                  StyledText(character.vocation.title),
                ],
              ),
            ),

            // StyledText(character.name),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => Profile(character: character),
                  ),
                );
              },
              icon: Icon(
                Icons.arrow_right_alt_outlined,
                color: AppColors.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
