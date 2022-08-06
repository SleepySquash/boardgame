class Card {
  String get name => 'Card';
  String? get description => null;
  String? get asset => null;
}

mixin Equipable on Card {
  int get bonus => 1;
  bool get isBig => false;
}

mixin Door on Card {}

mixin EnemyAddition on Door {}

mixin Enemy on Door {
  int get level => 1;
  int get treasures => 1;
  int get levels => 1;
}

mixin Curse on Door {}

mixin Bonus on Door {
  int get bonus => 1;
}

mixin Race on Equipable {
  @override
  int get bonus => 0;
}

mixin Class on Equipable {
  @override
  int get bonus => 0;
}

mixin Treasure on Card {}

mixin LevelAddition on Treasure {}

mixin Head on Equipable {}

mixin Torso on Equipable {}

mixin Shoes on Equipable {}

mixin Hand on Equipable {
  bool get twoHand => false;
}

mixin Misc on Equipable {}
