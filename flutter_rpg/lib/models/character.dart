import 'package:flutter_rpg/models/skill.dart';
import 'package:flutter_rpg/models/stats.dart';
import 'package:flutter_rpg/models/vocation.dart';

class Character with Stats {
  // constructor
  Character({
    required this.name,
    required this.slogan,
    required this.vocation,
    required this.id,
  });

  // field
  final Set<Skill> skills = {};
  final Vocation vocation;
  final String name;
  final String slogan;
  final String id;
  bool _isFav = false;

  // getters
  get isFav => _isFav;

  void toggleFav() {
    _isFav = !_isFav;
  }

  void updateSkill(Skill skill) {
    skills.clear();
    skills.add(skill);
  }
}

List<Character> characters = [
  Character(
    name: 'Abdi Sembada',
    slogan: 'Write Code, Play Games, Hug Wife, Sleep Late, Repeat!',
    vocation: Vocation.wizard,
    id: "1461404721",
  ),
  Character(
    name: 'Yulita Susilowati',
    slogan: 'Eat, Eat, Eat, get money from husband',
    vocation: Vocation.ninja,
    id: "1461404720",
  ),
  Character(
    name: 'Danu Aditya',
    slogan: 'Fire In The Hole!',
    vocation: Vocation.raider,
    id: "1461404719",
  ),
];
