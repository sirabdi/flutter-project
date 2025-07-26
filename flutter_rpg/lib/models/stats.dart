mixin Stats {
  int _points = 10;
  int _health = 10;
  int _attack = 10;
  int _defense = 10;
  int _skill = 10;

  // getters
  int get points => _points;

  Map<String, int> get statsAsMap => {
    'health': _health,
    'attack': _attack,
    'defense': _defense,
    'skill': _skill,
  };

  List<Map<String, String>> get statsAsFormattedList => [
    {'title': 'health', 'value': _health.toString()},
    {'title': 'attack', 'value': _attack.toString()},
    {'title': 'defense', 'value': _defense.toString()},
    {'title': 'skill', 'value': _skill.toString()},
  ];

  // methods
  void increaseStat(String stat) {
    if (_points > 0) {
      if (stat == 'health') {
        _health++;
      }
      if (stat == 'attack') {
        _attack++;
      }
      if (stat == 'defense') {
        _defense++;
      }
      if (stat == 'skill') {
        _skill++;
      }
      _points--;
    }
  }

  // methods
  void decreaseStat(String stat) {
    if (stat == 'health' && _health > 10) {
      _health--;
      _points++;
    }
    if (stat == 'attack' && _attack > 10) {
      _attack--;
      _points++;
    }
    if (stat == 'defense' && _defense > 10) {
      _defense--;
      _points++;
    }
    if (stat == 'skill' && _skill > 10) {
      _skill--;
      _points++;
    }
  }

  // update stats on firestore
  void setStats({required int points, required Map<String, dynamic> stats}) {
    _points = points;

    _health = stats['health'] ?? 10;
    _attack = stats['attack'] ?? 10;
    _defense = stats['defense'] ?? 10;
    _skill = stats['skill'] ?? 10;
  }
}
