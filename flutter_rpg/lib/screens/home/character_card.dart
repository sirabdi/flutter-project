import 'package:flutter/material.dart';
import 'package:flutter_rpg/shared/styled_text.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard(this.character, {super.key});

  final String character;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Row(children: [StyledText(character)]),
      ),
    );
  }
}
