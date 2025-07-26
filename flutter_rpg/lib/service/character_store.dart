import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/vocation.dart';

class CharacterStore extends ChangeNotifier {
  final List<Character> _characters = [
    Character(
      name: 'Abdi Sembada',
      slogan: 'Write Code, Play Games, Hug Wife, Sleep Late, Repeat!',
      vocation: Vocation.wizard,
      id: "1",
    ),
    Character(
      name: 'Yulita Susilowati',
      slogan: 'Eat, Eat, Eat, get money from husband',
      vocation: Vocation.ninja,
      id: "2",
    ),
    Character(
      name: 'Danu Aditya',
      slogan: 'Fire In The Hole!',
      vocation: Vocation.raider,
      id: "3",
    ),
  ];

  get characters => _characters;

  // add character
  void addCharacter(Character character) {
    _characters.add(character);
    // Revalidate the listeners to update the UI
    notifyListeners();
  }
}
