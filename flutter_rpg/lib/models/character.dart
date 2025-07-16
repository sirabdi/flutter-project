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
  final Vocation vocation;
  final String name;
  final String slogan;
  final String id;
  bool _isFav = false;

  void toggleFav() {
    _isFav = !_isFav;
  }
}
