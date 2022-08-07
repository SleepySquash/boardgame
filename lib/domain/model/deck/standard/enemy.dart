import '/domain/model/card.dart';

class TerribleMonkey extends Card with Door, Enemy {
  @override
  String get name => 'Terrible Monkey';

  @override
  String? get asset => 'door/enemy/monkey.jpg';

  @override
  int get level => 3;
}

class NotTerribleMonkey extends Card with Door, Enemy {
  @override
  String get name => 'Not Terrible Monkey';

  @override
  String? get asset => 'door/enemy/monkey.jpg';

  @override
  int get level => 1;
}

class Yor extends Card with Door, Enemy {
  @override
  String get name => 'Yor';

  @override
  String get description => 'She seems to be happy. For now.';

  @override
  String? get asset => 'door/enemy/yor.jpg';

  @override
  int get level => 3;
}

class AngryYor extends Card with Door, Enemy {
  @override
  String get name => 'Yor';

  @override
  String get description =>
      'Now she\'s pissed off, you never should\'ve insulted Anya.';

  @override
  String? get asset => 'door/enemy/yor_angry.jpg';

  @override
  int get level => 24;

  @override
  int get treasures => 3;

  @override
  int get levels => 2;
}

class Zombie extends Card with Door, Enemy {
  @override
  String get name => 'Zombie';

  @override
  String get description => 'He wants to eat your brain';

  @override
  String? get asset => 'door/enemy/zombie.png';

  @override
  int get level => 6;

  @override
  int get treasures => 1;

  @override
  int get levels => 1;
}

class ZombieWarrior extends Card with Door, Enemy {
  @override
  String get name => 'Zombie Warrior';

  @override
  String get description => 'He wants to eat your brain x2';

  @override
  String? get asset => 'door/enemy/zombie_warrior.png';

  @override
  int get level => 12;

  @override
  int get treasures => 2;

  @override
  int get levels => 1;
}
