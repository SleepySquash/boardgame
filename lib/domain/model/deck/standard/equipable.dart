import '/domain/model/card.dart';

class WoodenHelmet extends Card with Treasure, Equipable, Head {
  @override
  String get name => 'Wooden Helmet';

  @override
  int get bonus => 1;

  @override
  String get description => 'Adds +1 power';
}

class WoodenArmor extends Card with Treasure, Equipable, Torso {
  @override
  String get name => 'Wooden Armor';

  @override
  int get bonus => 1;

  @override
  String get description => 'Adds +1 power';
}

class WoodenShoes extends Card with Treasure, Equipable, Shoes {
  @override
  String get name => 'Wooden Shoes';

  @override
  int get bonus => 1;

  @override
  String get description => 'Adds +1 power';
}

class IronSword extends Card with Treasure, Equipable, Hand {
  @override
  String get name => 'Iron Sword';

  @override
  int get bonus => 3;

  @override
  String get description => 'Adds +3 power';

  @override
  String? get asset => 'treasure/iron_sword.png';
}

class IronAxe extends Card with Treasure, Equipable, Hand {
  @override
  String get name => 'Iron Axe';

  @override
  int get bonus => 4;

  @override
  String get description => 'Adds +4 power';

  @override
  String? get asset => 'treasure/iron_axe.png';
}
