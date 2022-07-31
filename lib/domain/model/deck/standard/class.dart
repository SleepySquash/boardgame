import '/domain/model/card.dart';

class Warrior extends Card with Door, Equipable, Class {
  @override
  String get name => 'Warrior';
}

class Wizard extends Card with Door, Equipable, Class {
  @override
  String get name => 'Wizard';
}
