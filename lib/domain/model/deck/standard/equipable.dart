import '/domain/model/card.dart';

class WoodenHelmet extends Card with Treasure, Equipable, Head {
  @override
  String get name => 'Wooden Helmet';

  @override
  int get bonus => 1;
}

class WoodenArmor extends Card with Treasure, Equipable, Torso {
  @override
  String get name => 'Wooden Armor';

  @override
  int get bonus => 1;
}

class WoodenShoes extends Card with Treasure, Equipable, Shoes {
  @override
  String get name => 'Wooden Shoes';

  @override
  int get bonus => 1;
}

class IronSword extends Card with Treasure, Equipable, LArm, RArm {
  @override
  String get name => 'Iron Sword';

  @override
  int get bonus => 3;
}
