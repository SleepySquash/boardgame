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

class Lich extends Card with Door, Enemy {
  @override
  String get name => 'Lich';

  @override
  String? get asset => 'door/enemy/lich.png';

  @override
  int get level => 22;

  @override
  int get treasures => 3;

  @override
  int get levels => 2;
}

class Imp extends Card with Door, Enemy {
  @override
  String get name => 'Imp';

  @override
  String get description => 'A small demon';

  @override
  String? get asset => 'door/enemy/imp.png';

  @override
  int get level => 7;

  @override
  int get treasures => 1;

  @override
  int get levels => 1;
}

class BigImp extends Card with Door, Enemy {
  @override
  String get name => 'Big Imp';

  @override
  String get description => 'A big scary demon';

  @override
  String? get asset => 'door/enemy/big_imp.png';

  @override
  int get level => 15;

  @override
  int get treasures => 2;

  @override
  int get levels => 1;
}

class Cast extends Card with Door, Enemy {
  @override
  String get name => 'Cast';

  @override
  String get description => 'A scary cast';

  @override
  String? get asset => 'door/enemy/cast.png';

  @override
  int get level => 8;

  @override
  int get treasures => 1;

  @override
  int get levels => 1;
}

class Mummy extends Card with Door, Enemy {
  @override
  String get name => 'Mummy';

  @override
  String get description => 'A mummy from Egypt';

  @override
  String? get asset => 'door/enemy/mummy.png';

  @override
  int get level => 8;

  @override
  int get treasures => 1;

  @override
  int get levels => 1;
}

class WildTroll extends Card with Door, Enemy {
  @override
  String get name => 'Wild Troll';

  @override
  String get description => 'He is looks dangerous';

  @override
  String? get asset => 'door/enemy/wild_troll.png';

  @override
  int get level => 10;

  @override
  int get treasures => 2;

  @override
  int get levels => 1;
}

class Ogr extends Card with Door, Enemy {
  @override
  String get name => 'Ogr';

  @override
  String get description => 'HULK';

  @override
  String? get asset => 'door/enemy/ogr.png';

  @override
  int get level => 13;

  @override
  int get treasures => 2;

  @override
  int get levels => 1;
}

class StoneGolem extends Card with Door, Enemy {
  @override
  String get name => 'Stone Golem';

  @override
  String get description => 'STONE HULK';

  @override
  String? get asset => 'door/enemy/stone_golem.png';

  @override
  int get level => 15;

  @override
  int get treasures => 2;

  @override
  int get levels => 1;
}

class Gargoly extends Card with Door, Enemy {
  @override
  String get name => 'Gargoly';

  @override
  String get description => 'none';

  @override
  String? get asset => 'door/enemy/gargoly.png';

  @override
  int get level => 10;

  @override
  int get treasures => 1;

  @override
  int get levels => 1;
}

class WaterGirlMonster extends Card with Door, Enemy {
  @override
  String get name => 'Water Girl Monster';

  @override
  String get description => 'none';

  @override
  String? get asset => 'door/enemy/water_girl_monster.png';

  @override
  int get level => 8;

  @override
  int get treasures => 1;

  @override
  int get levels => 1;
}

class StrangeWolf extends Card with Door, Enemy {
  @override
  String get name => 'Strange Wolf';

  @override
  String get description => 'none';

  @override
  String? get asset => 'door/enemy/strange_wolf.png';

  @override
  int get level => 9;

  @override
  int get treasures => 1;

  @override
  int get levels => 1;
}

class AngryMage extends Card with Door, Enemy {
  @override
  String get name => 'Angry Mage';

  @override
  String get description => 'none';

  @override
  String? get asset => 'door/enemy/angry_mage.png';

  @override
  int get level => 11;

  @override
  int get treasures => 1;

  @override
  int get levels => 1;
}

class Necromant extends Card with Door, Enemy {
  @override
  String get name => 'Necromant';

  @override
  String get description => 'none';

  @override
  String? get asset => 'door/enemy/necromant.png';

  @override
  int get level => 13;

  @override
  int get treasures => 2;

  @override
  int get levels => 1;
}

class Dracula extends Card with Door, Enemy {
  @override
  String get name => 'Dracula';

  @override
  String get description => 'none';

  @override
  String? get asset => 'door/enemy/dracula.png';

  @override
  int get level => 17;

  @override
  int get treasures => 2;

  @override
  int get levels => 1;
}
