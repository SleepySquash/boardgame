import '/domain/model/card.dart';

class Elf extends Card with Door, Equipable, Race {
  @override
  String get name => 'Elf';
}

class Dwarf extends Card with Door, Equipable, Race {
  @override
  String get name => 'Dwarf';
}

class Ork extends Card with Door, Equipable, Race {
  @override
  String get name => 'Ork';
}
