import 'package:cloud_firestore/cloud_firestore.dart';
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
    print('run toggleFav!');
    _isFav = !_isFav;
  }

  void updateSkill(Skill skill) {
    skills.clear();
    skills.add(skill);
  }

  // character to firestore (map)
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'slogan': slogan,
      'isFav': _isFav,
      'vocation': vocation.toString(),
      'skills': skills.map((skill) => skill.toString()).toList(),
      'stats': statsAsMap,
      'points': points,
    };
  }

  // character from firestore
  factory Character.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    // get data from snapshot
    final data = snapshot.data()!;

    // create character from data
    Character character = Character(
      name: data['name'] as String,
      slogan: data['slogan'] as String,
      id: snapshot.id,
      vocation: Vocation.values.firstWhere(
        (v) => v.toString() == data['vocation'],
        orElse: () => Vocation.raider,
      ),
    );

    // update skills
    for (String id in data['skills']) {
      Skill skill = allSkills.firstWhere(
        (element) => element.id == id,
        orElse: () => allSkills.first,
      );
      character.updateSkill(skill);
    }

    // set favorite status
    if (data['isFav'] == true) {
      character.toggleFav();
    }

    // assign stats & points
    character.setStats(points: data['points'], stats: data['stats']);

    return character;
  }
}

List<Character> characters = [];
