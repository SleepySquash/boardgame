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
